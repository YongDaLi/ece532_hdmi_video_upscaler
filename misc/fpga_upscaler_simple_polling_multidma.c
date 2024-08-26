
#include "xaxidma.h"
#include "xparameters.h"
#include "xaxivdma.h"
#include "sleep.h"


#define INPUT_FRAME_WIDTH			1280
#define INPUT_FRAME_HEIGHT			720
#define OUTPUT_FRAME_WIDTH			1280
#define OUTPUT_FRAME_HEIGHT			720
#define BUF_ADDR_OFFSET             0x80000

#define PIXEL_SIZE_BYTE				3

#define INPUT_CHUNK_WIDTH_PX        256
#define INPUT_CHUNK_HEIGHT_PX       4
#define NUM_CHUNKS_PER_ROW          (INPUT_FRAME_WIDTH / INPUT_CHUNK_WIDTH_PX)
#define NUM_CHUNKS_PER_COL          (INPUT_FRAME_HEIGHT / INPUT_CHUNK_HEIGHT_PX)
#define NUM_CHUNKS_PER_FRAME        (NUM_CHUNKS_PER_COL * NUM_CHUNKS_PER_ROW)
#define OUTPUT_CHUNK_WIDTH_PX       (OUTPUT_FRAME_WIDTH / NUM_CHUNKS_PER_ROW)
#define OUTPUT_CHUNK_HEIGHT_PX      (OUTPUT_FRAME_HEIGHT / NUM_CHUNKS_PER_COL)

#define PADDING						(1920 * 1080 * 3)
#define OUTPUT_FB_0                 (XPAR_MIG7SERIES_0_BASEADDR + BUF_ADDR_OFFSET)
#define OUTPUT_FB_1                 (OUTPUT_FB_0 + OUTPUT_FRAME_WIDTH * OUTPUT_FRAME_HEIGHT * PIXEL_SIZE_BYTE + PADDING)  // already aligned to 1024 address

#define INPUT_FB_0                  (OUTPUT_FB_1 + OUTPUT_FRAME_WIDTH * OUTPUT_FRAME_HEIGHT * PIXEL_SIZE_BYTE + PADDING)
#define INPUT_FB_1                  (INPUT_FB_0 + INPUT_FRAME_WIDTH * INPUT_FRAME_HEIGHT * PIXEL_SIZE_BYTE + PADDING) // for storing last input frame

void fetch_chunk(XAxiDma *dma, u32 fb_base_addr, u32 row, u32 col, u32 chunk_width, u32 chunk_height);
void write_chunk(XAxiDma *dma, u32 fb_base_addr, u32 row, u32 col, u32 chunk_width, u32 chunk_height);
void fetch_chunk_parallel(XAxiDma *Dma, u32 fb_base_addr, u32 row, u32 col, u32 chunk_width, u32 chunk_height);
void write_chunk_parallel(XAxiDma *Dma, u32 fb_base_addr, u32 row, u32 col, u32 chunk_width, u32 chunk_height);
void setup_vdma();
void print_vdma_status();
void setup_dma(XAxiDma *Dma, XAxiDma_Config **DmaConfig, UINTPTR DMA_BASEADDR);
void gpio_new_frame_ISR(void);
void dma_super_simple_transfer_to(XAxiDma *InstancePtr, UINTPTR BuffAddr, u32 Length);
void dma_super_simple_transfer_from(XAxiDma *InstancePtr, UINTPTR BuffAddr, u32 Length);

volatile uint32_t *gpio_membase = (uint32_t *)(XPAR_AXI_GPIO_0_BASEADDR);
volatile uint32_t *vdma_membase = (uint32_t *)(XPAR_AXI_VDMA_0_BASEADDR);
volatile uint32_t chunk_ctr;

