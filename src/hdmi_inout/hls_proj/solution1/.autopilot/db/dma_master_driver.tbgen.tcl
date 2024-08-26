set moduleName dma_master_driver
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
set C_modelName {dma_master_driver}
set C_modelType { void 0 }
set C_modelArgList {
	{ dma0 int 32 regular {axi_master 2}  }
	{ dma1 int 32 unused {axi_master 0}  }
	{ frame_trigger_V int 1 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "dma0", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READWRITE", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "dma0","cData": "unsigned int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "dma1", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "dma1","cData": "unsigned int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "frame_trigger_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "frame_trigger.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} ]}
# RTL Port declarations: 
set portNum 93
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ m_axi_dma0_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_dma0_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_dma0_AWADDR sc_out sc_lv 32 signal 0 } 
	{ m_axi_dma0_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_dma0_AWLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_dma0_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_dma0_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_dma0_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_dma0_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_dma0_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_dma0_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_dma0_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_dma0_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_dma0_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_dma0_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_dma0_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_dma0_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_dma0_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_dma0_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_dma0_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_dma0_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_dma0_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_dma0_ARADDR sc_out sc_lv 32 signal 0 } 
	{ m_axi_dma0_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_dma0_ARLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_dma0_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_dma0_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_dma0_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_dma0_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_dma0_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_dma0_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_dma0_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_dma0_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_dma0_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_dma0_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_dma0_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_dma0_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_dma0_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_dma0_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_dma0_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_dma0_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_dma0_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_dma0_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_dma0_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_dma0_BUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_dma1_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_dma1_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_dma1_AWADDR sc_out sc_lv 32 signal 1 } 
	{ m_axi_dma1_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_dma1_AWLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_dma1_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_dma1_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_dma1_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_dma1_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_dma1_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_dma1_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_dma1_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_dma1_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_dma1_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_dma1_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_dma1_WDATA sc_out sc_lv 32 signal 1 } 
	{ m_axi_dma1_WSTRB sc_out sc_lv 4 signal 1 } 
	{ m_axi_dma1_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_dma1_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_dma1_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_dma1_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_dma1_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_dma1_ARADDR sc_out sc_lv 32 signal 1 } 
	{ m_axi_dma1_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_dma1_ARLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_dma1_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_dma1_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_dma1_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_dma1_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_dma1_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_dma1_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_dma1_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_dma1_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_dma1_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_dma1_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_dma1_RDATA sc_in sc_lv 32 signal 1 } 
	{ m_axi_dma1_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_dma1_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_dma1_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_dma1_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_dma1_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_dma1_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_dma1_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_dma1_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_dma1_BUSER sc_in sc_lv 1 signal 1 } 
	{ frame_trigger_V sc_in sc_lv 1 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "m_axi_dma0_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma0", "role": "AWVALID" }} , 
 	{ "name": "m_axi_dma0_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma0", "role": "AWREADY" }} , 
 	{ "name": "m_axi_dma0_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dma0", "role": "AWADDR" }} , 
 	{ "name": "m_axi_dma0_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dma0", "role": "AWID" }} , 
 	{ "name": "m_axi_dma0_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "dma0", "role": "AWLEN" }} , 
 	{ "name": "m_axi_dma0_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "dma0", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_dma0_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "dma0", "role": "AWBURST" }} , 
 	{ "name": "m_axi_dma0_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "dma0", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_dma0_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "dma0", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_dma0_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "dma0", "role": "AWPROT" }} , 
 	{ "name": "m_axi_dma0_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "dma0", "role": "AWQOS" }} , 
 	{ "name": "m_axi_dma0_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "dma0", "role": "AWREGION" }} , 
 	{ "name": "m_axi_dma0_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dma0", "role": "AWUSER" }} , 
 	{ "name": "m_axi_dma0_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma0", "role": "WVALID" }} , 
 	{ "name": "m_axi_dma0_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma0", "role": "WREADY" }} , 
 	{ "name": "m_axi_dma0_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dma0", "role": "WDATA" }} , 
 	{ "name": "m_axi_dma0_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "dma0", "role": "WSTRB" }} , 
 	{ "name": "m_axi_dma0_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma0", "role": "WLAST" }} , 
 	{ "name": "m_axi_dma0_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dma0", "role": "WID" }} , 
 	{ "name": "m_axi_dma0_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dma0", "role": "WUSER" }} , 
 	{ "name": "m_axi_dma0_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma0", "role": "ARVALID" }} , 
 	{ "name": "m_axi_dma0_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma0", "role": "ARREADY" }} , 
 	{ "name": "m_axi_dma0_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dma0", "role": "ARADDR" }} , 
 	{ "name": "m_axi_dma0_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dma0", "role": "ARID" }} , 
 	{ "name": "m_axi_dma0_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "dma0", "role": "ARLEN" }} , 
 	{ "name": "m_axi_dma0_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "dma0", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_dma0_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "dma0", "role": "ARBURST" }} , 
 	{ "name": "m_axi_dma0_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "dma0", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_dma0_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "dma0", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_dma0_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "dma0", "role": "ARPROT" }} , 
 	{ "name": "m_axi_dma0_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "dma0", "role": "ARQOS" }} , 
 	{ "name": "m_axi_dma0_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "dma0", "role": "ARREGION" }} , 
 	{ "name": "m_axi_dma0_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dma0", "role": "ARUSER" }} , 
 	{ "name": "m_axi_dma0_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma0", "role": "RVALID" }} , 
 	{ "name": "m_axi_dma0_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma0", "role": "RREADY" }} , 
 	{ "name": "m_axi_dma0_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dma0", "role": "RDATA" }} , 
 	{ "name": "m_axi_dma0_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma0", "role": "RLAST" }} , 
 	{ "name": "m_axi_dma0_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dma0", "role": "RID" }} , 
 	{ "name": "m_axi_dma0_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dma0", "role": "RUSER" }} , 
 	{ "name": "m_axi_dma0_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "dma0", "role": "RRESP" }} , 
 	{ "name": "m_axi_dma0_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma0", "role": "BVALID" }} , 
 	{ "name": "m_axi_dma0_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma0", "role": "BREADY" }} , 
 	{ "name": "m_axi_dma0_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "dma0", "role": "BRESP" }} , 
 	{ "name": "m_axi_dma0_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dma0", "role": "BID" }} , 
 	{ "name": "m_axi_dma0_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dma0", "role": "BUSER" }} , 
 	{ "name": "m_axi_dma1_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma1", "role": "AWVALID" }} , 
 	{ "name": "m_axi_dma1_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma1", "role": "AWREADY" }} , 
 	{ "name": "m_axi_dma1_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dma1", "role": "AWADDR" }} , 
 	{ "name": "m_axi_dma1_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dma1", "role": "AWID" }} , 
 	{ "name": "m_axi_dma1_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "dma1", "role": "AWLEN" }} , 
 	{ "name": "m_axi_dma1_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "dma1", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_dma1_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "dma1", "role": "AWBURST" }} , 
 	{ "name": "m_axi_dma1_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "dma1", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_dma1_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "dma1", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_dma1_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "dma1", "role": "AWPROT" }} , 
 	{ "name": "m_axi_dma1_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "dma1", "role": "AWQOS" }} , 
 	{ "name": "m_axi_dma1_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "dma1", "role": "AWREGION" }} , 
 	{ "name": "m_axi_dma1_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dma1", "role": "AWUSER" }} , 
 	{ "name": "m_axi_dma1_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma1", "role": "WVALID" }} , 
 	{ "name": "m_axi_dma1_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma1", "role": "WREADY" }} , 
 	{ "name": "m_axi_dma1_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dma1", "role": "WDATA" }} , 
 	{ "name": "m_axi_dma1_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "dma1", "role": "WSTRB" }} , 
 	{ "name": "m_axi_dma1_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma1", "role": "WLAST" }} , 
 	{ "name": "m_axi_dma1_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dma1", "role": "WID" }} , 
 	{ "name": "m_axi_dma1_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dma1", "role": "WUSER" }} , 
 	{ "name": "m_axi_dma1_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma1", "role": "ARVALID" }} , 
 	{ "name": "m_axi_dma1_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma1", "role": "ARREADY" }} , 
 	{ "name": "m_axi_dma1_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dma1", "role": "ARADDR" }} , 
 	{ "name": "m_axi_dma1_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dma1", "role": "ARID" }} , 
 	{ "name": "m_axi_dma1_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "dma1", "role": "ARLEN" }} , 
 	{ "name": "m_axi_dma1_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "dma1", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_dma1_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "dma1", "role": "ARBURST" }} , 
 	{ "name": "m_axi_dma1_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "dma1", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_dma1_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "dma1", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_dma1_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "dma1", "role": "ARPROT" }} , 
 	{ "name": "m_axi_dma1_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "dma1", "role": "ARQOS" }} , 
 	{ "name": "m_axi_dma1_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "dma1", "role": "ARREGION" }} , 
 	{ "name": "m_axi_dma1_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dma1", "role": "ARUSER" }} , 
 	{ "name": "m_axi_dma1_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma1", "role": "RVALID" }} , 
 	{ "name": "m_axi_dma1_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma1", "role": "RREADY" }} , 
 	{ "name": "m_axi_dma1_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dma1", "role": "RDATA" }} , 
 	{ "name": "m_axi_dma1_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma1", "role": "RLAST" }} , 
 	{ "name": "m_axi_dma1_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dma1", "role": "RID" }} , 
 	{ "name": "m_axi_dma1_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dma1", "role": "RUSER" }} , 
 	{ "name": "m_axi_dma1_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "dma1", "role": "RRESP" }} , 
 	{ "name": "m_axi_dma1_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma1", "role": "BVALID" }} , 
 	{ "name": "m_axi_dma1_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma1", "role": "BREADY" }} , 
 	{ "name": "m_axi_dma1_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "dma1", "role": "BRESP" }} , 
 	{ "name": "m_axi_dma1_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dma1", "role": "BID" }} , 
 	{ "name": "m_axi_dma1_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dma1", "role": "BUSER" }} , 
 	{ "name": "frame_trigger_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "frame_trigger_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "4", "6", "7"],
		"CDFG" : "dma_master_driver",
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
		"WaitState" : [
			{"State" : "ap_ST_fsm_state25", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_transfer_chunk_1_fu_87"},
			{"State" : "ap_ST_fsm_state27", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_transfer_chunk_fu_95"}],
		"Port" : [
			{"Name" : "dma0", "Type" : "MAXI", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_transfer_chunk_fu_95", "Port" : "dma"},
					{"ID" : "2", "SubInstance" : "grp_transfer_chunk_1_fu_87", "Port" : "dma"}]},
			{"Name" : "dma1", "Type" : "MAXI", "Direction" : "I"},
			{"Name" : "frame_trigger_V", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dma_master_driver_dma0_m_axi_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_transfer_chunk_1_fu_87", "Parent" : "0", "Child" : ["3"],
		"CDFG" : "transfer_chunk_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"WaitState" : [
			{"State" : "ap_ST_fsm_state5", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_transfer_1_fu_75"}],
		"Port" : [
			{"Name" : "dma", "Type" : "MAXI", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_transfer_1_fu_75", "Port" : "dma"}]},
			{"Name" : "row", "Type" : "None", "Direction" : "I"},
			{"Name" : "col", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transfer_chunk_1_fu_87.grp_transfer_1_fu_75", "Parent" : "2",
		"CDFG" : "transfer_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
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
			{"Name" : "dma", "Type" : "MAXI", "Direction" : "IO",
				"BlockSignal" : [
					{"Name" : "dma_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "dma_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "dma_blk_n_B", "Type" : "RtlSignal"},
					{"Name" : "dma_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "dma_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "addr", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_transfer_chunk_fu_95", "Parent" : "0", "Child" : ["5"],
		"CDFG" : "transfer_chunk",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"WaitState" : [
			{"State" : "ap_ST_fsm_state5", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_transfer_fu_75"}],
		"Port" : [
			{"Name" : "dma", "Type" : "MAXI", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_transfer_fu_75", "Port" : "dma"}]},
			{"Name" : "row", "Type" : "None", "Direction" : "I"},
			{"Name" : "col", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transfer_chunk_fu_95.grp_transfer_fu_75", "Parent" : "4",
		"CDFG" : "transfer",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
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
			{"Name" : "dma", "Type" : "MAXI", "Direction" : "IO",
				"BlockSignal" : [
					{"Name" : "dma_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "dma_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "dma_blk_n_B", "Type" : "RtlSignal"},
					{"Name" : "dma_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "dma_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "addr", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dma_master_driverbkb_U11", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dma_master_drivercud_U12", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	dma_master_driver {
		dma0 {Type IO LastRead 16 FirstWrite 1}
		dma1 {Type I LastRead -1 FirstWrite -1}
		frame_trigger_V {Type I LastRead 0 FirstWrite -1}}
	transfer_chunk_1 {
		dma {Type IO LastRead 16 FirstWrite 1}
		row {Type I LastRead 0 FirstWrite -1}
		col {Type I LastRead 0 FirstWrite -1}}
	transfer_1 {
		dma {Type IO LastRead 16 FirstWrite 1}
		addr {Type I LastRead 1 FirstWrite -1}}
	transfer_chunk {
		dma {Type IO LastRead 16 FirstWrite 1}
		row {Type I LastRead 0 FirstWrite -1}
		col {Type I LastRead 0 FirstWrite -1}}
	transfer {
		dma {Type IO LastRead 16 FirstWrite 1}
		addr {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	dma0 { m_axi {  { m_axi_dma0_AWVALID VALID 1 1 }  { m_axi_dma0_AWREADY READY 0 1 }  { m_axi_dma0_AWADDR ADDR 1 32 }  { m_axi_dma0_AWID ID 1 1 }  { m_axi_dma0_AWLEN LEN 1 8 }  { m_axi_dma0_AWSIZE SIZE 1 3 }  { m_axi_dma0_AWBURST BURST 1 2 }  { m_axi_dma0_AWLOCK LOCK 1 2 }  { m_axi_dma0_AWCACHE CACHE 1 4 }  { m_axi_dma0_AWPROT PROT 1 3 }  { m_axi_dma0_AWQOS QOS 1 4 }  { m_axi_dma0_AWREGION REGION 1 4 }  { m_axi_dma0_AWUSER USER 1 1 }  { m_axi_dma0_WVALID VALID 1 1 }  { m_axi_dma0_WREADY READY 0 1 }  { m_axi_dma0_WDATA DATA 1 32 }  { m_axi_dma0_WSTRB STRB 1 4 }  { m_axi_dma0_WLAST LAST 1 1 }  { m_axi_dma0_WID ID 1 1 }  { m_axi_dma0_WUSER USER 1 1 }  { m_axi_dma0_ARVALID VALID 1 1 }  { m_axi_dma0_ARREADY READY 0 1 }  { m_axi_dma0_ARADDR ADDR 1 32 }  { m_axi_dma0_ARID ID 1 1 }  { m_axi_dma0_ARLEN LEN 1 8 }  { m_axi_dma0_ARSIZE SIZE 1 3 }  { m_axi_dma0_ARBURST BURST 1 2 }  { m_axi_dma0_ARLOCK LOCK 1 2 }  { m_axi_dma0_ARCACHE CACHE 1 4 }  { m_axi_dma0_ARPROT PROT 1 3 }  { m_axi_dma0_ARQOS QOS 1 4 }  { m_axi_dma0_ARREGION REGION 1 4 }  { m_axi_dma0_ARUSER USER 1 1 }  { m_axi_dma0_RVALID VALID 0 1 }  { m_axi_dma0_RREADY READY 1 1 }  { m_axi_dma0_RDATA DATA 0 32 }  { m_axi_dma0_RLAST LAST 0 1 }  { m_axi_dma0_RID ID 0 1 }  { m_axi_dma0_RUSER USER 0 1 }  { m_axi_dma0_RRESP RESP 0 2 }  { m_axi_dma0_BVALID VALID 0 1 }  { m_axi_dma0_BREADY READY 1 1 }  { m_axi_dma0_BRESP RESP 0 2 }  { m_axi_dma0_BID ID 0 1 }  { m_axi_dma0_BUSER USER 0 1 } } }
	dma1 { m_axi {  { m_axi_dma1_AWVALID VALID 1 1 }  { m_axi_dma1_AWREADY READY 0 1 }  { m_axi_dma1_AWADDR ADDR 1 32 }  { m_axi_dma1_AWID ID 1 1 }  { m_axi_dma1_AWLEN LEN 1 8 }  { m_axi_dma1_AWSIZE SIZE 1 3 }  { m_axi_dma1_AWBURST BURST 1 2 }  { m_axi_dma1_AWLOCK LOCK 1 2 }  { m_axi_dma1_AWCACHE CACHE 1 4 }  { m_axi_dma1_AWPROT PROT 1 3 }  { m_axi_dma1_AWQOS QOS 1 4 }  { m_axi_dma1_AWREGION REGION 1 4 }  { m_axi_dma1_AWUSER USER 1 1 }  { m_axi_dma1_WVALID VALID 1 1 }  { m_axi_dma1_WREADY READY 0 1 }  { m_axi_dma1_WDATA DATA 1 32 }  { m_axi_dma1_WSTRB STRB 1 4 }  { m_axi_dma1_WLAST LAST 1 1 }  { m_axi_dma1_WID ID 1 1 }  { m_axi_dma1_WUSER USER 1 1 }  { m_axi_dma1_ARVALID VALID 1 1 }  { m_axi_dma1_ARREADY READY 0 1 }  { m_axi_dma1_ARADDR ADDR 1 32 }  { m_axi_dma1_ARID ID 1 1 }  { m_axi_dma1_ARLEN LEN 1 8 }  { m_axi_dma1_ARSIZE SIZE 1 3 }  { m_axi_dma1_ARBURST BURST 1 2 }  { m_axi_dma1_ARLOCK LOCK 1 2 }  { m_axi_dma1_ARCACHE CACHE 1 4 }  { m_axi_dma1_ARPROT PROT 1 3 }  { m_axi_dma1_ARQOS QOS 1 4 }  { m_axi_dma1_ARREGION REGION 1 4 }  { m_axi_dma1_ARUSER USER 1 1 }  { m_axi_dma1_RVALID VALID 0 1 }  { m_axi_dma1_RREADY READY 1 1 }  { m_axi_dma1_RDATA DATA 0 32 }  { m_axi_dma1_RLAST LAST 0 1 }  { m_axi_dma1_RID ID 0 1 }  { m_axi_dma1_RUSER USER 0 1 }  { m_axi_dma1_RRESP RESP 0 2 }  { m_axi_dma1_BVALID VALID 0 1 }  { m_axi_dma1_BREADY READY 1 1 }  { m_axi_dma1_BRESP RESP 0 2 }  { m_axi_dma1_BID ID 0 1 }  { m_axi_dma1_BUSER USER 0 1 } } }
	frame_trigger_V { ap_none {  { frame_trigger_V in_data 0 1 } } }
}

set busDeadlockParameterList { 
	{ dma0 { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
	{ dma1 { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ dma0 1 }
	{ dma1 1 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ dma0 1 }
	{ dma1 1 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
