`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2023 10:23:46 PM
// Design Name: 
// Module Name: processor_interface
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
module processor_interface #(
    parameter CHUNK_SIZE = 64,
    localparam INPUT_CHUNK_BITS = CHUNK_SIZE * (2 * 2) * (3 * 8),
    localparam OUTPUT_CHUNK_BITS = CHUNK_SIZE * (3 * 3) * (3 * 8)
) (
    input clk,
    input reset,
    
    // Input Chunks
    input [CHUNK_SIZE * (2 * 2) * (3 * 8) - 1:0] last_input_tdata,
    input last_input_tvalid,
    output last_input_tready,
    
    input [CHUNK_SIZE * (2 * 2) * (3 * 8) - 1:0] current_input_tdata,
    input current_input_tvalid,
    output current_input_tready,

    // Output Chunks
    
    output [CHUNK_SIZE * (3 * 3) * (3 * 8) - 1:0] current_output_tdata,
    output current_output_tvalid,
    input current_output_tready,

    output [CHUNK_SIZE * (3 * 3) * (3 * 8) - 1:0] next_output_tdata,
    output next_output_tvalid,
    input next_output_tready
);
    reg [INPUT_CHUNK_BITS - 1:0] last_input;
    reg [INPUT_CHUNK_BITS - 1:0] current_input; 

    reg [OUTPUT_CHUNK_BITS - 1:0] current_output;
    reg [OUTPUT_CHUNK_BITS - 1:0] next_output;

    // We need to buffer the outputs, since they can only be updated
    // When the receiver is ready to accept them.    
    wire [OUTPUT_CHUNK_BITS - 1:0] current_output_buffer;
    wire [OUTPUT_CHUNK_BITS - 1:0] next_output_buffer;

    // These can basically be hardcoded, since this module
    // is fully combinational.
    assign last_input_tready = 1;
    assign current_input_tready = 1;
    assign current_output_tvalid = 1;
    assign next_output_tvalid = 1;

    always @(posedge clk) begin
        if (!reset) begin
            // Ingest Inputs
            if (last_input_tvalid & last_input_tready) begin
                last_input <= last_input_tdata;
            end
            
            if (current_input_tvalid & current_input_tready) begin
                current_input <= current_input_tdata;
            end
            
            // Export Outputs
            if (current_output_tvalid & current_output_tready) begin
                current_output <= current_output_buffer;
            end
            
            if (next_output_tvalid & next_output_tready) begin
                next_output <= next_output_buffer;
            end
        else
            current_output <= 0;
            next_output <= 0;
        end
    end
    
    processor p (
        .last_chunk(last_input),
        .current_chunk(current_input),
        .output_chunk_current(current_output_buffer),
        .output_chunk_next(next_output_buffer)
    );
endmodule