int main(){
    // DMAs
    XAxiDma Dma[4];
	XAxiDma_Config *DmaConfig[4];

    // setup DMAs
    setup_dma(&Dma[0], &DmaConfig[0], (UINTPTR) XPAR_AXI_DMA_0_BASEADDR);
    setup_dma(&Dma[1], &DmaConfig[1], (UINTPTR) XPAR_AXI_DMA_1_BASEADDR);
    setup_dma(&Dma[2], &DmaConfig[2], (UINTPTR) XPAR_AXI_DMA_2_BASEADDR);
    setup_dma(&Dma[3], &DmaConfig[3], (UINTPTR) XPAR_AXI_DMA_3_BASEADDR);

	// start VDMA
	setup_vdma();

    // enable interrupts
    microblaze_register_handler((XInterruptHandler)gpio_new_frame_ISR, (void *)0);
    microblaze_enable_interrupts();
    setup_gpio_interrupts();

    chunk_ctr = 0;
	while (1) {
        u32 input_row = ((chunk_ctr * INPUT_CHUNK_WIDTH_PX) / INPUT_FRAME_WIDTH) * INPUT_CHUNK_HEIGHT_PX;
        u32 input_col = (chunk_ctr * INPUT_CHUNK_WIDTH_PX) % INPUT_FRAME_WIDTH;

        u32 output_row = ((chunk_ctr * OUTPUT_CHUNK_WIDTH_PX) / OUTPUT_FRAME_WIDTH) * OUTPUT_CHUNK_HEIGHT_PX;
        u32 output_col = (chunk_ctr * OUTPUT_CHUNK_WIDTH_PX) % OUTPUT_FRAME_WIDTH;

        // fetch chunk from DDR and send to processing via Dma0
        // fetch_chunk(&Dma0, INPUT_FB_0, input_row, input_col, INPUT_CHUNK_WIDTH_PX, INPUT_CHUNK_HEIGHT_PX);
        // fetch_chunk(&Dma0, INPUT_FB_1, input_row, input_col, INPUT_CHUNK_WIDTH_PX, INPUT_CHUNK_HEIGHT_PX);

        // // fetch chunk from new input frame in DDR and send to input frame 1 for buffering
        // fetch_chunk(&Dma1, INPUT_FB_0, input_row, input_col, INPUT_CHUNK_WIDTH_PX, INPUT_CHUNK_HEIGHT_PX);
        // write_chunk(&Dma1, INPUT_FB_1, input_row, input_col, INPUT_CHUNK_WIDTH_PX, INPUT_CHUNK_HEIGHT_PX);

        // // wait for processing results
        // usleep(10);

        // write chunk from processing to DDR
        // write_chunk(&Dma0, OUTPUT_FB_0, output_row, output_col, OUTPUT_CHUNK_WIDTH_PX, OUTPUT_CHUNK_HEIGHT_PX);
        // write_chunk(&Dma0, OUTPUT_FB_1, output_row, output_col, OUTPUT_CHUNK_WIDTH_PX, OUTPUT_CHUNK_HEIGHT_PX);



        chunk_ctr++;
        fetch_chunk_parallel(Dma, INPUT_FB_0, input_row, input_col, INPUT_CHUNK_WIDTH_PX, INPUT_CHUNK_HEIGHT_PX);
        write_chunk_parallel(Dma, OUTPUT_FB_0, output_row, output_col, OUTPUT_CHUNK_WIDTH_PX, OUTPUT_CHUNK_HEIGHT_PX);

        while (chunk_ctr >= NUM_CHUNKS_PER_FRAME) {
            // wait for next HDMI input frame to start
            usleep(100);
        }
	}
}

void fetch_chunk(XAxiDma *dma, u32 fb_base_addr, u32 row, u32 col, u32 chunk_width, u32 chunk_height) {
    u32 status;
    u32 addr;
    addr = fb_base_addr + row * INPUT_FRAME_WIDTH * PIXEL_SIZE_BYTE + col * PIXEL_SIZE_BYTE;
    for (u32 i = 0; i < chunk_height; i++) {
        status = XAxiDma_SimpleTransfer(dma, addr + i * INPUT_FRAME_WIDTH * PIXEL_SIZE_BYTE, chunk_width * PIXEL_SIZE_BYTE, XAXIDMA_DMA_TO_DEVICE);
        while (status != XST_SUCCESS) {
            status = XAxiDma_SimpleTransfer(dma, addr + i * INPUT_FRAME_WIDTH * PIXEL_SIZE_BYTE, chunk_width * PIXEL_SIZE_BYTE, XAXIDMA_DMA_TO_DEVICE);
        }
    }
}

