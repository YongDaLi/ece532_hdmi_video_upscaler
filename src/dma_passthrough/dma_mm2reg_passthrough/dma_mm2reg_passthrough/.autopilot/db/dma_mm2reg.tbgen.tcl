set moduleName dma_mm2reg
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {dma_mm2reg}
set C_modelType { void 0 }
set C_modelArgList {
	{ px_clk_V int 1 unused  }
	{ frame_trigger_V int 1 unused  }
	{ in_frame_base_V int 16 regular {axi_master 0}  }
	{ out_frame_base_V int 64 regular {axi_master 1}  }
	{ in_frame0_tile0_0_V int 16 regular {pointer 1}  }
	{ in_frame0_tile0_1_V int 16 regular {pointer 1}  }
	{ in_frame0_tile0_2_V int 16 regular {pointer 1}  }
	{ in_frame0_tile0_3_V int 16 regular {pointer 1}  }
	{ in_frame0_tile0_4_V int 16 regular {pointer 1}  }
	{ in_frame0_tile0_5_V int 16 regular {pointer 1}  }
	{ in_frame0_tile1_0_V int 16 regular {pointer 1}  }
	{ in_frame0_tile1_1_V int 16 regular {pointer 1}  }
	{ in_frame0_tile1_2_V int 16 regular {pointer 1}  }
	{ in_frame0_tile1_3_V int 16 regular {pointer 1}  }
	{ in_frame0_tile1_4_V int 16 regular {pointer 1}  }
	{ in_frame0_tile1_5_V int 16 regular {pointer 1}  }
	{ in_frame1_tile0_0_V int 16 regular {pointer 1}  }
	{ in_frame1_tile0_1_V int 16 regular {pointer 1}  }
	{ in_frame1_tile0_2_V int 16 regular {pointer 1}  }
	{ in_frame1_tile0_3_V int 16 regular {pointer 1}  }
	{ in_frame1_tile0_4_V int 16 regular {pointer 1}  }
	{ in_frame1_tile0_5_V int 16 regular {pointer 1}  }
	{ in_frame1_tile1_0_V int 16 regular {pointer 1}  }
	{ in_frame1_tile1_1_V int 16 regular {pointer 1}  }
	{ in_frame1_tile1_2_V int 16 regular {pointer 1}  }
	{ in_frame1_tile1_3_V int 16 regular {pointer 1}  }
	{ in_frame1_tile1_4_V int 16 regular {pointer 1}  }
	{ in_frame1_tile1_5_V int 16 regular {pointer 1}  }
	{ out_frame0_tile0_0_V int 16 regular {pointer 0}  }
	{ out_frame0_tile0_1_V int 16 regular {pointer 0}  }
	{ out_frame0_tile0_2_V int 16 regular {pointer 0}  }
	{ out_frame0_tile0_3_V int 16 regular {pointer 0}  }
	{ out_frame0_tile0_4_V int 16 regular {pointer 0}  }
	{ out_frame0_tile0_5_V int 16 regular {pointer 0}  }
	{ out_frame0_tile1_0_V int 16 regular {pointer 0}  }
	{ out_frame0_tile1_1_V int 16 regular {pointer 0}  }
	{ out_frame0_tile1_2_V int 16 regular {pointer 0}  }
	{ out_frame0_tile1_3_V int 16 regular {pointer 0}  }
	{ out_frame0_tile1_4_V int 16 regular {pointer 0}  }
	{ out_frame0_tile1_5_V int 16 regular {pointer 0}  }
	{ out_frame1_tile0_0_V int 16 regular {pointer 0}  }
	{ out_frame1_tile0_1_V int 16 regular {pointer 0}  }
	{ out_frame1_tile0_2_V int 16 regular {pointer 0}  }
	{ out_frame1_tile0_3_V int 16 regular {pointer 0}  }
	{ out_frame1_tile0_4_V int 16 regular {pointer 0}  }
	{ out_frame1_tile0_5_V int 16 regular {pointer 0}  }
	{ out_frame1_tile1_0_V int 16 regular {pointer 0}  }
	{ out_frame1_tile1_1_V int 16 regular {pointer 0}  }
	{ out_frame1_tile1_2_V int 16 regular {pointer 0}  }
	{ out_frame1_tile1_3_V int 16 regular {pointer 0}  }
	{ out_frame1_tile1_4_V int 16 regular {pointer 0}  }
	{ out_frame1_tile1_5_V int 16 regular {pointer 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "px_clk_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "px_clk.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "frame_trigger_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "frame_trigger.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "in_frame_base_V", "interface" : "axi_master", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "in_frame_base.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "out_frame_base_V", "interface" : "axi_master", "bitwidth" : 64, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "out_frame_base.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "in_frame0_tile0_0_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "in_frame0_tile0.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "in_frame0_tile0_1_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "in_frame0_tile0.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}]} , 
 	{ "Name" : "in_frame0_tile0_2_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "in_frame0_tile0.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 2,"up" : 2,"step" : 2}]}]}]} , 
 	{ "Name" : "in_frame0_tile0_3_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "in_frame0_tile0.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 3,"up" : 3,"step" : 2}]}]}]} , 
 	{ "Name" : "in_frame0_tile0_4_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "in_frame0_tile0.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 4,"up" : 4,"step" : 2}]}]}]} , 
 	{ "Name" : "in_frame0_tile0_5_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "in_frame0_tile0.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 5,"up" : 5,"step" : 2}]}]}]} , 
 	{ "Name" : "in_frame0_tile1_0_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "in_frame0_tile1.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "in_frame0_tile1_1_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "in_frame0_tile1.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}]} , 
 	{ "Name" : "in_frame0_tile1_2_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "in_frame0_tile1.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 2,"up" : 2,"step" : 2}]}]}]} , 
 	{ "Name" : "in_frame0_tile1_3_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "in_frame0_tile1.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 3,"up" : 3,"step" : 2}]}]}]} , 
 	{ "Name" : "in_frame0_tile1_4_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "in_frame0_tile1.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 4,"up" : 4,"step" : 2}]}]}]} , 
 	{ "Name" : "in_frame0_tile1_5_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "in_frame0_tile1.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 5,"up" : 5,"step" : 2}]}]}]} , 
 	{ "Name" : "in_frame1_tile0_0_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "in_frame1_tile0.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "in_frame1_tile0_1_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "in_frame1_tile0.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}]} , 
 	{ "Name" : "in_frame1_tile0_2_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "in_frame1_tile0.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 2,"up" : 2,"step" : 2}]}]}]} , 
 	{ "Name" : "in_frame1_tile0_3_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "in_frame1_tile0.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 3,"up" : 3,"step" : 2}]}]}]} , 
 	{ "Name" : "in_frame1_tile0_4_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "in_frame1_tile0.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 4,"up" : 4,"step" : 2}]}]}]} , 
 	{ "Name" : "in_frame1_tile0_5_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "in_frame1_tile0.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 5,"up" : 5,"step" : 2}]}]}]} , 
 	{ "Name" : "in_frame1_tile1_0_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "in_frame1_tile1.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "in_frame1_tile1_1_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "in_frame1_tile1.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}]} , 
 	{ "Name" : "in_frame1_tile1_2_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "in_frame1_tile1.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 2,"up" : 2,"step" : 2}]}]}]} , 
 	{ "Name" : "in_frame1_tile1_3_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "in_frame1_tile1.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 3,"up" : 3,"step" : 2}]}]}]} , 
 	{ "Name" : "in_frame1_tile1_4_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "in_frame1_tile1.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 4,"up" : 4,"step" : 2}]}]}]} , 
 	{ "Name" : "in_frame1_tile1_5_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "in_frame1_tile1.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 5,"up" : 5,"step" : 2}]}]}]} , 
 	{ "Name" : "out_frame0_tile0_0_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "out_frame0_tile0.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "out_frame0_tile0_1_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "out_frame0_tile0.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}]} , 
 	{ "Name" : "out_frame0_tile0_2_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "out_frame0_tile0.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 2,"up" : 2,"step" : 2}]}]}]} , 
 	{ "Name" : "out_frame0_tile0_3_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "out_frame0_tile0.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 3,"up" : 3,"step" : 2}]}]}]} , 
 	{ "Name" : "out_frame0_tile0_4_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "out_frame0_tile0.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 4,"up" : 4,"step" : 2}]}]}]} , 
 	{ "Name" : "out_frame0_tile0_5_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "out_frame0_tile0.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 5,"up" : 5,"step" : 2}]}]}]} , 
 	{ "Name" : "out_frame0_tile1_0_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "out_frame0_tile1.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "out_frame0_tile1_1_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "out_frame0_tile1.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}]} , 
 	{ "Name" : "out_frame0_tile1_2_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "out_frame0_tile1.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 2,"up" : 2,"step" : 2}]}]}]} , 
 	{ "Name" : "out_frame0_tile1_3_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "out_frame0_tile1.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 3,"up" : 3,"step" : 2}]}]}]} , 
 	{ "Name" : "out_frame0_tile1_4_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "out_frame0_tile1.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 4,"up" : 4,"step" : 2}]}]}]} , 
 	{ "Name" : "out_frame0_tile1_5_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "out_frame0_tile1.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 5,"up" : 5,"step" : 2}]}]}]} , 
 	{ "Name" : "out_frame1_tile0_0_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "out_frame1_tile0.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "out_frame1_tile0_1_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "out_frame1_tile0.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}]} , 
 	{ "Name" : "out_frame1_tile0_2_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "out_frame1_tile0.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 2,"up" : 2,"step" : 2}]}]}]} , 
 	{ "Name" : "out_frame1_tile0_3_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "out_frame1_tile0.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 3,"up" : 3,"step" : 2}]}]}]} , 
 	{ "Name" : "out_frame1_tile0_4_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "out_frame1_tile0.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 4,"up" : 4,"step" : 2}]}]}]} , 
 	{ "Name" : "out_frame1_tile0_5_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "out_frame1_tile0.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 5,"up" : 5,"step" : 2}]}]}]} , 
 	{ "Name" : "out_frame1_tile1_0_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "out_frame1_tile1.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "out_frame1_tile1_1_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "out_frame1_tile1.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}]} , 
 	{ "Name" : "out_frame1_tile1_2_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "out_frame1_tile1.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 2,"up" : 2,"step" : 2}]}]}]} , 
 	{ "Name" : "out_frame1_tile1_3_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "out_frame1_tile1.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 3,"up" : 3,"step" : 2}]}]}]} , 
 	{ "Name" : "out_frame1_tile1_4_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "out_frame1_tile1.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 4,"up" : 4,"step" : 2}]}]}]} , 
 	{ "Name" : "out_frame1_tile1_5_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "out_frame1_tile1.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 5,"up" : 5,"step" : 2}]}]}]} ]}
