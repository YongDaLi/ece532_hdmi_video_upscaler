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
module tb_axi4stream_output_buffer_multi_transaction();
    // For now, we use 8-bit AXI data, and a 35-bit data buffer.
    // So, this will take 5 cycles to send.
    reg aclk = 0;
    reg areset = 0;
    
    // AXI control signals.
    wire [7:0] tdata;
    wire tvalid;            // mdoule is the producer of data, it drives tvalid
    wire tlast;
    reg tready = 0;             // testbench is the consumer of data, so we drive tready (to tell module to send data)
    
    // Computed Buffer
    reg [79:0] buffer;
    reg valid;
    
    // 70 = 2x groups of 35 = (8+8+8+8+3) + (8+8+8+8+3)
    // 5 packets per transaction = 8+8+8+8+3
    
    // 80 is to try it nicely algined as 40 + 40
    axi4stream_output_buffer #(
        .AXI_WIDTH(8),
        .BUFFER_WIDTH(80),      // weird number for buffer width, to test that it works
        .NUM_PACKETS(10),
        .NUM_PACKETS_PER_TXN(10)
//        .LAST_PACKET_WIDTH(8)
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
        buffer = {8'hFF, 32'hCAFEB0BA, 8'hFF, 32'hDEADBEEF};
        
        // read 5 packets and end transaction.
        #20
        tready = 1;
        #200
        tready = 0;


        // ========== long pause between transactions ============
        #200

        #20
        tready = 1;
        #100
        tready = 0;
    end
endmodule