void write_chunk(XAxiDma *dma, u32 fb_base_addr, u32 row, u32 col, u32 chunk_width, u32 chunk_height) {
    u32 status;
    u32 addr;
    addr = fb_base_addr + row * OUTPUT_FRAME_WIDTH * PIXEL_SIZE_BYTE + col * PIXEL_SIZE_BYTE;
    for (u32 i = 0; i < chunk_height; i++) {
        status = XAxiDma_SimpleTransfer(dma, addr + i * OUTPUT_FRAME_WIDTH * PIXEL_SIZE_BYTE, chunk_width * PIXEL_SIZE_BYTE, XAXIDMA_DEVICE_TO_DMA);
        while (status != XST_SUCCESS) {
            status = XAxiDma_SimpleTransfer(dma, addr + i * OUTPUT_FRAME_WIDTH * PIXEL_SIZE_BYTE, chunk_width * PIXEL_SIZE_BYTE, XAXIDMA_DEVICE_TO_DMA);
        }
    }
}

void fetch_chunk_parallel(XAxiDma *dma, u32 fb_base_addr, u32 row, u32 col, u32 chunk_width, u32 chunk_height) {
    u32 status;
    u32 addr;
    addr = fb_base_addr + row * INPUT_FRAME_WIDTH * PIXEL_SIZE_BYTE + col * PIXEL_SIZE_BYTE;
    for (u32 i = 0; i < chunk_height; i++) {
		dma_super_simple_transfer_to(&dma[i], addr, chunk_width * PIXEL_SIZE_BYTE);
		addr += INPUT_FRAME_WIDTH * PIXEL_SIZE_BYTE;
    }
}

void write_chunk_parallel(XAxiDma *dma, u32 fb_base_addr, u32 row, u32 col, u32 chunk_width, u32 chunk_height) {
    u32 status;
    u32 addr;
    addr = fb_base_addr + row * OUTPUT_FRAME_WIDTH * PIXEL_SIZE_BYTE + col * PIXEL_SIZE_BYTE;
    for (u32 i = 0; i < chunk_height; i++) {
		dma_super_simple_transfer_from(&dma[i], addr, chunk_width * PIXEL_SIZE_BYTE);
		addr += OUTPUT_FRAME_WIDTH * PIXEL_SIZE_BYTE;
    }
}

void print_vdma_status() {
    uint32_t vdma_ctrl = vdma_membase[0x30 / sizeof(uint32_t)];
    uint32_t vdma_status = vdma_membase[0x34 / sizeof(uint32_t)];
    xil_printf("ctrl %x status %x\n", vdma_ctrl, vdma_status);
}

void setup_vdma() {
	// Reset VDMA
	print_vdma_status();
    vdma_membase[0x30 / sizeof(uint32_t)] = 1 << 2;
    uint32_t cr = 0;
    do {
        cr = vdma_membase[0x30 / sizeof(uint32_t)];
    } while (cr & (1 << 2));
    vdma_membase[0x34 / sizeof(uint32_t)] = 0xFFFF;
    print_vdma_status();

    /* MM2S_START_ADDRESS */
    vdma_membase[0x5C / sizeof(uint32_t)] = OUTPUT_FB_0;
    //    vdma_membase[0x60 / sizeof(uint32_t)] = (uint32_t) (void *) OUTPUT_FB_0;
	// TODO: swap back to OUTPUT_FB_1 when image processing is ready
    vdma_membase[0x60 / sizeof(uint32_t)] = OUTPUT_FB_0;

    /* MM2S_FRMDLY_STRIDE */
    vdma_membase[0x58 / sizeof(uint32_t)] = OUTPUT_FRAME_WIDTH * PIXEL_SIZE_BYTE;
    // MM2S_HSIZE (in bytes)
    vdma_membase[0x54 / sizeof(uint32_t)] = 1920 /* TODO: OUTPUT_FRAME_WIDTH */ * PIXEL_SIZE_BYTE;
    // MM2S_VSIZE (number of lines) dummy value
    vdma_membase[0x50 / sizeof(uint32_t)] = 0;
    // MM2S_VDMACR
    vdma_membase[0x00 / sizeof(uint32_t)] = (1 << 1) | (1); /* set RS=1 (run), Circular_Park=1 (Circular mode) */
    // MM2S_VSIZE (number of lines)
    vdma_membase[0x50 / sizeof(uint32_t)] = 1080 /* TODO: OUTPUT_FRAME_HEIGHT */;

    /* START_ADDRESS1 */
    // trick the S2MM vDMA to cycle between the same 2 frame IDs
    vdma_membase[0xAC / sizeof(uint32_t)] = INPUT_FB_0;
    vdma_membase[0xB0 / sizeof(uint32_t)] = INPUT_FB_0;  // second frame buffer

    /* FRMDLY_STRIDE */
    vdma_membase[0xA8 / sizeof(uint32_t)] = INPUT_FRAME_WIDTH * PIXEL_SIZE_BYTE;
    /* HSIZE (in bytes) */
    vdma_membase[0xA4 / sizeof(uint32_t)] = INPUT_FRAME_WIDTH * PIXEL_SIZE_BYTE;
    /* VSIZE (in lines) */
    vdma_membase[0xA0 / sizeof(uint32_t)] = 0;
    /* VDMACR */
    vdma_membase[0x30 / sizeof(uint32_t)] = 0x0003; /* set RS=1 (run), Circular_Park=1 (Circular mode) */

    print_vdma_status();

    /* VSIZE (in lines) */
    vdma_membase[0xA0 / sizeof(uint32_t)] = INPUT_FRAME_HEIGHT;

    print_vdma_status();
}

