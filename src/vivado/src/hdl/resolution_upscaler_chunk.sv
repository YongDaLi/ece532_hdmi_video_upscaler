`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2023 11:28:45 PM
// Design Name: 
// Module Name: resolution_upscaler_chunk
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
`include "types.sv"

module resolution_upscaler_chunk(
    input chunk_input original,
    output chunk_output upscaled
    );
    
    genvar i;
    generate
        for (i = 0; i < CHUNK_SIZE; i++) begin
            resolution_upscaler_cell c(original[i], upscaled[i]);
        end
    endgenerate
endmodule
