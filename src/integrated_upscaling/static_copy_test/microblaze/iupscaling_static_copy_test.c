/*
 * dma_mm2reg_readwrite_test.c
 *
 *  Created on: Mar 29, 2023
 *      Author: hanle
 */

#include "xdma_mm2reg_upscale.h"
#include "xparameters.h"
#include "xil_printf.h"
#include "stdio.h"
#include "string.h"
#include "sleep.h"

#define OUTPUT_FB_0_OFFSET				(0x1000000U)
#define OUTPUT_FB_0                 	(XPAR_MIG7SERIES_0_BASEADDR + OUTPUT_FB_0_OFFSET)

#define INPUT_FB_0_OFFSET				(0x2000000U)
#define INPUT_FB_0                 		(XPAR_MIG7SERIES_0_BASEADDR + INPUT_FB_0_OFFSET)

#define INPUT_FRAME_WIDTH				1280
#define INPUT_FRAME_HEIGHT				720
#define OUTPUT_FRAME_WIDTH				1280
#define OUTPUT_FRAME_HEIGHT				720

#define PIXEL_SIZE_BYTE					3

#define INPUT_FRAME_WIDTH_SIZE_BYTE		(INPUT_FRAME_WIDTH * PIXEL_SIZE_BYTE)
#define INPUT_FRAME_SIZE_BYTE			(INPUT_FRAME_WIDTH_SIZE_BYTE * INPUT_FRAME_HEIGHT)

#define OUTPUT_FRAME_WIDTH_SIZE_BYTE	(OUTPUT_FRAME_WIDTH * PIXEL_SIZE_BYTE)
#define OUTPUT_FRAME_SIZE_BYTE			(OUTPUT_FRAME_WIDTH_SIZE_BYTE * OUTPUT_FRAME_HEIGHT)

int main(void) {
	// declare HLS modules
	XDma_mm2reg_upscale mm2reg_upscale;
	int status;
	int *in_frame = (int *) INPUT_FB_0;
	int *out_frame = (int *) OUTPUT_FB_0;

	xil_printf("initializing mm2reg modules\n");
	// initialize HLS modules
	status = XDma_mm2reg_upscale_Initialize(&mm2reg_upscale, XPAR_XDMA_MM2REG_UPSCALE_0_DEVICE_ID);
	if (status != XST_SUCCESS) {
		xil_printf("initialization failed\n");
		return;
	};

	xil_printf("setting mm2reg m_axi offsets\n");
	// set m_axi offsets
	XDma_mm2reg_upscale_WriteReg(mm2reg_upscale.Axilites_BaseAddress, XDMA_MM2REG_UPSCALE_AXILITES_ADDR_OUT_FRAME_DATA, OUTPUT_FB_0);
	XDma_mm2reg_upscale_WriteReg(mm2reg_upscale.Axilites_BaseAddress, XDMA_MM2REG_UPSCALE_AXILITES_ADDR_IN_FRAME_DATA, INPUT_FB_0);

	xil_printf("initializing input frame\n");
	// initialize input frame to test pattern
	for (int row = 0; row < 720; row++) {
		for (int col = 0; col < 480; col++) {
			in_frame[row * 480 + col] = (int) (&in_frame[row * 480 + col]);
		}
		//memset((void *) INPUT_FB_0, row, INPUT_FRAME_WIDTH_SIZE_BYTE);
	}

	xil_printf("initializing output frame\n");
	// initialize output frame to zeroes
	memset((void *) OUTPUT_FB_0, 0, OUTPUT_FRAME_SIZE_BYTE);

	xil_printf("start writer\n");
	// start HLS module
	XDma_mm2reg_upscale_Start(&mm2reg_upscale);

	// wait a little bit for frame to be copied over
	usleep(10000);

	// verify that frame was copied over correctly

	for (int row = 0; row < OUTPUT_FRAME_HEIGHT; row++) {
		status = memcmp((void *) (INPUT_FB_0 + row *INPUT_FRAME_WIDTH_SIZE_BYTE), (void *) (OUTPUT_FB_0 + row * OUTPUT_FRAME_WIDTH_SIZE_BYTE), OUTPUT_FRAME_WIDTH_SIZE_BYTE);
		if (status != 0) {
			xil_printf("row %d not correct\n", row);
		} else {
			xil_printf("row %d correct!!\n", row);
		}
	}
}

