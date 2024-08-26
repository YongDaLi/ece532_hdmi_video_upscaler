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
    wire [34:0] buffer;
    wire valid;
    
    axi4stream_input_buffer #(
        .AXI_WIDTH(8),
        .BUFFER_WIDTH(35),      // weird number for buffer width, to test that it works
        .LAST_PACKET_WIDTH(3)
    ) b (
        .aclk(aclk),
        .areset(areset),
        
        .tdata(tdata),
        .tvalid(tvalid),
        .tlast(tlast),
        .tready(tready),
        
        .myBuffer(buffer),
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
        tvalid = 0;

        
        
        // packet 3
        #20
        tdata = 8'hCC;
        tvalid = 1;

        
        // packet 4
        #20
        tdata = 8'hDD;
        
        // packet 5 - last one, set tlast = 1
        // Only the 3 lsb of this should be stored.
        // We set these to 3'b101 for simplicity.
        #20
        tdata = {5'b0, 3'b101};
        tlast = 1;

        // finish sending, wait a while
        #20
        tvalid = 0;

        // send another 5 packets
        // should say "DEADBEEF"
        #200
        tvalid = 1;     // start of new packet, make sure control signals are correct
        tlast = 0;
        tdata = 8'hEF;  // packet 1
        #20
        tdata = 8'hBE;  // packet 2
        #20
        tdata = 8'hAD;  // packet 3
        #20
        tdata = 8'hDE;  // packet 4

        #20
        tdata = 8'hFF;  // packet 5, send garbage for the last "last" packet 
        tlast = 1;

        #20
        tvalid = 0;

    end
endmodule