void setup_gpio_interrupts(void){
    // enable GPIO interrupts
    // 1. configure the port as input by writing the corresponding bit in the GPIOx_TRI register with value of 1
    // we're using GPIO (no number, aka the first one), not GPIO_2
    gpio_membase[0x0004 / sizeof(uint32_t)] = 0x3F;  // GPIO_TRI, set all 6 inputs to 1 = 0b11 1111

    // 2. enable the channel interrupt by setting the corresponding bit in the IP Interrupt Enable Register;
    // also enable the global interrupt, by setting bit 31 of the Global Interrupt Register to 1.
    gpio_membase[0x011C / sizeof(uint32_t)] = gpio_membase[0x011C / sizeof(uint32_t)] | (1 << 31);  // GIER, global interrupt enable register
    gpio_membase[0x0128 / sizeof(uint32_t)] = gpio_membase[0x0128 / sizeof(uint32_t)] | 0x1;        // IP IER, channel interrupt enable, enable channel interrupt
}

void setup_dma(XAxiDma *Dma, XAxiDma_Config **DmaConfig, UINTPTR DMA_BASEADDR) {
	*DmaConfig = XAxiDma_LookupConfigBaseAddr(DMA_BASEADDR);
	u32 status = XAxiDma_CfgInitialize(Dma, *DmaConfig);
	if(status != XST_SUCCESS){
		print("DMA initialization failed\n");
		return;
	}
	print("DMA initialization success..\n");
}

void gpio_new_frame_ISR() {
    // usleep(100);
    chunk_ctr = 0;

    // 3. When an interrupt is received, read the corresponding bit in the GPIOx_DATA register.
    // Clear the status in the IP Interrupt Status Register by writing the corresponding bit with the value of 1.
    //  Toggle-On-Write (TOW) access toggles the status of the bit when a value of 1 is written to the corresponding bit.
    gpio_membase[0x0120 / sizeof(uint32_t)] = 0x01;
}

inline void dma_super_simple_transfer_to(XAxiDma *InstancePtr, UINTPTR BuffAddr, u32 Length) {
	XAxiDma_WriteReg(InstancePtr->TxBdRing.ChanBase,
			XAXIDMA_SRCADDR_OFFSET, LOWER_32_BITS(BuffAddr));

	XAxiDma_WriteReg(InstancePtr->TxBdRing.ChanBase,
			XAXIDMA_CR_OFFSET,
			XAxiDma_ReadReg(
				InstancePtr->TxBdRing.ChanBase,
				XAXIDMA_CR_OFFSET)| XAXIDMA_CR_RUNSTOP_MASK);

	XAxiDma_WriteReg(InstancePtr->TxBdRing.ChanBase,
			XAXIDMA_BUFFLEN_OFFSET, Length);
}

inline void dma_super_simple_transfer_from(XAxiDma *InstancePtr, UINTPTR BuffAddr, u32 Length) {
	XAxiDma_WriteReg(InstancePtr->RxBdRing[0].ChanBase,
			 XAXIDMA_DESTADDR_OFFSET, LOWER_32_BITS(BuffAddr));
	XAxiDma_WriteReg(InstancePtr->RxBdRing[0].ChanBase,
			XAXIDMA_CR_OFFSET,
		XAxiDma_ReadReg(InstancePtr->RxBdRing[0].ChanBase,
		XAXIDMA_CR_OFFSET)| XAXIDMA_CR_RUNSTOP_MASK);
	XAxiDma_WriteReg(InstancePtr->RxBdRing[0].ChanBase,
				XAXIDMA_BUFFLEN_OFFSET, Length);
}
