`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2023 04:22:29 AM
// Design Name: 
// Module Name: axi4stream_buffer
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

module axi4stream_input_buffer #(
    parameter AXI_WIDTH = 1024,
    parameter BUFFER_WIDTH = 1024,
    parameter LAST_PACKET_WIDTH = AXI_WIDTH
)(
    // AXI Stream Slave Interface
    input aclk,
    input areset,
    
    input[AXI_WIDTH-1:0] tdata,
    input tvalid,
    input tlast, // Technically redundant, since this requires knowing the number of chunks. But, needed for DMA compat.
    output tready,
    
    // Output
    output [BUFFER_WIDTH-1:0] myBuffer,
    output valid
);
    // For now, assume we are always ready to consume data.
    assign tready = 1;
    
    // Outputs
    reg [BUFFER_WIDTH-1:0] output_buffer = 0; // The complete fetched data.
    reg output_valid = 0; // Whether the output is ready to consume.
    
    assign myBuffer = output_buffer;
    assign valid = output_valid;
    
    // When a stream starts, we interpret each data as a single chunk of the myBuffer.
    // We continue reading out until the tlast bit goes high.
    wire active_transaction = tvalid & tready;
    reg [7:0] current_chunk = 0;
    
    // Control this myBuffer's higher order state.
    // When an incoming stream starts, start the buffering transaction.
    // Update the counter, until complete, then set the output to read.
    reg [31:0] shift = 0;
    always @(posedge aclk) begin
        if (active_transaction) begin
            if (shift == 0) begin
                output_buffer = 0;
                output_valid = 0;
            end
            
            output_buffer = output_buffer | (tdata << shift);
            
            if (tlast) begin
                shift = shift + LAST_PACKET_WIDTH;
            end else begin
                shift = shift + AXI_WIDTH;
            end;
                
            
            if (shift >= BUFFER_WIDTH) begin
                shift = 0;
                output_valid = 1;
            end
        end
    end
endmodule
