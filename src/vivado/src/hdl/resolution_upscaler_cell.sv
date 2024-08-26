`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2023 09:39:44 PM
// Design Name: 
// Module Name: resolution_upscaler_cell
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

module resolution_upscaler_cell(
    input cell_input original,
    output cell_output upscaled
    );
    
    pixel top_left;
    pixel top_right;
    pixel bottom_left;
    pixel bottom_right;

    assign top_left = original[0][0];
    assign top_right = original[0][1];
    assign bottom_left = original[1][0];
    assign bottom_right = original[1][1];

    // First Row
    // The averages are labeled using cardinal directions.
    assign upscaled[0][0] = top_left;
    pixel_average p_n(top_left, top_right, upscaled[0][1]);
    assign upscaled[0][2] = top_right;
    
    // Middle Row
    // The central pixel is a bit more complicated, since it needs two averages.
    // Deal with the two sides first, since they are easy.
    pixel_average p_w(top_left, bottom_left, upscaled[1][0]);
    pixel_average p_e(top_right, bottom_right, upscaled[1][2]);
    
    // For the central pixel, independently compute averages for the top and bottom.
    // Then, average those.
    pixel top_central, bottom_central;
    pixel_average p_c_n(top_left, top_right, top_central);
    pixel_average p_c_s(bottom_left, bottom_right, bottom_central);
    pixel_average p_c(top_central, bottom_central, upscaled[1][1]);
    
    // Bottom Row
    assign upscaled[2][0] = bottom_left;
    pixel_average p_s(bottom_left, bottom_right, upscaled[2][1]);
    assign upscaled[2][2] = bottom_right;
endmodule
