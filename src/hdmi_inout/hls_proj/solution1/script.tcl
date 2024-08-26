############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project hls_proj
set_top dma_master_driver
add_files ../dma_driver_hls/dma_master_driver_hls.cpp
add_files ../dma_driver_hls/dma_master_driver_hls.cpp
open_solution "solution1"
set_part {xc7a200tsbg484-1} -tool vivado
create_clock -period 10 -name default
#source "./hls_proj/solution1/directives.tcl"
#csim_design
csynth_design
#cosim_design
export_design -format ip_catalog
