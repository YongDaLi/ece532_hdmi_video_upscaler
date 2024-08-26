# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1 \
    name dma \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_dma \
    op interface \
    ports { m_axi_dma_AWVALID { O 1 bit } m_axi_dma_AWREADY { I 1 bit } m_axi_dma_AWADDR { O 32 vector } m_axi_dma_AWID { O 1 vector } m_axi_dma_AWLEN { O 32 vector } m_axi_dma_AWSIZE { O 3 vector } m_axi_dma_AWBURST { O 2 vector } m_axi_dma_AWLOCK { O 2 vector } m_axi_dma_AWCACHE { O 4 vector } m_axi_dma_AWPROT { O 3 vector } m_axi_dma_AWQOS { O 4 vector } m_axi_dma_AWREGION { O 4 vector } m_axi_dma_AWUSER { O 1 vector } m_axi_dma_WVALID { O 1 bit } m_axi_dma_WREADY { I 1 bit } m_axi_dma_WDATA { O 32 vector } m_axi_dma_WSTRB { O 4 vector } m_axi_dma_WLAST { O 1 bit } m_axi_dma_WID { O 1 vector } m_axi_dma_WUSER { O 1 vector } m_axi_dma_ARVALID { O 1 bit } m_axi_dma_ARREADY { I 1 bit } m_axi_dma_ARADDR { O 32 vector } m_axi_dma_ARID { O 1 vector } m_axi_dma_ARLEN { O 32 vector } m_axi_dma_ARSIZE { O 3 vector } m_axi_dma_ARBURST { O 2 vector } m_axi_dma_ARLOCK { O 2 vector } m_axi_dma_ARCACHE { O 4 vector } m_axi_dma_ARPROT { O 3 vector } m_axi_dma_ARQOS { O 4 vector } m_axi_dma_ARREGION { O 4 vector } m_axi_dma_ARUSER { O 1 vector } m_axi_dma_RVALID { I 1 bit } m_axi_dma_RREADY { O 1 bit } m_axi_dma_RDATA { I 32 vector } m_axi_dma_RLAST { I 1 bit } m_axi_dma_RID { I 1 vector } m_axi_dma_RUSER { I 1 vector } m_axi_dma_RRESP { I 2 vector } m_axi_dma_BVALID { I 1 bit } m_axi_dma_BREADY { O 1 bit } m_axi_dma_BRESP { I 2 vector } m_axi_dma_BID { I 1 vector } m_axi_dma_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2 \
    name addr \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_addr \
    op interface \
    ports { addr { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


