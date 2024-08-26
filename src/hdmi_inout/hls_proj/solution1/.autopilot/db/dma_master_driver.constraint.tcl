set clock_constraint { \
    name clk \
    module dma_master_driver \
    port ap_clk \
    period 10 \
    uncertainty 1.25 \
}

set all_path {}

set false_path {}

