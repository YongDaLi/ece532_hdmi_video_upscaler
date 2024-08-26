#include "ap_int.h"
#include "ap_utils.h"

#define DMA_TX_OFFSET (0x00000000)
#define DMA_RX_OFFSET (0x00000030)
#define DMA0_BASE_ADDR (0x41E00000)
#define DMA0_TX_ADDR (DMA0_BASE_ADDR + DMA_TX_OFFSET)
#define DMA0_RX_ADDR (DMA0_BASE_ADDR + DMA_RX_OFFSET)
#define DMA1_BASE_ADDR (0x41E10000)
#define DMA1_TX_ADDR (DMA1_BASE_ADDR + DMA_TX_OFFSET)
#define DMA1_RX_ADDR (DMA1_BASE_ADDR + DMA_RX_OFFSET)

#define INPUT_FRAME_WIDTH			1280
#define INPUT_FRAME_HEIGHT			720
#define OUTPUT_FRAME_WIDTH			1920
#define OUTPUT_FRAME_HEIGHT			1080
#define BUF_ADDR_OFFSET             0x80000

#define PIXEL_SIZE_BYTE				3

#define INPUT_CHUNK_WIDTH_PX        128
#define INPUT_CHUNK_HEIGHT_PX       2
#define NUM_CHUNKS_PER_ROW          (INPUT_FRAME_WIDTH / INPUT_CHUNK_WIDTH_PX)
#define NUM_CHUNKS_PER_COL          (INPUT_FRAME_HEIGHT / INPUT_CHUNK_HEIGHT_PX)
#define NUM_CHUNKS_PER_FRAME        (NUM_CHUNKS_PER_COL * NUM_CHUNKS_PER_ROW)
#define OUTPUT_CHUNK_WIDTH_PX       (OUTPUT_FRAME_WIDTH / NUM_CHUNKS_PER_ROW)
#define OUTPUT_CHUNK_HEIGHT_PX      (OUTPUT_FRAME_HEIGHT / NUM_CHUNKS_PER_COL)

#define PADDING						(1920 * 1080 * 3)
#define OUTPUT_FB_0                 (0x80000000 + BUF_ADDR_OFFSET)
#define OUTPUT_FB_1                 (OUTPUT_FB_0 + OUTPUT_FRAME_WIDTH * OUTPUT_FRAME_HEIGHT * PIXEL_SIZE_BYTE + PADDING)  // already aligned to 1024 address

#define INPUT_FB_0                  (OUTPUT_FB_1 + OUTPUT_FRAME_WIDTH * OUTPUT_FRAME_HEIGHT * PIXEL_SIZE_BYTE + PADDING)
#define INPUT_FB_1                  (INPUT_FB_0 + INPUT_FRAME_WIDTH * INPUT_FRAME_HEIGHT * PIXEL_SIZE_BYTE + PADDING) // for storing last input frame

template <unsigned int offset>
void transfer(volatile unsigned int *dma, unsigned int addr, int length) {
    /* SA - Source Address */
    dma[(offset + 0x18) / 4] = addr;
    /* CR - Control Register */
    dma[(offset + 0x00) / 4] = 1; /* CR RUNSTOP */
    /* buff  */
    dma[(offset + 0x28) / 4] = length;

	/* wait until idle, reading SR - Status Register */
	while (!(dma[(offset + 0x04) / 4] & 0b10));
}

template <unsigned int offset, int frame_width>
void transfer_chunk(unsigned int *dma, unsigned int fb_base_addr, int row, int col, int chunk_width, int chunk_height) {
    unsigned int addr;
    addr = fb_base_addr + row * frame_width * PIXEL_SIZE_BYTE + col * PIXEL_SIZE_BYTE;
    for (int i = 0; i < chunk_height; i++) {
        transfer<offset>(dma, addr + i * frame_width * PIXEL_SIZE_BYTE, chunk_width * PIXEL_SIZE_BYTE);

		ap_wait_n(750);
    }
}

void dma_master_driver(unsigned int *dma0, unsigned int *dma1, ap_uint<1> frame_trigger) {
	#pragma HLS interface ap_ctrl_none port=return

    #pragma HLS INTERFACE m_axi depth=1 port=dma0 offset=off
    #pragma HLS INTERFACE m_axi depth=1 port=dma1 offset=off
    #pragma HLS INTERFACE ap_none port=frame_trigger

    // wait for new frame

	while (1) {
        ap_wait_until(frame_trigger);

        for (int chunk_ctr = 0; chunk_ctr < NUM_CHUNKS_PER_FRAME; chunk_ctr++) {
            int input_row = ((chunk_ctr * INPUT_CHUNK_WIDTH_PX) / INPUT_FRAME_WIDTH) * INPUT_CHUNK_HEIGHT_PX;
            int input_col = (chunk_ctr * INPUT_CHUNK_WIDTH_PX) % INPUT_FRAME_WIDTH;

            int output_row = ((chunk_ctr * OUTPUT_CHUNK_WIDTH_PX) / OUTPUT_FRAME_WIDTH) * OUTPUT_CHUNK_HEIGHT_PX;
            int output_col = (chunk_ctr * OUTPUT_CHUNK_WIDTH_PX) % OUTPUT_FRAME_WIDTH;

            // fetch chunk from DDR and send to processing via Dma0
            // fetch_chunk(&Dma0, INPUT_FB_0, input_row, input_col, INPUT_CHUNK_WIDTH_PX, INPUT_CHUNK_HEIGHT_PX);
            // fetch_chunk(&Dma0, INPUT_FB_1, input_row, input_col, INPUT_CHUNK_WIDTH_PX, INPUT_CHUNK_HEIGHT_PX);
            transfer_chunk<DMA0_TX_ADDR, INPUT_FRAME_WIDTH>(dma0, INPUT_FB_0, input_row, input_col, INPUT_CHUNK_WIDTH_PX, INPUT_CHUNK_HEIGHT_PX);
            // transfer_chunk<DMA0_TX_ADDR>(dma0, INPUT_FB_1, input_row, input_col, INPUT_CHUNK_WIDTH_PX, INPUT_CHUNK_HEIGHT_PX);

            // // fetch chunk from new input frame in DDR and send to input frame 1 for buffering
            // fetch_chunk(&Dma1, INPUT_FB_0, input_row, input_col, INPUT_CHUNK_WIDTH_PX, INPUT_CHUNK_HEIGHT_PX);
            // write_chunk(&Dma1, INPUT_FB_1, input_row, input_col, INPUT_CHUNK_WIDTH_PX, INPUT_CHUNK_HEIGHT_PX);

            // // wait for processing results
            // usleep(10);

            // write chunk from processing to DDR
            // write_chunk(&Dma0, OUTPUT_FB_0, output_row, output_col, OUTPUT_CHUNK_WIDTH_PX, OUTPUT_CHUNK_HEIGHT_PX);
            // write_chunk(&Dma0, OUTPUT_FB_1, output_row, output_col, OUTPUT_CHUNK_WIDTH_PX, OUTPUT_CHUNK_HEIGHT_PX);
            transfer_chunk<DMA0_RX_ADDR, OUTPUT_FRAME_WIDTH>(dma0, OUTPUT_FB_0, output_row, output_col, OUTPUT_CHUNK_WIDTH_PX, OUTPUT_CHUNK_HEIGHT_PX);
            // transfer_chunk<DMA0_RX_ADDR>(dma0, OUTPUT_FB_1, input_row, input_col, OUTPUT_CHUNK_WIDTH_PX, OUTPUT_CHUNK_HEIGHT_PX);
        }
	}
}