# RTL Port declarations: 
set portNum 142
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ px_clk_V sc_in sc_lv 1 signal 0 } 
	{ frame_trigger_V sc_in sc_lv 1 signal 1 } 
	{ m_axi_in_frame_base_V_AWVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_in_frame_base_V_AWREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_in_frame_base_V_AWADDR sc_out sc_lv 32 signal 2 } 
	{ m_axi_in_frame_base_V_AWID sc_out sc_lv 1 signal 2 } 
	{ m_axi_in_frame_base_V_AWLEN sc_out sc_lv 8 signal 2 } 
	{ m_axi_in_frame_base_V_AWSIZE sc_out sc_lv 3 signal 2 } 
	{ m_axi_in_frame_base_V_AWBURST sc_out sc_lv 2 signal 2 } 
	{ m_axi_in_frame_base_V_AWLOCK sc_out sc_lv 2 signal 2 } 
	{ m_axi_in_frame_base_V_AWCACHE sc_out sc_lv 4 signal 2 } 
	{ m_axi_in_frame_base_V_AWPROT sc_out sc_lv 3 signal 2 } 
	{ m_axi_in_frame_base_V_AWQOS sc_out sc_lv 4 signal 2 } 
	{ m_axi_in_frame_base_V_AWREGION sc_out sc_lv 4 signal 2 } 
	{ m_axi_in_frame_base_V_AWUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_in_frame_base_V_WVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_in_frame_base_V_WREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_in_frame_base_V_WDATA sc_out sc_lv 32 signal 2 } 
	{ m_axi_in_frame_base_V_WSTRB sc_out sc_lv 4 signal 2 } 
	{ m_axi_in_frame_base_V_WLAST sc_out sc_logic 1 signal 2 } 
	{ m_axi_in_frame_base_V_WID sc_out sc_lv 1 signal 2 } 
	{ m_axi_in_frame_base_V_WUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_in_frame_base_V_ARVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_in_frame_base_V_ARREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_in_frame_base_V_ARADDR sc_out sc_lv 32 signal 2 } 
	{ m_axi_in_frame_base_V_ARID sc_out sc_lv 1 signal 2 } 
	{ m_axi_in_frame_base_V_ARLEN sc_out sc_lv 8 signal 2 } 
	{ m_axi_in_frame_base_V_ARSIZE sc_out sc_lv 3 signal 2 } 
	{ m_axi_in_frame_base_V_ARBURST sc_out sc_lv 2 signal 2 } 
	{ m_axi_in_frame_base_V_ARLOCK sc_out sc_lv 2 signal 2 } 
	{ m_axi_in_frame_base_V_ARCACHE sc_out sc_lv 4 signal 2 } 
	{ m_axi_in_frame_base_V_ARPROT sc_out sc_lv 3 signal 2 } 
	{ m_axi_in_frame_base_V_ARQOS sc_out sc_lv 4 signal 2 } 
	{ m_axi_in_frame_base_V_ARREGION sc_out sc_lv 4 signal 2 } 
	{ m_axi_in_frame_base_V_ARUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_in_frame_base_V_RVALID sc_in sc_logic 1 signal 2 } 
	{ m_axi_in_frame_base_V_RREADY sc_out sc_logic 1 signal 2 } 
	{ m_axi_in_frame_base_V_RDATA sc_in sc_lv 32 signal 2 } 
	{ m_axi_in_frame_base_V_RLAST sc_in sc_logic 1 signal 2 } 
	{ m_axi_in_frame_base_V_RID sc_in sc_lv 1 signal 2 } 
	{ m_axi_in_frame_base_V_RUSER sc_in sc_lv 1 signal 2 } 
	{ m_axi_in_frame_base_V_RRESP sc_in sc_lv 2 signal 2 } 
	{ m_axi_in_frame_base_V_BVALID sc_in sc_logic 1 signal 2 } 
	{ m_axi_in_frame_base_V_BREADY sc_out sc_logic 1 signal 2 } 
	{ m_axi_in_frame_base_V_BRESP sc_in sc_lv 2 signal 2 } 
	{ m_axi_in_frame_base_V_BID sc_in sc_lv 1 signal 2 } 
	{ m_axi_in_frame_base_V_BUSER sc_in sc_lv 1 signal 2 } 
	{ m_axi_out_frame_base_V_AWVALID sc_out sc_logic 1 signal 3 } 
	{ m_axi_out_frame_base_V_AWREADY sc_in sc_logic 1 signal 3 } 
	{ m_axi_out_frame_base_V_AWADDR sc_out sc_lv 32 signal 3 } 
	{ m_axi_out_frame_base_V_AWID sc_out sc_lv 1 signal 3 } 
	{ m_axi_out_frame_base_V_AWLEN sc_out sc_lv 8 signal 3 } 
	{ m_axi_out_frame_base_V_AWSIZE sc_out sc_lv 3 signal 3 } 
	{ m_axi_out_frame_base_V_AWBURST sc_out sc_lv 2 signal 3 } 
	{ m_axi_out_frame_base_V_AWLOCK sc_out sc_lv 2 signal 3 } 
	{ m_axi_out_frame_base_V_AWCACHE sc_out sc_lv 4 signal 3 } 
	{ m_axi_out_frame_base_V_AWPROT sc_out sc_lv 3 signal 3 } 
	{ m_axi_out_frame_base_V_AWQOS sc_out sc_lv 4 signal 3 } 
	{ m_axi_out_frame_base_V_AWREGION sc_out sc_lv 4 signal 3 } 
	{ m_axi_out_frame_base_V_AWUSER sc_out sc_lv 1 signal 3 } 
	{ m_axi_out_frame_base_V_WVALID sc_out sc_logic 1 signal 3 } 
	{ m_axi_out_frame_base_V_WREADY sc_in sc_logic 1 signal 3 } 
	{ m_axi_out_frame_base_V_WDATA sc_out sc_lv 64 signal 3 } 
	{ m_axi_out_frame_base_V_WSTRB sc_out sc_lv 8 signal 3 } 
	{ m_axi_out_frame_base_V_WLAST sc_out sc_logic 1 signal 3 } 
	{ m_axi_out_frame_base_V_WID sc_out sc_lv 1 signal 3 } 
	{ m_axi_out_frame_base_V_WUSER sc_out sc_lv 1 signal 3 } 
	{ m_axi_out_frame_base_V_ARVALID sc_out sc_logic 1 signal 3 } 
	{ m_axi_out_frame_base_V_ARREADY sc_in sc_logic 1 signal 3 } 
	{ m_axi_out_frame_base_V_ARADDR sc_out sc_lv 32 signal 3 } 
	{ m_axi_out_frame_base_V_ARID sc_out sc_lv 1 signal 3 } 
	{ m_axi_out_frame_base_V_ARLEN sc_out sc_lv 8 signal 3 } 
	{ m_axi_out_frame_base_V_ARSIZE sc_out sc_lv 3 signal 3 } 
	{ m_axi_out_frame_base_V_ARBURST sc_out sc_lv 2 signal 3 } 
	{ m_axi_out_frame_base_V_ARLOCK sc_out sc_lv 2 signal 3 } 
	{ m_axi_out_frame_base_V_ARCACHE sc_out sc_lv 4 signal 3 } 
	{ m_axi_out_frame_base_V_ARPROT sc_out sc_lv 3 signal 3 } 
	{ m_axi_out_frame_base_V_ARQOS sc_out sc_lv 4 signal 3 } 
	{ m_axi_out_frame_base_V_ARREGION sc_out sc_lv 4 signal 3 } 
	{ m_axi_out_frame_base_V_ARUSER sc_out sc_lv 1 signal 3 } 
	{ m_axi_out_frame_base_V_RVALID sc_in sc_logic 1 signal 3 } 
	{ m_axi_out_frame_base_V_RREADY sc_out sc_logic 1 signal 3 } 
	{ m_axi_out_frame_base_V_RDATA sc_in sc_lv 64 signal 3 } 
	{ m_axi_out_frame_base_V_RLAST sc_in sc_logic 1 signal 3 } 
	{ m_axi_out_frame_base_V_RID sc_in sc_lv 1 signal 3 } 
	{ m_axi_out_frame_base_V_RUSER sc_in sc_lv 1 signal 3 } 
	{ m_axi_out_frame_base_V_RRESP sc_in sc_lv 2 signal 3 } 
	{ m_axi_out_frame_base_V_BVALID sc_in sc_logic 1 signal 3 } 
	{ m_axi_out_frame_base_V_BREADY sc_out sc_logic 1 signal 3 } 
	{ m_axi_out_frame_base_V_BRESP sc_in sc_lv 2 signal 3 } 
	{ m_axi_out_frame_base_V_BID sc_in sc_lv 1 signal 3 } 
	{ m_axi_out_frame_base_V_BUSER sc_in sc_lv 1 signal 3 } 
	{ in_frame0_tile0_0_V sc_out sc_lv 16 signal 4 } 
	{ in_frame0_tile0_1_V sc_out sc_lv 16 signal 5 } 
	{ in_frame0_tile0_2_V sc_out sc_lv 16 signal 6 } 
	{ in_frame0_tile0_3_V sc_out sc_lv 16 signal 7 } 
	{ in_frame0_tile0_4_V sc_out sc_lv 16 signal 8 } 
	{ in_frame0_tile0_5_V sc_out sc_lv 16 signal 9 } 
	{ in_frame0_tile1_0_V sc_out sc_lv 16 signal 10 } 
	{ in_frame0_tile1_1_V sc_out sc_lv 16 signal 11 } 
	{ in_frame0_tile1_2_V sc_out sc_lv 16 signal 12 } 
	{ in_frame0_tile1_3_V sc_out sc_lv 16 signal 13 } 
	{ in_frame0_tile1_4_V sc_out sc_lv 16 signal 14 } 
	{ in_frame0_tile1_5_V sc_out sc_lv 16 signal 15 } 
	{ in_frame1_tile0_0_V sc_out sc_lv 16 signal 16 } 
	{ in_frame1_tile0_1_V sc_out sc_lv 16 signal 17 } 
	{ in_frame1_tile0_2_V sc_out sc_lv 16 signal 18 } 
	{ in_frame1_tile0_3_V sc_out sc_lv 16 signal 19 } 
	{ in_frame1_tile0_4_V sc_out sc_lv 16 signal 20 } 
	{ in_frame1_tile0_5_V sc_out sc_lv 16 signal 21 } 
	{ in_frame1_tile1_0_V sc_out sc_lv 16 signal 22 } 
	{ in_frame1_tile1_1_V sc_out sc_lv 16 signal 23 } 
	{ in_frame1_tile1_2_V sc_out sc_lv 16 signal 24 } 
	{ in_frame1_tile1_3_V sc_out sc_lv 16 signal 25 } 
	{ in_frame1_tile1_4_V sc_out sc_lv 16 signal 26 } 
	{ in_frame1_tile1_5_V sc_out sc_lv 16 signal 27 } 
	{ out_frame0_tile0_0_V sc_in sc_lv 16 signal 28 } 
	{ out_frame0_tile0_1_V sc_in sc_lv 16 signal 29 } 
	{ out_frame0_tile0_2_V sc_in sc_lv 16 signal 30 } 
	{ out_frame0_tile0_3_V sc_in sc_lv 16 signal 31 } 
	{ out_frame0_tile0_4_V sc_in sc_lv 16 signal 32 } 
	{ out_frame0_tile0_5_V sc_in sc_lv 16 signal 33 } 
	{ out_frame0_tile1_0_V sc_in sc_lv 16 signal 34 } 
	{ out_frame0_tile1_1_V sc_in sc_lv 16 signal 35 } 
	{ out_frame0_tile1_2_V sc_in sc_lv 16 signal 36 } 
	{ out_frame0_tile1_3_V sc_in sc_lv 16 signal 37 } 
	{ out_frame0_tile1_4_V sc_in sc_lv 16 signal 38 } 
	{ out_frame0_tile1_5_V sc_in sc_lv 16 signal 39 } 
	{ out_frame1_tile0_0_V sc_in sc_lv 16 signal 40 } 
	{ out_frame1_tile0_1_V sc_in sc_lv 16 signal 41 } 
	{ out_frame1_tile0_2_V sc_in sc_lv 16 signal 42 } 
	{ out_frame1_tile0_3_V sc_in sc_lv 16 signal 43 } 
	{ out_frame1_tile0_4_V sc_in sc_lv 16 signal 44 } 
	{ out_frame1_tile0_5_V sc_in sc_lv 16 signal 45 } 
	{ out_frame1_tile1_0_V sc_in sc_lv 16 signal 46 } 
	{ out_frame1_tile1_1_V sc_in sc_lv 16 signal 47 } 
	{ out_frame1_tile1_2_V sc_in sc_lv 16 signal 48 } 
	{ out_frame1_tile1_3_V sc_in sc_lv 16 signal 49 } 
	{ out_frame1_tile1_4_V sc_in sc_lv 16 signal 50 } 
	{ out_frame1_tile1_5_V sc_in sc_lv 16 signal 51 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "px_clk_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "px_clk_V", "role": "default" }} , 
 	{ "name": "frame_trigger_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "frame_trigger_V", "role": "default" }} , 
 	{ "name": "m_axi_in_frame_base_V_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "AWVALID" }} , 
 	{ "name": "m_axi_in_frame_base_V_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "AWREADY" }} , 
 	{ "name": "m_axi_in_frame_base_V_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "AWADDR" }} , 
 	{ "name": "m_axi_in_frame_base_V_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "AWID" }} , 
 	{ "name": "m_axi_in_frame_base_V_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "AWLEN" }} , 
 	{ "name": "m_axi_in_frame_base_V_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_in_frame_base_V_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "AWBURST" }} , 
 	{ "name": "m_axi_in_frame_base_V_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_in_frame_base_V_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_in_frame_base_V_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "AWPROT" }} , 
 	{ "name": "m_axi_in_frame_base_V_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "AWQOS" }} , 
 	{ "name": "m_axi_in_frame_base_V_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "AWREGION" }} , 
 	{ "name": "m_axi_in_frame_base_V_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "AWUSER" }} , 
 	{ "name": "m_axi_in_frame_base_V_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "WVALID" }} , 
 	{ "name": "m_axi_in_frame_base_V_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "WREADY" }} , 
 	{ "name": "m_axi_in_frame_base_V_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "WDATA" }} , 
 	{ "name": "m_axi_in_frame_base_V_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "WSTRB" }} , 
 	{ "name": "m_axi_in_frame_base_V_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "WLAST" }} , 
 	{ "name": "m_axi_in_frame_base_V_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "WID" }} , 
 	{ "name": "m_axi_in_frame_base_V_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "WUSER" }} , 
 	{ "name": "m_axi_in_frame_base_V_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "ARVALID" }} , 
 	{ "name": "m_axi_in_frame_base_V_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "ARREADY" }} , 
 	{ "name": "m_axi_in_frame_base_V_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "ARADDR" }} , 
 	{ "name": "m_axi_in_frame_base_V_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "ARID" }} , 
 	{ "name": "m_axi_in_frame_base_V_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "ARLEN" }} , 
 	{ "name": "m_axi_in_frame_base_V_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_in_frame_base_V_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "ARBURST" }} , 
 	{ "name": "m_axi_in_frame_base_V_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_in_frame_base_V_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_in_frame_base_V_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "ARPROT" }} , 
 	{ "name": "m_axi_in_frame_base_V_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "ARQOS" }} , 
 	{ "name": "m_axi_in_frame_base_V_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "ARREGION" }} , 
 	{ "name": "m_axi_in_frame_base_V_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "ARUSER" }} , 
 	{ "name": "m_axi_in_frame_base_V_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "RVALID" }} , 
 	{ "name": "m_axi_in_frame_base_V_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "RREADY" }} , 
 	{ "name": "m_axi_in_frame_base_V_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "RDATA" }} , 
 	{ "name": "m_axi_in_frame_base_V_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "RLAST" }} , 
 	{ "name": "m_axi_in_frame_base_V_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "RID" }} , 
 	{ "name": "m_axi_in_frame_base_V_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "RUSER" }} , 
 	{ "name": "m_axi_in_frame_base_V_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "RRESP" }} , 
 	{ "name": "m_axi_in_frame_base_V_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "BVALID" }} , 
 	{ "name": "m_axi_in_frame_base_V_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "BREADY" }} , 
 	{ "name": "m_axi_in_frame_base_V_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "BRESP" }} , 
 	{ "name": "m_axi_in_frame_base_V_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "BID" }} , 
 	{ "name": "m_axi_in_frame_base_V_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_frame_base_V", "role": "BUSER" }} , 
 	{ "name": "m_axi_out_frame_base_V_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "AWVALID" }} , 
 	{ "name": "m_axi_out_frame_base_V_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "AWREADY" }} , 
 	{ "name": "m_axi_out_frame_base_V_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "AWADDR" }} , 
 	{ "name": "m_axi_out_frame_base_V_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "AWID" }} , 
 	{ "name": "m_axi_out_frame_base_V_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "AWLEN" }} , 
 	{ "name": "m_axi_out_frame_base_V_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_out_frame_base_V_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "AWBURST" }} , 
 	{ "name": "m_axi_out_frame_base_V_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_out_frame_base_V_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_out_frame_base_V_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "AWPROT" }} , 
 	{ "name": "m_axi_out_frame_base_V_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "AWQOS" }} , 
 	{ "name": "m_axi_out_frame_base_V_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "AWREGION" }} , 
 	{ "name": "m_axi_out_frame_base_V_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "AWUSER" }} , 
 	{ "name": "m_axi_out_frame_base_V_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "WVALID" }} , 
 	{ "name": "m_axi_out_frame_base_V_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "WREADY" }} , 
 	{ "name": "m_axi_out_frame_base_V_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "WDATA" }} , 
 	{ "name": "m_axi_out_frame_base_V_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "WSTRB" }} , 
 	{ "name": "m_axi_out_frame_base_V_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "WLAST" }} , 
 	{ "name": "m_axi_out_frame_base_V_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "WID" }} , 
 	{ "name": "m_axi_out_frame_base_V_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "WUSER" }} , 
 	{ "name": "m_axi_out_frame_base_V_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "ARVALID" }} , 
 	{ "name": "m_axi_out_frame_base_V_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "ARREADY" }} , 
 	{ "name": "m_axi_out_frame_base_V_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "ARADDR" }} , 
 	{ "name": "m_axi_out_frame_base_V_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "ARID" }} , 
 	{ "name": "m_axi_out_frame_base_V_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "ARLEN" }} , 
 	{ "name": "m_axi_out_frame_base_V_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_out_frame_base_V_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "ARBURST" }} , 
 	{ "name": "m_axi_out_frame_base_V_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_out_frame_base_V_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_out_frame_base_V_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "ARPROT" }} , 
 	{ "name": "m_axi_out_frame_base_V_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "ARQOS" }} , 
 	{ "name": "m_axi_out_frame_base_V_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "ARREGION" }} , 
 	{ "name": "m_axi_out_frame_base_V_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "ARUSER" }} , 
 	{ "name": "m_axi_out_frame_base_V_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "RVALID" }} , 
 	{ "name": "m_axi_out_frame_base_V_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "RREADY" }} , 
 	{ "name": "m_axi_out_frame_base_V_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "RDATA" }} , 
 	{ "name": "m_axi_out_frame_base_V_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "RLAST" }} , 
 	{ "name": "m_axi_out_frame_base_V_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "RID" }} , 
 	{ "name": "m_axi_out_frame_base_V_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "RUSER" }} , 
 	{ "name": "m_axi_out_frame_base_V_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "RRESP" }} , 
 	{ "name": "m_axi_out_frame_base_V_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "BVALID" }} , 
 	{ "name": "m_axi_out_frame_base_V_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "BREADY" }} , 
 	{ "name": "m_axi_out_frame_base_V_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "BRESP" }} , 
 	{ "name": "m_axi_out_frame_base_V_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "BID" }} , 
 	{ "name": "m_axi_out_frame_base_V_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_frame_base_V", "role": "BUSER" }} , 
 	{ "name": "in_frame0_tile0_0_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "in_frame0_tile0_0_V", "role": "default" }} , 
 	{ "name": "in_frame0_tile0_1_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "in_frame0_tile0_1_V", "role": "default" }} , 
 	{ "name": "in_frame0_tile0_2_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "in_frame0_tile0_2_V", "role": "default" }} , 
 	{ "name": "in_frame0_tile0_3_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "in_frame0_tile0_3_V", "role": "default" }} , 
 	{ "name": "in_frame0_tile0_4_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "in_frame0_tile0_4_V", "role": "default" }} , 
 	{ "name": "in_frame0_tile0_5_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "in_frame0_tile0_5_V", "role": "default" }} , 
 	{ "name": "in_frame0_tile1_0_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "in_frame0_tile1_0_V", "role": "default" }} , 
 	{ "name": "in_frame0_tile1_1_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "in_frame0_tile1_1_V", "role": "default" }} , 
 	{ "name": "in_frame0_tile1_2_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "in_frame0_tile1_2_V", "role": "default" }} , 
 	{ "name": "in_frame0_tile1_3_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "in_frame0_tile1_3_V", "role": "default" }} , 
 	{ "name": "in_frame0_tile1_4_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "in_frame0_tile1_4_V", "role": "default" }} , 
 	{ "name": "in_frame0_tile1_5_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "in_frame0_tile1_5_V", "role": "default" }} , 
 	{ "name": "in_frame1_tile0_0_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "in_frame1_tile0_0_V", "role": "default" }} , 
 	{ "name": "in_frame1_tile0_1_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "in_frame1_tile0_1_V", "role": "default" }} , 
 	{ "name": "in_frame1_tile0_2_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "in_frame1_tile0_2_V", "role": "default" }} , 
 	{ "name": "in_frame1_tile0_3_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "in_frame1_tile0_3_V", "role": "default" }} , 
 	{ "name": "in_frame1_tile0_4_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "in_frame1_tile0_4_V", "role": "default" }} , 
 	{ "name": "in_frame1_tile0_5_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "in_frame1_tile0_5_V", "role": "default" }} , 
 	{ "name": "in_frame1_tile1_0_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "in_frame1_tile1_0_V", "role": "default" }} , 
 	{ "name": "in_frame1_tile1_1_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "in_frame1_tile1_1_V", "role": "default" }} , 
 	{ "name": "in_frame1_tile1_2_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "in_frame1_tile1_2_V", "role": "default" }} , 
 	{ "name": "in_frame1_tile1_3_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "in_frame1_tile1_3_V", "role": "default" }} , 
 	{ "name": "in_frame1_tile1_4_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "in_frame1_tile1_4_V", "role": "default" }} , 
 	{ "name": "in_frame1_tile1_5_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "in_frame1_tile1_5_V", "role": "default" }} , 
 	{ "name": "out_frame0_tile0_0_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "out_frame0_tile0_0_V", "role": "default" }} , 
 	{ "name": "out_frame0_tile0_1_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "out_frame0_tile0_1_V", "role": "default" }} , 
 	{ "name": "out_frame0_tile0_2_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "out_frame0_tile0_2_V", "role": "default" }} , 
 	{ "name": "out_frame0_tile0_3_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "out_frame0_tile0_3_V", "role": "default" }} , 
 	{ "name": "out_frame0_tile0_4_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "out_frame0_tile0_4_V", "role": "default" }} , 
 	{ "name": "out_frame0_tile0_5_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "out_frame0_tile0_5_V", "role": "default" }} , 
 	{ "name": "out_frame0_tile1_0_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "out_frame0_tile1_0_V", "role": "default" }} , 
 	{ "name": "out_frame0_tile1_1_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "out_frame0_tile1_1_V", "role": "default" }} , 
 	{ "name": "out_frame0_tile1_2_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "out_frame0_tile1_2_V", "role": "default" }} , 
 	{ "name": "out_frame0_tile1_3_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "out_frame0_tile1_3_V", "role": "default" }} , 
 	{ "name": "out_frame0_tile1_4_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "out_frame0_tile1_4_V", "role": "default" }} , 
 	{ "name": "out_frame0_tile1_5_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "out_frame0_tile1_5_V", "role": "default" }} , 
 	{ "name": "out_frame1_tile0_0_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "out_frame1_tile0_0_V", "role": "default" }} , 
 	{ "name": "out_frame1_tile0_1_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "out_frame1_tile0_1_V", "role": "default" }} , 
 	{ "name": "out_frame1_tile0_2_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "out_frame1_tile0_2_V", "role": "default" }} , 
 	{ "name": "out_frame1_tile0_3_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "out_frame1_tile0_3_V", "role": "default" }} , 
 	{ "name": "out_frame1_tile0_4_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "out_frame1_tile0_4_V", "role": "default" }} , 
 	{ "name": "out_frame1_tile0_5_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "out_frame1_tile0_5_V", "role": "default" }} , 
 	{ "name": "out_frame1_tile1_0_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "out_frame1_tile1_0_V", "role": "default" }} , 
 	{ "name": "out_frame1_tile1_1_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "out_frame1_tile1_1_V", "role": "default" }} , 
 	{ "name": "out_frame1_tile1_2_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "out_frame1_tile1_2_V", "role": "default" }} , 
 	{ "name": "out_frame1_tile1_3_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "out_frame1_tile1_3_V", "role": "default" }} , 
 	{ "name": "out_frame1_tile1_4_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "out_frame1_tile1_4_V", "role": "default" }} , 
 	{ "name": "out_frame1_tile1_5_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "out_frame1_tile1_5_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "dma_mm2reg",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "px_clk_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "frame_trigger_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "in_frame_base_V", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "in_frame_base_V_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "in_frame_base_V_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "out_frame_base_V", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "out_frame_base_V_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "out_frame_base_V_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "out_frame_base_V_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "in_frame0_tile0_0_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "in_frame0_tile0_1_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "in_frame0_tile0_2_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "in_frame0_tile0_3_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "in_frame0_tile0_4_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "in_frame0_tile0_5_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "in_frame0_tile1_0_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "in_frame0_tile1_1_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "in_frame0_tile1_2_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "in_frame0_tile1_3_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "in_frame0_tile1_4_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "in_frame0_tile1_5_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "in_frame1_tile0_0_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "in_frame1_tile0_1_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "in_frame1_tile0_2_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "in_frame1_tile0_3_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "in_frame1_tile0_4_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "in_frame1_tile0_5_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "in_frame1_tile1_0_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "in_frame1_tile1_1_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "in_frame1_tile1_2_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "in_frame1_tile1_3_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "in_frame1_tile1_4_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "in_frame1_tile1_5_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "out_frame0_tile0_0_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_frame0_tile0_1_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_frame0_tile0_2_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_frame0_tile0_3_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_frame0_tile0_4_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_frame0_tile0_5_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_frame0_tile1_0_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_frame0_tile1_1_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_frame0_tile1_2_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_frame0_tile1_3_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_frame0_tile1_4_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_frame0_tile1_5_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_frame1_tile0_0_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_frame1_tile0_1_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_frame1_tile0_2_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_frame1_tile0_3_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_frame1_tile0_4_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_frame1_tile0_5_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_frame1_tile1_0_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_frame1_tile1_1_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_frame1_tile1_2_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_frame1_tile1_3_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_frame1_tile1_4_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_frame1_tile1_5_V", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dma_mm2reg_in_frame_base_V_m_axi_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dma_mm2reg_out_frame_base_V_m_axi_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	dma_mm2reg {
		px_clk_V {Type I LastRead -1 FirstWrite -1}
		frame_trigger_V {Type I LastRead -1 FirstWrite -1}
		in_frame_base_V {Type I LastRead 20 FirstWrite -1}
		out_frame_base_V {Type O LastRead 27 FirstWrite 3}
		in_frame0_tile0_0_V {Type O LastRead -1 FirstWrite 9}
		in_frame0_tile0_1_V {Type O LastRead -1 FirstWrite 10}
		in_frame0_tile0_2_V {Type O LastRead -1 FirstWrite 11}
		in_frame0_tile0_3_V {Type O LastRead -1 FirstWrite 12}
		in_frame0_tile0_4_V {Type O LastRead -1 FirstWrite 13}
		in_frame0_tile0_5_V {Type O LastRead -1 FirstWrite 14}
		in_frame0_tile1_0_V {Type O LastRead -1 FirstWrite 15}
		in_frame0_tile1_1_V {Type O LastRead -1 FirstWrite 16}
		in_frame0_tile1_2_V {Type O LastRead -1 FirstWrite 17}
		in_frame0_tile1_3_V {Type O LastRead -1 FirstWrite 18}
		in_frame0_tile1_4_V {Type O LastRead -1 FirstWrite 19}
		in_frame0_tile1_5_V {Type O LastRead -1 FirstWrite 20}
		in_frame1_tile0_0_V {Type O LastRead -1 FirstWrite 9}
		in_frame1_tile0_1_V {Type O LastRead -1 FirstWrite 10}
		in_frame1_tile0_2_V {Type O LastRead -1 FirstWrite 11}
		in_frame1_tile0_3_V {Type O LastRead -1 FirstWrite 12}
		in_frame1_tile0_4_V {Type O LastRead -1 FirstWrite 13}
		in_frame1_tile0_5_V {Type O LastRead -1 FirstWrite 14}
		in_frame1_tile1_0_V {Type O LastRead -1 FirstWrite 15}
		in_frame1_tile1_1_V {Type O LastRead -1 FirstWrite 16}
		in_frame1_tile1_2_V {Type O LastRead -1 FirstWrite 17}
		in_frame1_tile1_3_V {Type O LastRead -1 FirstWrite 18}
		in_frame1_tile1_4_V {Type O LastRead -1 FirstWrite 19}
		in_frame1_tile1_5_V {Type O LastRead -1 FirstWrite 20}
		out_frame0_tile0_0_V {Type I LastRead 15 FirstWrite -1}
		out_frame0_tile0_1_V {Type I LastRead 16 FirstWrite -1}
		out_frame0_tile0_2_V {Type I LastRead 17 FirstWrite -1}
		out_frame0_tile0_3_V {Type I LastRead 18 FirstWrite -1}
		out_frame0_tile0_4_V {Type I LastRead 19 FirstWrite -1}
		out_frame0_tile0_5_V {Type I LastRead 20 FirstWrite -1}
		out_frame0_tile1_0_V {Type I LastRead 3 FirstWrite -1}
		out_frame0_tile1_1_V {Type I LastRead 4 FirstWrite -1}
		out_frame0_tile1_2_V {Type I LastRead 5 FirstWrite -1}
		out_frame0_tile1_3_V {Type I LastRead 6 FirstWrite -1}
		out_frame0_tile1_4_V {Type I LastRead 7 FirstWrite -1}
		out_frame0_tile1_5_V {Type I LastRead 8 FirstWrite -1}
		out_frame1_tile0_0_V {Type I LastRead 21 FirstWrite -1}
		out_frame1_tile0_1_V {Type I LastRead 22 FirstWrite -1}
		out_frame1_tile0_2_V {Type I LastRead 23 FirstWrite -1}
		out_frame1_tile0_3_V {Type I LastRead 24 FirstWrite -1}
		out_frame1_tile0_4_V {Type I LastRead 24 FirstWrite -1}
		out_frame1_tile0_5_V {Type I LastRead 24 FirstWrite -1}
		out_frame1_tile1_0_V {Type I LastRead 9 FirstWrite -1}
		out_frame1_tile1_1_V {Type I LastRead 10 FirstWrite -1}
		out_frame1_tile1_2_V {Type I LastRead 11 FirstWrite -1}
		out_frame1_tile1_3_V {Type I LastRead 12 FirstWrite -1}
		out_frame1_tile1_4_V {Type I LastRead 13 FirstWrite -1}
		out_frame1_tile1_5_V {Type I LastRead 14 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	px_clk_V { ap_none {  { px_clk_V in_data 0 1 } } }
	frame_trigger_V { ap_none {  { frame_trigger_V in_data 0 1 } } }
	in_frame_base_V { m_axi {  { m_axi_in_frame_base_V_AWVALID VALID 1 1 }  { m_axi_in_frame_base_V_AWREADY READY 0 1 }  { m_axi_in_frame_base_V_AWADDR ADDR 1 32 }  { m_axi_in_frame_base_V_AWID ID 1 1 }  { m_axi_in_frame_base_V_AWLEN LEN 1 8 }  { m_axi_in_frame_base_V_AWSIZE SIZE 1 3 }  { m_axi_in_frame_base_V_AWBURST BURST 1 2 }  { m_axi_in_frame_base_V_AWLOCK LOCK 1 2 }  { m_axi_in_frame_base_V_AWCACHE CACHE 1 4 }  { m_axi_in_frame_base_V_AWPROT PROT 1 3 }  { m_axi_in_frame_base_V_AWQOS QOS 1 4 }  { m_axi_in_frame_base_V_AWREGION REGION 1 4 }  { m_axi_in_frame_base_V_AWUSER USER 1 1 }  { m_axi_in_frame_base_V_WVALID VALID 1 1 }  { m_axi_in_frame_base_V_WREADY READY 0 1 }  { m_axi_in_frame_base_V_WDATA DATA 1 32 }  { m_axi_in_frame_base_V_WSTRB STRB 1 4 }  { m_axi_in_frame_base_V_WLAST LAST 1 1 }  { m_axi_in_frame_base_V_WID ID 1 1 }  { m_axi_in_frame_base_V_WUSER USER 1 1 }  { m_axi_in_frame_base_V_ARVALID VALID 1 1 }  { m_axi_in_frame_base_V_ARREADY READY 0 1 }  { m_axi_in_frame_base_V_ARADDR ADDR 1 32 }  { m_axi_in_frame_base_V_ARID ID 1 1 }  { m_axi_in_frame_base_V_ARLEN LEN 1 8 }  { m_axi_in_frame_base_V_ARSIZE SIZE 1 3 }  { m_axi_in_frame_base_V_ARBURST BURST 1 2 }  { m_axi_in_frame_base_V_ARLOCK LOCK 1 2 }  { m_axi_in_frame_base_V_ARCACHE CACHE 1 4 }  { m_axi_in_frame_base_V_ARPROT PROT 1 3 }  { m_axi_in_frame_base_V_ARQOS QOS 1 4 }  { m_axi_in_frame_base_V_ARREGION REGION 1 4 }  { m_axi_in_frame_base_V_ARUSER USER 1 1 }  { m_axi_in_frame_base_V_RVALID VALID 0 1 }  { m_axi_in_frame_base_V_RREADY READY 1 1 }  { m_axi_in_frame_base_V_RDATA DATA 0 32 }  { m_axi_in_frame_base_V_RLAST LAST 0 1 }  { m_axi_in_frame_base_V_RID ID 0 1 }  { m_axi_in_frame_base_V_RUSER USER 0 1 }  { m_axi_in_frame_base_V_RRESP RESP 0 2 }  { m_axi_in_frame_base_V_BVALID VALID 0 1 }  { m_axi_in_frame_base_V_BREADY READY 1 1 }  { m_axi_in_frame_base_V_BRESP RESP 0 2 }  { m_axi_in_frame_base_V_BID ID 0 1 }  { m_axi_in_frame_base_V_BUSER USER 0 1 } } }
	out_frame_base_V { m_axi {  { m_axi_out_frame_base_V_AWVALID VALID 1 1 }  { m_axi_out_frame_base_V_AWREADY READY 0 1 }  { m_axi_out_frame_base_V_AWADDR ADDR 1 32 }  { m_axi_out_frame_base_V_AWID ID 1 1 }  { m_axi_out_frame_base_V_AWLEN LEN 1 8 }  { m_axi_out_frame_base_V_AWSIZE SIZE 1 3 }  { m_axi_out_frame_base_V_AWBURST BURST 1 2 }  { m_axi_out_frame_base_V_AWLOCK LOCK 1 2 }  { m_axi_out_frame_base_V_AWCACHE CACHE 1 4 }  { m_axi_out_frame_base_V_AWPROT PROT 1 3 }  { m_axi_out_frame_base_V_AWQOS QOS 1 4 }  { m_axi_out_frame_base_V_AWREGION REGION 1 4 }  { m_axi_out_frame_base_V_AWUSER USER 1 1 }  { m_axi_out_frame_base_V_WVALID VALID 1 1 }  { m_axi_out_frame_base_V_WREADY READY 0 1 }  { m_axi_out_frame_base_V_WDATA DATA 1 64 }  { m_axi_out_frame_base_V_WSTRB STRB 1 8 }  { m_axi_out_frame_base_V_WLAST LAST 1 1 }  { m_axi_out_frame_base_V_WID ID 1 1 }  { m_axi_out_frame_base_V_WUSER USER 1 1 }  { m_axi_out_frame_base_V_ARVALID VALID 1 1 }  { m_axi_out_frame_base_V_ARREADY READY 0 1 }  { m_axi_out_frame_base_V_ARADDR ADDR 1 32 }  { m_axi_out_frame_base_V_ARID ID 1 1 }  { m_axi_out_frame_base_V_ARLEN LEN 1 8 }  { m_axi_out_frame_base_V_ARSIZE SIZE 1 3 }  { m_axi_out_frame_base_V_ARBURST BURST 1 2 }  { m_axi_out_frame_base_V_ARLOCK LOCK 1 2 }  { m_axi_out_frame_base_V_ARCACHE CACHE 1 4 }  { m_axi_out_frame_base_V_ARPROT PROT 1 3 }  { m_axi_out_frame_base_V_ARQOS QOS 1 4 }  { m_axi_out_frame_base_V_ARREGION REGION 1 4 }  { m_axi_out_frame_base_V_ARUSER USER 1 1 }  { m_axi_out_frame_base_V_RVALID VALID 0 1 }  { m_axi_out_frame_base_V_RREADY READY 1 1 }  { m_axi_out_frame_base_V_RDATA DATA 0 64 }  { m_axi_out_frame_base_V_RLAST LAST 0 1 }  { m_axi_out_frame_base_V_RID ID 0 1 }  { m_axi_out_frame_base_V_RUSER USER 0 1 }  { m_axi_out_frame_base_V_RRESP RESP 0 2 }  { m_axi_out_frame_base_V_BVALID VALID 0 1 }  { m_axi_out_frame_base_V_BREADY READY 1 1 }  { m_axi_out_frame_base_V_BRESP RESP 0 2 }  { m_axi_out_frame_base_V_BID ID 0 1 }  { m_axi_out_frame_base_V_BUSER USER 0 1 } } }
	in_frame0_tile0_0_V { ap_none {  { in_frame0_tile0_0_V out_data 1 16 } } }
	in_frame0_tile0_1_V { ap_none {  { in_frame0_tile0_1_V out_data 1 16 } } }
	in_frame0_tile0_2_V { ap_none {  { in_frame0_tile0_2_V out_data 1 16 } } }
	in_frame0_tile0_3_V { ap_none {  { in_frame0_tile0_3_V out_data 1 16 } } }
	in_frame0_tile0_4_V { ap_none {  { in_frame0_tile0_4_V out_data 1 16 } } }
	in_frame0_tile0_5_V { ap_none {  { in_frame0_tile0_5_V out_data 1 16 } } }
	in_frame0_tile1_0_V { ap_none {  { in_frame0_tile1_0_V out_data 1 16 } } }
	in_frame0_tile1_1_V { ap_none {  { in_frame0_tile1_1_V out_data 1 16 } } }
	in_frame0_tile1_2_V { ap_none {  { in_frame0_tile1_2_V out_data 1 16 } } }
	in_frame0_tile1_3_V { ap_none {  { in_frame0_tile1_3_V out_data 1 16 } } }
	in_frame0_tile1_4_V { ap_none {  { in_frame0_tile1_4_V out_data 1 16 } } }
	in_frame0_tile1_5_V { ap_none {  { in_frame0_tile1_5_V out_data 1 16 } } }
	in_frame1_tile0_0_V { ap_none {  { in_frame1_tile0_0_V out_data 1 16 } } }
	in_frame1_tile0_1_V { ap_none {  { in_frame1_tile0_1_V out_data 1 16 } } }
	in_frame1_tile0_2_V { ap_none {  { in_frame1_tile0_2_V out_data 1 16 } } }
	in_frame1_tile0_3_V { ap_none {  { in_frame1_tile0_3_V out_data 1 16 } } }
	in_frame1_tile0_4_V { ap_none {  { in_frame1_tile0_4_V out_data 1 16 } } }
	in_frame1_tile0_5_V { ap_none {  { in_frame1_tile0_5_V out_data 1 16 } } }
	in_frame1_tile1_0_V { ap_none {  { in_frame1_tile1_0_V out_data 1 16 } } }
	in_frame1_tile1_1_V { ap_none {  { in_frame1_tile1_1_V out_data 1 16 } } }
	in_frame1_tile1_2_V { ap_none {  { in_frame1_tile1_2_V out_data 1 16 } } }
	in_frame1_tile1_3_V { ap_none {  { in_frame1_tile1_3_V out_data 1 16 } } }
	in_frame1_tile1_4_V { ap_none {  { in_frame1_tile1_4_V out_data 1 16 } } }
	in_frame1_tile1_5_V { ap_none {  { in_frame1_tile1_5_V out_data 1 16 } } }
	out_frame0_tile0_0_V { ap_none {  { out_frame0_tile0_0_V in_data 0 16 } } }
	out_frame0_tile0_1_V { ap_none {  { out_frame0_tile0_1_V in_data 0 16 } } }
	out_frame0_tile0_2_V { ap_none {  { out_frame0_tile0_2_V in_data 0 16 } } }
	out_frame0_tile0_3_V { ap_none {  { out_frame0_tile0_3_V in_data 0 16 } } }
	out_frame0_tile0_4_V { ap_none {  { out_frame0_tile0_4_V in_data 0 16 } } }
	out_frame0_tile0_5_V { ap_none {  { out_frame0_tile0_5_V in_data 0 16 } } }
	out_frame0_tile1_0_V { ap_none {  { out_frame0_tile1_0_V in_data 0 16 } } }
	out_frame0_tile1_1_V { ap_none {  { out_frame0_tile1_1_V in_data 0 16 } } }
	out_frame0_tile1_2_V { ap_none {  { out_frame0_tile1_2_V in_data 0 16 } } }
	out_frame0_tile1_3_V { ap_none {  { out_frame0_tile1_3_V in_data 0 16 } } }
	out_frame0_tile1_4_V { ap_none {  { out_frame0_tile1_4_V in_data 0 16 } } }
	out_frame0_tile1_5_V { ap_none {  { out_frame0_tile1_5_V in_data 0 16 } } }
	out_frame1_tile0_0_V { ap_none {  { out_frame1_tile0_0_V in_data 0 16 } } }
	out_frame1_tile0_1_V { ap_none {  { out_frame1_tile0_1_V in_data 0 16 } } }
	out_frame1_tile0_2_V { ap_none {  { out_frame1_tile0_2_V in_data 0 16 } } }
	out_frame1_tile0_3_V { ap_none {  { out_frame1_tile0_3_V in_data 0 16 } } }
	out_frame1_tile0_4_V { ap_none {  { out_frame1_tile0_4_V in_data 0 16 } } }
	out_frame1_tile0_5_V { ap_none {  { out_frame1_tile0_5_V in_data 0 16 } } }
	out_frame1_tile1_0_V { ap_none {  { out_frame1_tile1_0_V in_data 0 16 } } }
	out_frame1_tile1_1_V { ap_none {  { out_frame1_tile1_1_V in_data 0 16 } } }
	out_frame1_tile1_2_V { ap_none {  { out_frame1_tile1_2_V in_data 0 16 } } }
	out_frame1_tile1_3_V { ap_none {  { out_frame1_tile1_3_V in_data 0 16 } } }
	out_frame1_tile1_4_V { ap_none {  { out_frame1_tile1_4_V in_data 0 16 } } }
	out_frame1_tile1_5_V { ap_none {  { out_frame1_tile1_5_V in_data 0 16 } } }
}

set busDeadlockParameterList { 
	{ in_frame_base_V { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
	{ out_frame_base_V { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ in_frame_base_V 1 }
	{ out_frame_base_V 1 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ in_frame_base_V 1 }
	{ out_frame_base_V 1 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
