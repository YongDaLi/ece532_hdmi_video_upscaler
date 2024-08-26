write_project_tcl -no_copy_sources -use_bd_files -force ./project.tcl

# Remove the opening header.
# It references a lot of local filesystem paths.

set state "preheader"
set output {}

set header_pattern "\\#\\*\\**"

set f [open "./project.tcl" "r"]

while {[gets $f line] != -1} {
    if [string match $header_pattern $line] {
        switch $state {
            preheader {
                set state header_block_1
            }
            header_block_1 {
                set state header_block_2
            }
            header_block_2 {
                set state body
            }
            body {
                set state body
            }
        }
    }
    
    if {$state in {header_block_1 body}} {
        lappend output $line
    }
}

close $f

set f [open "./project.tcl" "w"]


foreach line $output {
    puts $f $line
}

close $f