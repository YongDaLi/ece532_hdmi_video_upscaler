`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2023 02:32:11 AM
// Design Name: 
// Module Name: tb_chunk_transposer
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

module tb_chunk_transposer();
    localparam CELL_SIZE = 2;
    localparam CHUNK_SIZE = 3;

    pixel[CELL_SIZE-1:0][CHUNK_SIZE-1:0][CELL_SIZE-1:0] video_chunk = {
        // Image Row 0
        {{8'hA0, 8'hB0, 8'hC0}, {8'hA1, 8'hB1, 8'hC1}}, {{8'hA2, 8'hB2, 8'hC2}, {8'hA3, 8'hB3, 8'hC3}}, {{8'hD2, 8'hE2, 8'hF2}, {8'hD3, 8'hE3, 8'hF3}},

        // Image Row 1
        {{8'hA4, 8'hB4, 8'hC4}, {8'hA5, 8'hB5, 8'hC5}}, {{8'hA6, 8'hB6, 8'hC6}, {8'hA7, 8'hB7, 8'hC7}}, {{8'hD2, 8'hE2, 8'hF2}, {8'hD3, 8'hE3, 8'hF3}}
    };
    
    pixel[CHUNK_SIZE-1:0][CELL_SIZE-1:0][CELL_SIZE-1:0] processing_chunk;

    pixel[CELL_SIZE-1:0][CHUNK_SIZE-1:0][CELL_SIZE-1:0] recreated_video_chunk;

    chunk_transposer_wrapper #(
        .CELL_SIZE(CELL_SIZE),
        .CHUNK_SIZE(CHUNK_SIZE)
    ) ct1 (
        .video_chunk(video_chunk),
        .processing_chunk(processing_chunk)
    );

    inverse_chunk_transposer_wrapper #(
        .CELL_SIZE(CELL_SIZE),
        .CHUNK_SIZE(CHUNK_SIZE)
    ) ct2 (
        .processing_chunk(processing_chunk),
        .video_chunk(recreated_video_chunk)
    );
endmodule
