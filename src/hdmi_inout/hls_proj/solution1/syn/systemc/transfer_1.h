// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.3
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _transfer_1_HH_
#define _transfer_1_HH_

#include "systemc.h"
#include "AESL_pkg.h"


namespace ap_rtl {

struct transfer_1 : public sc_module {
    // Port declarations 52
    sc_in_clk ap_clk;
    sc_in< sc_logic > ap_rst;
    sc_in< sc_logic > ap_start;
    sc_out< sc_logic > ap_done;
    sc_out< sc_logic > ap_idle;
    sc_out< sc_logic > ap_ready;
    sc_out< sc_logic > m_axi_dma_AWVALID;
    sc_in< sc_logic > m_axi_dma_AWREADY;
    sc_out< sc_lv<32> > m_axi_dma_AWADDR;
    sc_out< sc_lv<1> > m_axi_dma_AWID;
    sc_out< sc_lv<32> > m_axi_dma_AWLEN;
    sc_out< sc_lv<3> > m_axi_dma_AWSIZE;
    sc_out< sc_lv<2> > m_axi_dma_AWBURST;
    sc_out< sc_lv<2> > m_axi_dma_AWLOCK;
    sc_out< sc_lv<4> > m_axi_dma_AWCACHE;
    sc_out< sc_lv<3> > m_axi_dma_AWPROT;
    sc_out< sc_lv<4> > m_axi_dma_AWQOS;
    sc_out< sc_lv<4> > m_axi_dma_AWREGION;
    sc_out< sc_lv<1> > m_axi_dma_AWUSER;
    sc_out< sc_logic > m_axi_dma_WVALID;
    sc_in< sc_logic > m_axi_dma_WREADY;
    sc_out< sc_lv<32> > m_axi_dma_WDATA;
    sc_out< sc_lv<4> > m_axi_dma_WSTRB;
    sc_out< sc_logic > m_axi_dma_WLAST;
    sc_out< sc_lv<1> > m_axi_dma_WID;
    sc_out< sc_lv<1> > m_axi_dma_WUSER;
    sc_out< sc_logic > m_axi_dma_ARVALID;
    sc_in< sc_logic > m_axi_dma_ARREADY;
    sc_out< sc_lv<32> > m_axi_dma_ARADDR;
    sc_out< sc_lv<1> > m_axi_dma_ARID;
    sc_out< sc_lv<32> > m_axi_dma_ARLEN;
    sc_out< sc_lv<3> > m_axi_dma_ARSIZE;
    sc_out< sc_lv<2> > m_axi_dma_ARBURST;
    sc_out< sc_lv<2> > m_axi_dma_ARLOCK;
    sc_out< sc_lv<4> > m_axi_dma_ARCACHE;
    sc_out< sc_lv<3> > m_axi_dma_ARPROT;
    sc_out< sc_lv<4> > m_axi_dma_ARQOS;
    sc_out< sc_lv<4> > m_axi_dma_ARREGION;
    sc_out< sc_lv<1> > m_axi_dma_ARUSER;
    sc_in< sc_logic > m_axi_dma_RVALID;
    sc_out< sc_logic > m_axi_dma_RREADY;
    sc_in< sc_lv<32> > m_axi_dma_RDATA;
    sc_in< sc_logic > m_axi_dma_RLAST;
    sc_in< sc_lv<1> > m_axi_dma_RID;
    sc_in< sc_lv<1> > m_axi_dma_RUSER;
    sc_in< sc_lv<2> > m_axi_dma_RRESP;
    sc_in< sc_logic > m_axi_dma_BVALID;
    sc_out< sc_logic > m_axi_dma_BREADY;
    sc_in< sc_lv<2> > m_axi_dma_BRESP;
    sc_in< sc_lv<1> > m_axi_dma_BID;
    sc_in< sc_lv<1> > m_axi_dma_BUSER;
    sc_in< sc_lv<32> > addr;


    // Module declarations
    transfer_1(sc_module_name name);
    SC_HAS_PROCESS(transfer_1);

    ~transfer_1();

    sc_trace_file* mVcdFile;

