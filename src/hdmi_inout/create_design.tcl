set script_path [file dirname [file normalize [info script]]]
set digilent_ip_path $script_path/../vivado-library

# Create a new project
create_project hdmi_inout ./proj -part xc7a200tsbg484-1
set_property BOARD_PART digilentinc.com:nexys_video:part0:1.2 [current_project]

set_property IP_REPO_PATHS $digilent_ip_path [current_project]
update_ip_catalog

# Set properties
set_property target_language Verilog [current_project]

# Copy the 720p 30Hz EDID ROM into the digilent IP
# TODO: find a less hacky way to do this
file copy -force dgl_720p_cea.data ../vivado-library/ip/dvi2rgb/src

# Add all design files
add_files hdl/
add_files -fileset constrs_1 constrs/
# Generate block diagram
source create_bd.tcl
