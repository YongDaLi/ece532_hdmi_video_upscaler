`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2023 12:08:05 AM
// Design Name: 
// Module Name: tb_axi4stream_input_buffer_multi_transaction
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_axi4stream_input_buffer_multi_transaction_liyongda();
 // For now, we use 8-bit AXI data, and a 35-bit data myBuffer.
    // So, this will take 5 cycles to send.
    reg aclk = 0;
    reg areset = 0;
    
    // AXI control signals.
    reg [7:0] tdata;
    reg tvalid;     // testbench is the producer of data, so it drives tvalid
    reg tlast;
    wire tready;    // module is the consumer of data, so it responds tready
    
    // Computed Buffer
    wire [63:0] myBuffer;
    wire valid;
    
    axi4stream_input_buffer #(
        .AXI_WIDTH(8),
        .BUFFER_WIDTH(64)      // weird number for myBuffer width, to test that it works
    ) b (
        .aclk(aclk),
        .areset(areset),
        
        .tdata(tdata),
        .tvalid(tvalid),
        .tlast(tlast),
        .tready(tready),
        
        .myBuffer(myBuffer),
        .valid(valid)
    );
    

    initial begin
        aclk = 0;
        forever begin
            #1 aclk = ~aclk;
        end
    end

    // Write data in, using simple ascending ASCII bits per send.
    initial begin
        tlast = 0;
        tvalid = 1;
        // packet 1
        tdata = 8'hAA;

        // packet 2
        #2
        tdata = 8'hBB;
        
        // packet 3
        #2
        tdata = 8'hCC;
        
        // packet 4
        #2
        tdata = 8'hDD;
        tlast = 1;

        // finish sending first transaction, wait a while
        #2
        tvalid = 0;
    
        // send another 4 packets
        // should say "DEADBEEF"
        #20
        tvalid = 1;     // start of new packet, make sure control signals are correct
        tlast = 0;
        tdata = 8'hEF;  // packet 1
        #2
        tdata = 8'hBE;  // packet 2
        #2
        tdata = 8'hAD;  // packet 3
        #2
        tdata = 8'hDE;  // packet 4
        tlast = 1;

        #2
        tvalid = 0;
        
        #2
        tvalid = 1;
        tlast = 0;

        #2
        tdata = 8'h21;

        #2
        tdata = 8'h43;

        #2
        tdata = 8'h65;

        #2
        tdata = 8'h87;
        tlast = 0;

        #20
        tvalid = 0;
        tlast = 1;
    end
endmodule

