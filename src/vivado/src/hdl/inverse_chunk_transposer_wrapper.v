`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2023 03:00:12 AM
// Design Name: 
// Module Name: chunk_transposer_wrapper
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


module inverse_chunk_transposer_wrapper #(
    parameter CELL_SIZE = 2,
    parameter CHUNK_SIZE = 64
)
(
    input [(8 * 3) * (CELL_SIZE * CELL_SIZE) * CHUNK_SIZE-1:0] processing_chunk,
    output [(8 * 3) * (CELL_SIZE * CELL_SIZE) * CHUNK_SIZE-1:0] video_chunk
);

    inverse_chunk_transposer #(
        .CELL_SIZE(CELL_SIZE),
        .CHUNK_SIZE(CHUNK_SIZE)
    ) ict (
        .processing_chunk(processing_chunk),
        .video_chunk(video_chunk)
    );
endmodule