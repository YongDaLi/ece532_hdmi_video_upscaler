set moduleName transfer_1
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {transfer.1}
set C_modelType { void 0 }
set C_modelArgList {
	{ dma int 32 regular {axi_master 2}  }
	{ addr int 32 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "dma", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "addr", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 52
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_dma_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_dma_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_dma_AWADDR sc_out sc_lv 32 signal 0 } 
	{ m_axi_dma_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_dma_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_dma_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_dma_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_dma_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_dma_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_dma_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_dma_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_dma_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_dma_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_dma_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_dma_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_dma_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_dma_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_dma_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_dma_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_dma_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_dma_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_dma_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_dma_ARADDR sc_out sc_lv 32 signal 0 } 
	{ m_axi_dma_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_dma_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_dma_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_dma_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_dma_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_dma_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_dma_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_dma_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_dma_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_dma_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_dma_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_dma_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_dma_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_dma_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_dma_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_dma_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_dma_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_dma_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_dma_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_dma_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_dma_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_dma_BUSER sc_in sc_lv 1 signal 0 } 
	{ addr sc_in sc_lv 32 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_dma_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma", "role": "AWVALID" }} , 
 	{ "name": "m_axi_dma_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma", "role": "AWREADY" }} , 
 	{ "name": "m_axi_dma_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dma", "role": "AWADDR" }} , 
 	{ "name": "m_axi_dma_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dma", "role": "AWID" }} , 
 	{ "name": "m_axi_dma_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dma", "role": "AWLEN" }} , 
 	{ "name": "m_axi_dma_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "dma", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_dma_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "dma", "role": "AWBURST" }} , 
 	{ "name": "m_axi_dma_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "dma", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_dma_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "dma", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_dma_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "dma", "role": "AWPROT" }} , 
 	{ "name": "m_axi_dma_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "dma", "role": "AWQOS" }} , 
 	{ "name": "m_axi_dma_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "dma", "role": "AWREGION" }} , 
 	{ "name": "m_axi_dma_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dma", "role": "AWUSER" }} , 
 	{ "name": "m_axi_dma_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma", "role": "WVALID" }} , 
 	{ "name": "m_axi_dma_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma", "role": "WREADY" }} , 
 	{ "name": "m_axi_dma_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dma", "role": "WDATA" }} , 
 	{ "name": "m_axi_dma_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "dma", "role": "WSTRB" }} , 
 	{ "name": "m_axi_dma_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma", "role": "WLAST" }} , 
 	{ "name": "m_axi_dma_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dma", "role": "WID" }} , 
 	{ "name": "m_axi_dma_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dma", "role": "WUSER" }} , 
 	{ "name": "m_axi_dma_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma", "role": "ARVALID" }} , 
 	{ "name": "m_axi_dma_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma", "role": "ARREADY" }} , 
 	{ "name": "m_axi_dma_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dma", "role": "ARADDR" }} , 
 	{ "name": "m_axi_dma_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dma", "role": "ARID" }} , 
 	{ "name": "m_axi_dma_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dma", "role": "ARLEN" }} , 
 	{ "name": "m_axi_dma_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "dma", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_dma_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "dma", "role": "ARBURST" }} , 
 	{ "name": "m_axi_dma_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "dma", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_dma_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "dma", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_dma_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "dma", "role": "ARPROT" }} , 
 	{ "name": "m_axi_dma_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "dma", "role": "ARQOS" }} , 
 	{ "name": "m_axi_dma_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "dma", "role": "ARREGION" }} , 
 	{ "name": "m_axi_dma_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dma", "role": "ARUSER" }} , 
 	{ "name": "m_axi_dma_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma", "role": "RVALID" }} , 
 	{ "name": "m_axi_dma_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma", "role": "RREADY" }} , 
 	{ "name": "m_axi_dma_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dma", "role": "RDATA" }} , 
 	{ "name": "m_axi_dma_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma", "role": "RLAST" }} , 
 	{ "name": "m_axi_dma_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dma", "role": "RID" }} , 
 	{ "name": "m_axi_dma_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dma", "role": "RUSER" }} , 
 	{ "name": "m_axi_dma_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "dma", "role": "RRESP" }} , 
 	{ "name": "m_axi_dma_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma", "role": "BVALID" }} , 
 	{ "name": "m_axi_dma_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dma", "role": "BREADY" }} , 
 	{ "name": "m_axi_dma_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "dma", "role": "BRESP" }} , 
 	{ "name": "m_axi_dma_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dma", "role": "BID" }} , 
 	{ "name": "m_axi_dma_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dma", "role": "BUSER" }} , 
 	{ "name": "addr", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "addr", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
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
			{"Name" : "addr", "Type" : "None", "Direction" : "I"}]}]}


set ArgLastReadFirstWriteLatency {
	transfer_1 {
		dma {Type IO LastRead 16 FirstWrite 1}
		addr {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	dma { m_axi {  { m_axi_dma_AWVALID VALID 1 1 }  { m_axi_dma_AWREADY READY 0 1 }  { m_axi_dma_AWADDR ADDR 1 32 }  { m_axi_dma_AWID ID 1 1 }  { m_axi_dma_AWLEN LEN 1 32 }  { m_axi_dma_AWSIZE SIZE 1 3 }  { m_axi_dma_AWBURST BURST 1 2 }  { m_axi_dma_AWLOCK LOCK 1 2 }  { m_axi_dma_AWCACHE CACHE 1 4 }  { m_axi_dma_AWPROT PROT 1 3 }  { m_axi_dma_AWQOS QOS 1 4 }  { m_axi_dma_AWREGION REGION 1 4 }  { m_axi_dma_AWUSER USER 1 1 }  { m_axi_dma_WVALID VALID 1 1 }  { m_axi_dma_WREADY READY 0 1 }  { m_axi_dma_WDATA DATA 1 32 }  { m_axi_dma_WSTRB STRB 1 4 }  { m_axi_dma_WLAST LAST 1 1 }  { m_axi_dma_WID ID 1 1 }  { m_axi_dma_WUSER USER 1 1 }  { m_axi_dma_ARVALID VALID 1 1 }  { m_axi_dma_ARREADY READY 0 1 }  { m_axi_dma_ARADDR ADDR 1 32 }  { m_axi_dma_ARID ID 1 1 }  { m_axi_dma_ARLEN LEN 1 32 }  { m_axi_dma_ARSIZE SIZE 1 3 }  { m_axi_dma_ARBURST BURST 1 2 }  { m_axi_dma_ARLOCK LOCK 1 2 }  { m_axi_dma_ARCACHE CACHE 1 4 }  { m_axi_dma_ARPROT PROT 1 3 }  { m_axi_dma_ARQOS QOS 1 4 }  { m_axi_dma_ARREGION REGION 1 4 }  { m_axi_dma_ARUSER USER 1 1 }  { m_axi_dma_RVALID VALID 0 1 }  { m_axi_dma_RREADY READY 1 1 }  { m_axi_dma_RDATA DATA 0 32 }  { m_axi_dma_RLAST LAST 0 1 }  { m_axi_dma_RID ID 0 1 }  { m_axi_dma_RUSER USER 0 1 }  { m_axi_dma_RRESP RESP 0 2 }  { m_axi_dma_BVALID VALID 0 1 }  { m_axi_dma_BREADY READY 1 1 }  { m_axi_dma_BRESP RESP 0 2 }  { m_axi_dma_BID ID 0 1 }  { m_axi_dma_BUSER USER 0 1 } } }
	addr { ap_none {  { addr in_data 0 32 } } }
}
