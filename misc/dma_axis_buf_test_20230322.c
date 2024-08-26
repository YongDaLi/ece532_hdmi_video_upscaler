#include "xaxidma.h"
#include "xparameters.h"
#include "sleep.h"
#include "xil_cache.h"

u32 checkHalted(u32 baseAddress,u32 offset);

int main(){

	_Alignas(16) u32 b[32];
    u32 status;

	XAxiDma_Config *myDmaConfig;
	XAxiDma myDma;

	myDmaConfig = XAxiDma_LookupConfigBaseAddr(XPAR_AXI_DMA_0_BASEADDR);
	status = XAxiDma_CfgInitialize(&myDma, myDmaConfig);
//	if(status != XST_SUCCESS){
//		print("DMA initialization failed\n");
//		return -1;
//	}

	Xil_DCacheFlushRange(b, 1024);

	print("DMA initialization success..\n");
	status = checkHalted(XPAR_AXI_DMA_0_BASEADDR,0x4);
	xil_printf("Status before data transfer %0x\n",status);
	status = XAxiDma_SimpleTransfer(&myDma, b, 8, XAXIDMA_DEVICE_TO_DMA);
//	if(status != XST_SUCCESS){
//		print("DMA initialization failed\n");
//		return -1;
//	}
    status = checkHalted(XPAR_AXI_DMA_0_BASEADDR,0x4);
    while(status != 1){
    	status = checkHalted(XPAR_AXI_DMA_0_BASEADDR,0x4);
    }
    status = checkHalted(XPAR_AXI_DMA_0_BASEADDR,0x34);
    while(status != 1){
    	status = checkHalted(XPAR_AXI_DMA_0_BASEADDR,0x34);
    }

	Xil_DCacheFlushRange(b, 1024);
	print("DMA transfer success..\n");
	for(int i=0;i<8;i++)
		xil_printf("%0x\n",b[i]);
}

u32 checkHalted(u32 baseAddress,u32 offset){
	u32 status;
	status = (XAxiDma_ReadReg(baseAddress,offset))&XAXIDMA_HALTED_MASK;
	return status;
}
