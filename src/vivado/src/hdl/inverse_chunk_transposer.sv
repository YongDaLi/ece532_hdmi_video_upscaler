`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2023 02:18:55 AM
// Design Name: 
// Module Name: chunk_transposer
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

module inverse_chunk_transposer #(
    parameter CELL_SIZE = 2,
    parameter CHUNK_SIZE = 64
)
(
    input pixel[CHUNK_SIZE-1:0][CELL_SIZE-1:0][CELL_SIZE-1:0] processing_chunk,
    output pixel[CELL_SIZE-1:0][CHUNK_SIZE-1:0][CELL_SIZE-1:0] video_chunk
);
    genvar i, j;
    generate
        for (i = 0; i < CELL_SIZE; i = i + 1) begin
            for (j = 0; j < CHUNK_SIZE; j = j + 1) begin
                assign video_chunk[i][j] = processing_chunk[j][i];
            end
        end
    endgenerate
endmodule
