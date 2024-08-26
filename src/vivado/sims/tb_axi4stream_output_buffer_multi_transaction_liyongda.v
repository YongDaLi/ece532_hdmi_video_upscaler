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
module tb_axi4stream_output_buffer_multi_transaction_liyongda();
    // For now, we use 8-bit AXI data, and a 35-bit data buffer.
    // So, this will take 5 cycles to send.
    reg aclk = 0;
    reg areset = 0;
    
    // AXI control signals.
    wire [7:0] tdata;       // change size to match packet_size
    wire tvalid;            // module is the producer of data, it drives tvalid
    wire tlast;
    reg tready = 0;             // testbench is the consumer of data, so we drive tready (to tell module to send data)
    
    // Computed Buffer
    reg [39:0] myBuffer;      // change size to match myBuffer
    reg myBuffer_valid;
    
    // 70 = 2x groups of 35 = (8+8+8+8+3) + (8+8+8+8+3)
    // 5 packets per transaction = 8+8+8+8+3
    
    // 80 is to try it nicely algined as 40 + 40
    axi4stream_output_buffer_liyongda #(
        .PACKET_SIZE(8),
        .NROWS(2),      // weird number for buffer width, to test that it works
        .ROW_LENGTH(20),
        .MYBUFFER_SIZE(40)
    ) b (
        .aclk(aclk),
        .areset(areset),
        
        .tdata(tdata),
        .tvalid(tvalid),
        .tlast(tlast),
        .tready(tready),
        
        .myBuffer(myBuffer),
        .myBuffer_valid(myBuffer_valid)
    );
    

    initial begin
        myBuffer_valid = 1;
        aclk = 0;
        $monitor("t=%3d, buffer=%x, tdata=%x\n", $time, myBuffer, tdata);
        forever begin
            #10 aclk = ~aclk;
        end
    end

    // Write data in, using simple ascending ASCII bits per send.
    initial begin
        // myBuffer = {40'h1234FABCD0};
        myBuffer = {8'h12, 8'h34, 4'hF, 8'hAB, 8'hCD, 4'h0};
        tready = 1;  

        #40
        // tready = 1; 
        tready = 0; 

        #20
        tready = 1;    

        #200;
        tready = 0;
    end
endmodule
