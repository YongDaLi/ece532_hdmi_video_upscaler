############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project dma_mm2reg_passthrough
set_top dma_mm2reg
add_files ../dma_driver_hls/dma_mm2reg_passthrough.cpp
add_files ../dma_driver_hls/dma_mm2reg_passthrough.cpp
open_solution "dma_mm2reg_passthrough"
set_part {xc7a200tsbg484-1} -tool vivado
create_clock -period 10 -name default
config_export -display_name dma_mm2reg_passthrough -format ip_catalog -rtl verilog -vendor user
#source "./dma_mm2reg_passthrough/dma_mm2reg_passthrough/directives.tcl"
#csim_design
csynth_design
#cosim_design
export_design -rtl verilog -format ip_catalog -vendor "user" -display_name "dma_mm2reg_passthrough"
