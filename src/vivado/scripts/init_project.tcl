set thisFile [ dict get [ info frame 0 ] file ]
cd "[file dirname $thisFile]/../"

file delete -force project
source project.tcl

# By default, the project will not source newly added resources.
# Add them now.

# Design files
add_files -fileset sources_1 src/hdl
# read_bd [glob src/bd/**/*.bd]

# Other files
add_files -fileset constrs_1 constraints
add_files -fileset sim_1 sims
add_files -fileset utils_1 utils