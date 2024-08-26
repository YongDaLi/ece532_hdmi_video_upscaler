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

module chunk_transposer #(
    parameter CELL_SIZE = 2,
    parameter CHUNK_SIZE = 64
)
(
    input pixel[CELL_SIZE-1:0][CHUNK_SIZE-1:0][CELL_SIZE-1:0] video_chunk,
    output pixel[CHUNK_SIZE-1:0][CELL_SIZE-1:0][CELL_SIZE-1:0] processing_chunk
);
    genvar i, j;
    generate
        for (i = 0; i < CHUNK_SIZE; i = i + 1) begin
            for (j = 0; j < CELL_SIZE; j = j + 1) begin
                assign processing_chunk[i][j] = video_chunk[j][i];
            end
        end
    endgenerate
endmodule
