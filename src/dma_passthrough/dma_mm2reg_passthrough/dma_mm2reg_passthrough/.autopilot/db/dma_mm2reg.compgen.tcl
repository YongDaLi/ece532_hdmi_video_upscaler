# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Native M_AXI:
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::m_axi_gen] == "::AESL_LIB_XILADAPTER::m_axi_gen"} {
eval "::AESL_LIB_XILADAPTER::m_axi_gen { \
    id 1 \
    corename {m_axi} \
    op interface \
    max_latency -1 \ 
    delay_budget 8.75 \ 
    is_flushable 0 \ 
    name {dma_mm2reg_in_frame_base_V_m_axi} \
} "
} else {
puts "@W \[IMPL-110\] Cannot find AXI interface model in the library. Ignored generation of AXI interface for 'in_frame_base_V'"
}
}

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler dma_mm2reg_in_frame_base_V_m_axi
}

# Native M_AXI:
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::m_axi_gen] == "::AESL_LIB_XILADAPTER::m_axi_gen"} {
eval "::AESL_LIB_XILADAPTER::m_axi_gen { \
    id 2 \
    corename {m_axi} \
    op interface \
    max_latency -1 \ 
    delay_budget 8.75 \ 
    is_flushable 0 \ 
    name {dma_mm2reg_out_frame_base_V_m_axi} \
} "
} else {
puts "@W \[IMPL-110\] Cannot find AXI interface model in the library. Ignored generation of AXI interface for 'out_frame_base_V'"
}
}

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler dma_mm2reg_out_frame_base_V_m_axi
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3 \
    name in_frame0_tile0_0_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_in_frame0_tile0_0_V \
    op interface \
    ports { in_frame0_tile0_0_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4 \
    name in_frame0_tile0_1_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_in_frame0_tile0_1_V \
    op interface \
    ports { in_frame0_tile0_1_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5 \
    name in_frame0_tile0_2_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_in_frame0_tile0_2_V \
    op interface \
    ports { in_frame0_tile0_2_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 6 \
    name in_frame0_tile0_3_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_in_frame0_tile0_3_V \
    op interface \
    ports { in_frame0_tile0_3_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 7 \
    name in_frame0_tile0_4_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_in_frame0_tile0_4_V \
    op interface \
    ports { in_frame0_tile0_4_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 8 \
    name in_frame0_tile0_5_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_in_frame0_tile0_5_V \
    op interface \
    ports { in_frame0_tile0_5_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 9 \
    name in_frame0_tile1_0_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_in_frame0_tile1_0_V \
    op interface \
    ports { in_frame0_tile1_0_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 10 \
    name in_frame0_tile1_1_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_in_frame0_tile1_1_V \
    op interface \
    ports { in_frame0_tile1_1_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 11 \
    name in_frame0_tile1_2_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_in_frame0_tile1_2_V \
    op interface \
    ports { in_frame0_tile1_2_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 12 \
    name in_frame0_tile1_3_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_in_frame0_tile1_3_V \
    op interface \
    ports { in_frame0_tile1_3_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 13 \
    name in_frame0_tile1_4_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_in_frame0_tile1_4_V \
    op interface \
    ports { in_frame0_tile1_4_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 14 \
    name in_frame0_tile1_5_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_in_frame0_tile1_5_V \
    op interface \
    ports { in_frame0_tile1_5_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 15 \
    name in_frame1_tile0_0_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_in_frame1_tile0_0_V \
    op interface \
    ports { in_frame1_tile0_0_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 16 \
    name in_frame1_tile0_1_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_in_frame1_tile0_1_V \
    op interface \
    ports { in_frame1_tile0_1_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 17 \
    name in_frame1_tile0_2_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_in_frame1_tile0_2_V \
    op interface \
    ports { in_frame1_tile0_2_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 18 \
    name in_frame1_tile0_3_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_in_frame1_tile0_3_V \
    op interface \
    ports { in_frame1_tile0_3_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 19 \
    name in_frame1_tile0_4_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_in_frame1_tile0_4_V \
    op interface \
    ports { in_frame1_tile0_4_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 20 \
    name in_frame1_tile0_5_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_in_frame1_tile0_5_V \
    op interface \
    ports { in_frame1_tile0_5_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 21 \
    name in_frame1_tile1_0_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_in_frame1_tile1_0_V \
    op interface \
    ports { in_frame1_tile1_0_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 22 \
    name in_frame1_tile1_1_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_in_frame1_tile1_1_V \
    op interface \
    ports { in_frame1_tile1_1_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 23 \
    name in_frame1_tile1_2_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_in_frame1_tile1_2_V \
    op interface \
    ports { in_frame1_tile1_2_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 24 \
    name in_frame1_tile1_3_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_in_frame1_tile1_3_V \
    op interface \
    ports { in_frame1_tile1_3_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 25 \
    name in_frame1_tile1_4_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_in_frame1_tile1_4_V \
    op interface \
    ports { in_frame1_tile1_4_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 26 \
    name in_frame1_tile1_5_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_in_frame1_tile1_5_V \
    op interface \
    ports { in_frame1_tile1_5_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 27 \
    name out_frame0_tile0_0_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_out_frame0_tile0_0_V \
    op interface \
    ports { out_frame0_tile0_0_V { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 28 \
    name out_frame0_tile0_1_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_out_frame0_tile0_1_V \
    op interface \
    ports { out_frame0_tile0_1_V { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 29 \
    name out_frame0_tile0_2_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_out_frame0_tile0_2_V \
    op interface \
    ports { out_frame0_tile0_2_V { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 30 \
    name out_frame0_tile0_3_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_out_frame0_tile0_3_V \
    op interface \
    ports { out_frame0_tile0_3_V { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 31 \
    name out_frame0_tile0_4_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_out_frame0_tile0_4_V \
    op interface \
    ports { out_frame0_tile0_4_V { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 32 \
    name out_frame0_tile0_5_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_out_frame0_tile0_5_V \
    op interface \
    ports { out_frame0_tile0_5_V { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 33 \
    name out_frame0_tile1_0_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_out_frame0_tile1_0_V \
    op interface \
    ports { out_frame0_tile1_0_V { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 34 \
    name out_frame0_tile1_1_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_out_frame0_tile1_1_V \
    op interface \
    ports { out_frame0_tile1_1_V { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 35 \
    name out_frame0_tile1_2_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_out_frame0_tile1_2_V \
    op interface \
    ports { out_frame0_tile1_2_V { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 36 \
    name out_frame0_tile1_3_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_out_frame0_tile1_3_V \
    op interface \
    ports { out_frame0_tile1_3_V { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 37 \
    name out_frame0_tile1_4_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_out_frame0_tile1_4_V \
    op interface \
    ports { out_frame0_tile1_4_V { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 38 \
    name out_frame0_tile1_5_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_out_frame0_tile1_5_V \
    op interface \
    ports { out_frame0_tile1_5_V { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 39 \
    name out_frame1_tile0_0_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_out_frame1_tile0_0_V \
    op interface \
    ports { out_frame1_tile0_0_V { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 40 \
    name out_frame1_tile0_1_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_out_frame1_tile0_1_V \
    op interface \
    ports { out_frame1_tile0_1_V { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 41 \
    name out_frame1_tile0_2_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_out_frame1_tile0_2_V \
    op interface \
    ports { out_frame1_tile0_2_V { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 42 \
    name out_frame1_tile0_3_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_out_frame1_tile0_3_V \
    op interface \
    ports { out_frame1_tile0_3_V { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 43 \
    name out_frame1_tile0_4_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_out_frame1_tile0_4_V \
    op interface \
    ports { out_frame1_tile0_4_V { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 44 \
    name out_frame1_tile0_5_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_out_frame1_tile0_5_V \
    op interface \
    ports { out_frame1_tile0_5_V { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 45 \
    name out_frame1_tile1_0_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_out_frame1_tile1_0_V \
    op interface \
    ports { out_frame1_tile1_0_V { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 46 \
    name out_frame1_tile1_1_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_out_frame1_tile1_1_V \
    op interface \
    ports { out_frame1_tile1_1_V { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 47 \
    name out_frame1_tile1_2_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_out_frame1_tile1_2_V \
    op interface \
    ports { out_frame1_tile1_2_V { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 48 \
    name out_frame1_tile1_3_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_out_frame1_tile1_3_V \
    op interface \
    ports { out_frame1_tile1_3_V { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 49 \
    name out_frame1_tile1_4_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_out_frame1_tile1_4_V \
    op interface \
    ports { out_frame1_tile1_4_V { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 50 \
    name out_frame1_tile1_5_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_out_frame1_tile1_5_V \
    op interface \
    ports { out_frame1_tile1_5_V { I 16 vector } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -1 \
    name ${PortName} \
    reset_level 0 \
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
set PortName ap_rst_n
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -2 \
    name ${PortName} \
    reset_level 0 \
    sync_rst true \
    corename apif_ap_rst_n \
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


