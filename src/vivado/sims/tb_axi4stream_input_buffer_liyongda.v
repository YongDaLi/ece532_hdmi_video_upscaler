`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2023 05:04:22 AM
// Design Name: 
// Module Name: tb_axi4stream_buffer
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

// Simulate an AXI Stream.
// Use this to transfer data into a buffer,
// Where the buffer is larger than the stream.
module tb_axi4stream_input_buffer();
    // For now, we use 8-bit AXI data, and a 35-bit data buffer.
    // So, this will take 5 cycles to send.
    reg aclk = 0;
    reg areset = 0;
    
    // AXI control signals.
    reg [7:0] tdata;
    reg tvalid;     // testbench is the producer of data, so it drives tvalid
    reg tlast;
    wire tready;    // module is the consumer of data, so it responds tready
    
    // Computed Buffer
    wire [39:0] buffer;
    wire valid;
    
    axi4stream_input_buffer #() b (
        .aclk(aclk),
        .areset(areset),
        
        .tdata(tdata),
        .tvalid(tvalid),
        .tlast(tlast),
        .tready(tready),
        
        .buffer(buffer),
        .valid(valid)
    );
    

    initial begin
        aclk = 0;
        forever begin
            #10 aclk = ~aclk;
        end
    end

    // Write data in, using simple ascending ASCII bits per send.
    initial begin
        tlast = 0;
        tvalid = 1;
        // packet 1
        tdata = 8'hAA;

        // packet 2
        #20
        tdata = 8'hBB;
        
        // packet 3
        #20
        tdata = 8'hCC;

        #20
        tdata = 8'h11;

        #20
        tdata = 8'h22;
        
        #20
        tdata = 8'h33;

        #20
        tvalid = 0;
        tlast = 1;
    

        // wait a while and reset
        #200
        areset = 1;
        #20
        areset = 0;

        // another group
        #20 
        tlast = 0;
        tvalid = 1;
        // packet 1
        tdata = 8'h11;

        // packet 2
        #20
        tdata = 8'h22;
        
        // packet 3
        #20
        tdata = 8'h33;
        
        // packet 4
        #20
        tdata = 8'h44;

        #20
        tvalid = 0;
        tlast = 1;

    end
endmodule
