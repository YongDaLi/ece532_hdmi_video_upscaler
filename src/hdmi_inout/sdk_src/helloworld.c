/******************************************************************************
 *
 * Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Use of the Software is limited solely to applications:
 * (a) running on a Xilinx device, or
 * (b) that interact with a Xilinx device through a bus or interconnect.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
 * OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 * Except as contained in this notice, the name of the Xilinx shall not be used
 * in advertising or otherwise to promote the sale, use or other dealings in
 * this Software without prior written authorization from Xilinx.
 *
 ******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>

#include "platform.h"
#include "xaxivdma.h"
#include "xil_exception.h"
#include "xil_printf.h"

#define OUTPUT_FB_0 (XPAR_MIG7SERIES_0_BASEADDR + 0x800000)
#define OUTPUT_FB_1 (XPAR_MIG7SERIES_0_BASEADDR + 0x800000)  // already aligned to 1024 address
// #define OUTPUT_FB_1 (XPAR_MIG7SERIES_0_BASEADDR + 0x800000 + 1920 * 1080 * 3)  // already aligned to 1024 address

// there's actually 2 frame buffers, but give them the same address
// #define INPUT_FB_0 (XPAR_MIG7SERIES_0_BASEADDR + 0x800000 + 1920 * 1080 * 3 * 2)
#define INPUT_FB_0 (XPAR_MIG7SERIES_0_BASEADDR + 0x800000)

// code for main() is stored at ddr3_membase 0x00, so start the DMA working area a bit after 0x00
volatile uint8_t *ddr3_membase = (uint8_t *)(XPAR_MIG7SERIES_0_BASEADDR + 0x800000);
volatile uint32_t *vdma_membase = (uint32_t *)(XPAR_AXI_VDMA_0_BASEADDR);
volatile uint32_t *gpio_membase = (uint32_t *)(XPAR_AXI_GPIO_0_BASEADDR);

// global
long count = 0;

void myISR(void);
void print_vdma_status(void);

void print_vdma_status(void) {
    uint32_t vdma_ctrl = vdma_membase[0x30 / sizeof(uint32_t)];
    uint32_t vdma_status = vdma_membase[0x34 / sizeof(uint32_t)];
    xil_printf("ctrl %x status %x\n", vdma_ctrl, vdma_status);
}

void myISR(void) {
    xil_printf("ISR hit!, count=%d\n", count);

    // clear interrupt by writing 1 to it
    //  Toggle-On-Write (TOW) access toggles the status of the bit when a value of 1 is written to the corresponding bit.
    gpio_membase[0x0120 / sizeof(uint32_t)] = gpio_membase[0x0120 / sizeof(uint32_t)] | 0x01;

    count++;
}

int main() {
    init_platform();

    puts("hello world");
    memset(ddr3_membase, 0xFF, 1280 * 720 * sizeof(uint32_t));

    print_vdma_status();
    // clear reset in VDMA
    vdma_membase[0x30 / sizeof(uint32_t)] = 1 << 2;
    uint32_t cr = 0;
    do {
        cr = vdma_membase[0x30 / sizeof(uint32_t)];
    } while (cr & (1 << 2));
    vdma_membase[0x34 / sizeof(uint32_t)] = 0xFFFF;
    print_vdma_status();

    /*
    XVtc vtc;
    XVtc_Config *vtc_cfg = XVtc_LookupConfig(0);
    XVtc_CfgInitialize(&vtc, vtc_cfg, vtc_cfg->BaseAddress);
    XVtc_EnableDetector(&vtc);
    XVtc_Timing timing;
    */

    /*
    int res;
    print_vdma_status();

    XAxiVdma vdma_in;
    XAxiVdma_Config *vdma_cfg = XAxiVdma_LookupConfig(0);
    res = XAxiVdma_CfgInitialize(&vdma_in, vdma_cfg, vdma_cfg->BaseAddress);
    while (res != XST_SUCCESS);

    print_vdma_status();

    XAxiVdma_DmaSetup vdma_write = {
                .VertSizeInput = 720,
                        .HoriSizeInput = 1280 * 3,
                        .Stride = 1280 * sizeof(uint32_t),
                .EnableCircularBuf = 1,
                        .EnableSync = 1,
                        .PointNum = 0,
                        .EnableFrameCounter = 0,
                        .FixedFrameStoreAddr = 0,
    };
    res = XAxiVdma_DmaConfig(&vdma_in, XAXIVDMA_WRITE, &vdma_write);
    while (res != XST_SUCCESS);

    UINTPTR fb_addrs[] = { (void *) ddr3_membase, };
    res = XAxiVdma_DmaSetBufferAddr(&vdma_in, XAXIVDMA_WRITE, fb_addrs);
    while (res != XST_SUCCESS);

    res = XAxiVdma_DmaStart(&vdma_in, XAXIVDMA_WRITE);
    while (res != XST_SUCCESS);
    */

    print_vdma_status();

    // ========== setup input frame vdma ===========
    /* MM2S_START_ADDRESS */
    vdma_membase[0x5C / sizeof(uint32_t)] = OUTPUT_FB_0;
    //    vdma_membase[0x60 / sizeof(uint32_t)] = (uint32_t) (void *) ddr3_membase;
    vdma_membase[0x60 / sizeof(uint32_t)] = OUTPUT_FB_1;

    /* MM2S_FRMDLY_STRIDE */
    vdma_membase[0x58 / sizeof(uint32_t)] = 1280 * 3;
    // MM2S_HSIZE (in bytes)
    vdma_membase[0x54 / sizeof(uint32_t)] = 1920 * 3;
    // MM2S_VSIZE (number of lines) dummy value
    vdma_membase[0x50 / sizeof(uint32_t)] = 0;
    // MM2S_VDMACR
    vdma_membase[0x00 / sizeof(uint32_t)] = (1 << 1) | (1); /* set RS=1 (run), Circular_Park=1 (Circular mode) */
    // MM2S_VSIZE (number of lines)
    vdma_membase[0x50 / sizeof(uint32_t)] = 1080;

    // ======== setup output frame vdma =============
    /* START_ADDRESS1 */
    // trick the S2MM vDMA to cycle between the same 2 frame IDs
    vdma_membase[0xAC / sizeof(uint32_t)] = (uint32_t)(void *)INPUT_FB_0;
    vdma_membase[0xB0 / sizeof(uint32_t)] = (uint32_t)(void *)INPUT_FB_0;  // second frame buffer

    /* FRMDLY_STRIDE */
    vdma_membase[0xA8 / sizeof(uint32_t)] = 1280 * 3;
    /* HSIZE (in bytes) */
    vdma_membase[0xA4 / sizeof(uint32_t)] = 1280 * 3;
    /* VSIZE (in lines) */
    vdma_membase[0xA0 / sizeof(uint32_t)] = 0;
    /* VDMACR */
    vdma_membase[0x30 / sizeof(uint32_t)] = 0x0003; /* set RS=1 (run), Circular_Park=1 (Circular mode) */

    print_vdma_status();

    /* VSIZE (in lines) */
    vdma_membase[0xA0 / sizeof(uint32_t)] = 720;

    print_vdma_status();

    // register microblaze hardware interrupts in software
    microblaze_register_handler((XInterruptHandler)myISR, (void *)0);
    microblaze_enable_interrupts();

    // enable GPIO interrupts
    // 1. configure the port as input by writing the corresponding bit in the GPIOx_TRI register with value of 1
    // we're using GPIO (no number, aka the first one), not GPIO_2
    gpio_membase[0x0004 / sizeof(uint32_t)] = 0x3F;  // GPIO_TRI, set all 6 inputs to 1 = 0b11 1111

    // 2. enable the channel interrupt by setting the corresponding bit in the IP Interrupt Enable Register;
    // also enable the global interrupt, by setting bit 31 of the Global Interrupt Register to 1.
    gpio_membase[0x011C / sizeof(uint32_t)] = gpio_membase[0x011C / sizeof(uint32_t)] | (1 << 31);  // GIER, global interrupt enable register
    gpio_membase[0x0128 / sizeof(uint32_t)] = gpio_membase[0x0128 / sizeof(uint32_t)] | 0x1;        // IP IER, channel interrupt enable, enable channel interrupt

    while (1) {
        // 3. When an interrupt is received, read the corresponding bit in the GPIOx_DATA register.
        // Clear the status in the IP Interrupt Status Register by writing the corresponding bit with the value of 1.
        if (gpio_membase[0x0120 / sizeof(uint32_t)] & 0x01) {
            //    manually poll
            //    xil_printf("GPIO interrupt!, count=%d, gpio_IP_IER=%x\n", count, (gpio_membase[0x0120 / sizeof(uint32_t)]) & 0x3F);
        }

        /*
        XVtc_GetDetectorTiming(&vtc, &timing);
        xil_printf("width: %d height: %d\n", timing.VActiveVideo, timing.HActiveVideo);
        */

        // print_vdma_status();
    }

    cleanup_platform();
    return 0;
}