    sc_signal< sc_lv<17> > ap_CS_fsm;
    sc_signal< sc_logic > ap_CS_fsm_state1;
    sc_signal< sc_logic > dma_blk_n_AW;
    sc_signal< sc_logic > dma_blk_n_W;
    sc_signal< sc_logic > ap_CS_fsm_state2;
    sc_signal< sc_logic > dma_blk_n_B;
    sc_signal< sc_logic > ap_CS_fsm_state7;
    sc_signal< sc_logic > ap_CS_fsm_state3;
    sc_signal< sc_logic > ap_CS_fsm_state8;
    sc_signal< sc_logic > ap_CS_fsm_state4;
    sc_signal< sc_logic > ap_CS_fsm_state9;
    sc_signal< sc_logic > dma_blk_n_AR;
    sc_signal< sc_logic > ap_CS_fsm_state10;
    sc_signal< sc_logic > dma_blk_n_R;
    sc_signal< sc_logic > ap_CS_fsm_state17;
    sc_signal< sc_logic > ap_sig_ioackin_m_axi_dma_AWREADY;
    sc_signal< sc_logic > ap_sig_ioackin_m_axi_dma_WREADY;
    sc_signal< bool > ap_block_state2_io;
    sc_signal< bool > ap_block_state3_io;
    sc_signal< sc_logic > ap_reg_ioackin_m_axi_dma_AWREADY;
    sc_signal< sc_logic > ap_reg_ioackin_m_axi_dma_WREADY;
    sc_signal< sc_logic > ap_reg_ioackin_m_axi_dma_ARREADY;
    sc_signal< sc_logic > ap_sig_ioackin_m_axi_dma_ARREADY;
    sc_signal< sc_lv<1> > tmp_fu_140_p3;
    sc_signal< sc_lv<17> > ap_NS_fsm;
    static const sc_logic ap_const_logic_1;
    static const sc_logic ap_const_logic_0;
    static const sc_lv<17> ap_ST_fsm_state1;
    static const sc_lv<17> ap_ST_fsm_state2;
    static const sc_lv<17> ap_ST_fsm_state3;
    static const sc_lv<17> ap_ST_fsm_state4;
    static const sc_lv<17> ap_ST_fsm_state5;
    static const sc_lv<17> ap_ST_fsm_state6;
    static const sc_lv<17> ap_ST_fsm_state7;
    static const sc_lv<17> ap_ST_fsm_state8;
    static const sc_lv<17> ap_ST_fsm_state9;
    static const sc_lv<17> ap_ST_fsm_state10;
    static const sc_lv<17> ap_ST_fsm_state11;
    static const sc_lv<17> ap_ST_fsm_state12;
    static const sc_lv<17> ap_ST_fsm_state13;
    static const sc_lv<17> ap_ST_fsm_state14;
    static const sc_lv<17> ap_ST_fsm_state15;
    static const sc_lv<17> ap_ST_fsm_state16;
    static const sc_lv<17> ap_ST_fsm_state17;
    static const sc_lv<32> ap_const_lv32_0;
    static const sc_lv<32> ap_const_lv32_1;
    static const sc_lv<32> ap_const_lv32_6;
    static const sc_lv<32> ap_const_lv32_2;
    static const sc_lv<32> ap_const_lv32_7;
    static const sc_lv<32> ap_const_lv32_3;
    static const sc_lv<32> ap_const_lv32_8;
    static const sc_lv<32> ap_const_lv32_9;
    static const sc_lv<32> ap_const_lv32_10;
    static const bool ap_const_boolean_0;
    static const sc_lv<64> ap_const_lv64_10780006;
    static const sc_lv<64> ap_const_lv64_10780000;
    static const sc_lv<64> ap_const_lv64_1078000A;
    static const sc_lv<64> ap_const_lv64_10780001;
    static const sc_lv<1> ap_const_lv1_0;
    static const sc_lv<3> ap_const_lv3_0;
    static const sc_lv<2> ap_const_lv2_0;
    static const sc_lv<4> ap_const_lv4_0;
    static const sc_lv<4> ap_const_lv4_F;
    static const sc_lv<32> ap_const_lv32_300;
    static const sc_lv<1> ap_const_lv1_1;
    static const bool ap_const_boolean_1;
    // Thread declarations
    void thread_ap_clk_no_reset_();
    void thread_ap_CS_fsm_state1();
    void thread_ap_CS_fsm_state10();
    void thread_ap_CS_fsm_state17();
    void thread_ap_CS_fsm_state2();
    void thread_ap_CS_fsm_state3();
    void thread_ap_CS_fsm_state4();
    void thread_ap_CS_fsm_state7();
    void thread_ap_CS_fsm_state8();
    void thread_ap_CS_fsm_state9();
    void thread_ap_block_state2_io();
    void thread_ap_block_state3_io();
    void thread_ap_done();
    void thread_ap_idle();
    void thread_ap_ready();
    void thread_ap_sig_ioackin_m_axi_dma_ARREADY();
    void thread_ap_sig_ioackin_m_axi_dma_AWREADY();
    void thread_ap_sig_ioackin_m_axi_dma_WREADY();
    void thread_dma_blk_n_AR();
    void thread_dma_blk_n_AW();
    void thread_dma_blk_n_B();
    void thread_dma_blk_n_R();
    void thread_dma_blk_n_W();
    void thread_m_axi_dma_ARADDR();
    void thread_m_axi_dma_ARBURST();
    void thread_m_axi_dma_ARCACHE();
    void thread_m_axi_dma_ARID();
    void thread_m_axi_dma_ARLEN();
    void thread_m_axi_dma_ARLOCK();
    void thread_m_axi_dma_ARPROT();
    void thread_m_axi_dma_ARQOS();
    void thread_m_axi_dma_ARREGION();
    void thread_m_axi_dma_ARSIZE();
    void thread_m_axi_dma_ARUSER();
    void thread_m_axi_dma_ARVALID();
    void thread_m_axi_dma_AWADDR();
    void thread_m_axi_dma_AWBURST();
    void thread_m_axi_dma_AWCACHE();
    void thread_m_axi_dma_AWID();
    void thread_m_axi_dma_AWLEN();
    void thread_m_axi_dma_AWLOCK();
    void thread_m_axi_dma_AWPROT();
    void thread_m_axi_dma_AWQOS();
    void thread_m_axi_dma_AWREGION();
    void thread_m_axi_dma_AWSIZE();
    void thread_m_axi_dma_AWUSER();
    void thread_m_axi_dma_AWVALID();
    void thread_m_axi_dma_BREADY();
    void thread_m_axi_dma_RREADY();
    void thread_m_axi_dma_WDATA();
    void thread_m_axi_dma_WID();
    void thread_m_axi_dma_WLAST();
    void thread_m_axi_dma_WSTRB();
    void thread_m_axi_dma_WUSER();
    void thread_m_axi_dma_WVALID();
    void thread_tmp_fu_140_p3();
    void thread_ap_NS_fsm();
};

}

using namespace ap_rtl;

#endif
