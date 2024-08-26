`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2023 10:08:21 PM
// Design Name: 
// Module Name: pixel_average
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


module pixel_average(
    input [2:0][7:0] a,
    input [2:0][7:0] b,
    output [2:0][7:0] average
    );
    
    wire [2:0][8:0] sum;
    
    genvar i;
    generate
        //  Iterate over each color channel.
        for (i = 0; i < 3; i++) begin
            // Sum over all pixels in this channel.
            // We cast up to one extra bit, to allow the addition to 'overflow'.
            assign sum[i] = {1'b0, a[i]} + {1'b0, b[i]};
            // Throw away the bottom bit, this is equivalent to dividing by 2.
            assign average[i] = sum[i][8:1];
        end
    endgenerate
endmodule
