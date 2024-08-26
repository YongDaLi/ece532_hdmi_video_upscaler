`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2023 02:59:14 PM
// Design Name: 
// Module Name: frame_interpolator_averaging
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

/*** Non sequential module ***/
module frame_interpolator_averaging (
        input chunk_input scanline_in_last, // 1 line of 1280 8-bit RGB pixels
        input chunk_input scanline_in_current, // 1 line of 1280 8-bit RGB pixels
        output chunk_input scanline_out // output scanline of interpolated frame
    );
        
    genvar _cell;
    genvar i, j;
    generate
        for (_cell = 0; _cell < CHUNK_SIZE; _cell++) begin
            for (i = 0; i < INPUT_CELL_SIZE; i++) begin
                for (j = 0; j < INPUT_CELL_SIZE; j++) begin
                    pixel_average avg(
                        scanline_in_last [_cell][i][j],
                        scanline_in_current [_cell][i][j],
                        scanline_out [_cell][i][j]
                    );
                end
            end
        end
    endgenerate
endmodule
