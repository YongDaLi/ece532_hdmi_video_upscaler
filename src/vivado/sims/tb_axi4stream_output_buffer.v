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
module tb_axi4stream_output_buffer();
    // For now, we use 8-bit AXI data, and a 35-bit data buffer.
    // So, this will take 5 cycles to send.
    reg aclk = 0;
    reg areset = 0;
    
    // AXI control signals.
    wire [7:0] tdata;
    wire tvalid;            // mdoule is the producer of data, it drives tvalid
    wire tlast;
    reg tready;             // testbench is the consumer of data, so we drive tready (to tell module to send data)
    
    // Computed Buffer
    reg [34:0] buffer;
    reg valid;
    
    axi4stream_output_buffer #(
        .AXI_WIDTH(8),
        .BUFFER_WIDTH(35),      // weird number for buffer width, to test that it works
        .NUM_PACKETS(5),
        .LAST_PACKET_WIDTH(3)
    ) b (
        .aclk(aclk),
        .areset(areset),
        
        .tdata(tdata),
        .tvalid(tvalid),
        .tlast(tlast),
        .tready(tready),
        
        .input_buffer(buffer),
        .input_buffer_valid(valid)
    );
    

    initial begin
        valid = 1;
        aclk = 0;
        $monitor("t=%3d, buffer=%x, tdata=%x\n", $time, buffer, tdata);
        forever begin
            #10 aclk = ~aclk;
        end
    end

    // Write data in, using simple ascending ASCII bits per send.
    initial begin
        // ====== first read transmission ==========
        // set buffer
        tready = 0;
        buffer = {3'b000, 32'hDEADBEEF};   // 35 bits long

        // read packets
        #20
        tready = 1;

        // ready 5 packets
        #100

        // after receiving last packet, stop transmission
        tready = 0;



        // ========== long pause ============
        #200


        // ====== second read transmission ==========
        // set buffer
        tready = 0;
        buffer = {3'b001, 32'hCAFEB0BA};   // 35 bits long

        // read packets
        #20
        tready = 1;

        // ready 5 packets
        #100

        // after receiving last packet, stop transmission
        tready = 0;

    end
endmodule
