#include "ap_int.h"
#include "ap_utils.h"

#define PIXEL_SIZE_BYTE				3
#define PIXEL_OFFSET                10
#define INPUT_BUF0_ADDR             (0x81000000)
#define INPUT_BUF1_ADDR             (0x82000000)
#define OUTPUT_BUF0_ADDR            (0x83000000)
#define OUTPUT_BUF1_ADDR            (0x84000000)

#define INPUT_FRAME_WIDTH			1280
#define INPUT_FRAME_HEIGHT			720
#define INPUT_FRAME_SIZE			(INPUT_FRAME_WIDTH * INPUT_FRAME_HEIGHT)
#define INPUT_FRAME_WIDTH_BYTES		(INPUT_FRAME_WIDTH * PIXEL_SIZE_BYTE)
#define INPUT_FRAME_WIDTH_2BYTES	(INPUT_FRAME_WIDTH_BYTES / 2)
#define INPUT_FRAME_SIZE_BYTES		(INPUT_FRAME_SIZE * PIXEL_SIZE_BYTE)

#define OUTPUT_FRAME_WIDTH			1280
#define OUTPUT_FRAME_HEIGHT			720
#define OUTPUT_FRAME_SIZE			(OUTPUT_FRAME_WIDTH * OUTPUT_FRAME_HEIGHT)
#define OUTPUT_FRAME_WIDTH_BYTES	(OUTPUT_FRAME_WIDTH * PIXEL_SIZE_BYTE)
#define OUTPUT_FRAME_WIDTH_2BYTES	(OUTPUT_FRAME_WIDTH_BYTES / 2)
#define OUTPUT_FRAME_SIZE_BYTES		(OUTPUT_FRAME_SIZE * PIXEL_SIZE_BYTE)

#define INPUT_TILE_WIDTH_PX        2
#define INPUT_TILE_HEIGHT_PX       2
#define INPUT_TILE_SIZE_PX         (INPUT_TILE_WIDTH_PX * INPUT_TILE_HEIGHT_PX)
#define INPUT_TILE_SIZE_BYTES      (INPUT_TILE_SIZE_PX * PIXEL_SIZE_BYTE)

#define NUM_TILES_PER_ROW          (INPUT_FRAME_WIDTH / INPUT_TILE_WIDTH_PX)
#define NUM_TILES_PER_COL          (INPUT_FRAME_HEIGHT / INPUT_TILE_HEIGHT_PX)
#define NUM_TILES_PER_FRAME        (NUM_TILES_PER_COL * NUM_TILES_PER_ROW)

#define OUTPUT_TILE_WIDTH_PX       (OUTPUT_FRAME_WIDTH / NUM_TILES_PER_ROW)
#define OUTPUT_TILE_HEIGHT_PX      (OUTPUT_FRAME_HEIGHT / NUM_TILES_PER_COL)
#define OUTPUT_TILE_SIZE_PX        (OUTPUT_TILE_WIDTH_PX * OUTPUT_TILE_HEIGHT_PX)
#define OUTPUT_TILE_SIZE_BYTES     (OUTPUT_TILE_SIZE_PX * PIXEL_SIZE_BYTE)

#define OUTPUT_FB_0                 (OUTPUT_BUF0_ADDR / 2)
#define OUTPUT_FB_1                 (OUTPUT_BUF1_ADDR / 2)

#define INPUT_FB_0                  (INPUT_BUF0_ADDR / 2)
#define INPUT_FB_1                  (INPUT_BUF0_ADDR / 2)


void dma_mm2reg(ap_uint<1> px_clk,
                ap_uint<1> frame_trigger,
                ap_uint<16> *in_frame_base,
                ap_uint<64> *out_frame_base,
                ap_uint<16> in_frame0_tile0[6],  // output to processing system
                ap_uint<16> in_frame0_tile1[6],  // output to processing system
                ap_uint<16> in_frame1_tile0[6],  // output to processing system
                ap_uint<16> in_frame1_tile1[6],  // output to processing system
                ap_uint<16> out_frame0_tile0[6], // input from processing system
                ap_uint<16> out_frame0_tile1[6], // input from processing system
                ap_uint<16> out_frame1_tile0[6], // input from processing system
                ap_uint<16> out_frame1_tile1[6]  // input from processing system
                ) {

    #pragma HLS INTERFACE ap_none port=px_clk
    #pragma HLS INTERFACE ap_none port=frame_trigger
    #pragma HLS ARRAY_PARTITION variable=in_frame0_tile0 complete
    #pragma HLS ARRAY_PARTITION variable=in_frame0_tile1 complete
    #pragma HLS ARRAY_PARTITION variable=in_frame1_tile0 complete
    #pragma HLS ARRAY_PARTITION variable=in_frame1_tile1 complete
    #pragma HLS ARRAY_PARTITION variable=out_frame0_tile0 complete
    #pragma HLS ARRAY_PARTITION variable=out_frame0_tile1 complete
    #pragma HLS ARRAY_PARTITION variable=out_frame1_tile0 complete
    #pragma HLS ARRAY_PARTITION variable=out_frame1_tile1 complete

    #pragma HLS INTERFACE ap_ctrl_none port=return

    #pragma HLS INTERFACE m_axi port=in_frame_base offset=off
    #pragma HLS INTERFACE m_axi port=out_frame_base offset=off
    
    #pragma HLS INTERFACE ap_none port=in_frame0_tile0
    #pragma HLS INTERFACE ap_none port=in_frame0_tile1
    #pragma HLS INTERFACE ap_none port=in_frame1_tile0
    #pragma HLS INTERFACE ap_none port=in_frame1_tile1
    #pragma HLS INTERFACE ap_none port=out_frame0_tile0
    #pragma HLS INTERFACE ap_none port=out_frame0_tile1
    #pragma HLS INTERFACE ap_none port=out_frame1_tile0
    #pragma HLS INTERFACE ap_none port=out_frame1_tile1

    int px_clk_cnt = 0;
    int in_row = 0;
    int out_row = 0;
    int in_col = 1;
    int out_col = 0;

    // wait for new frame
    // ap_wait_until(frame_trigger);

    // wait for initial pixel offset
    // for (int i = 0; i < PIXEL_OFFSET; i++) {
    //     #pragma HLS UNROLL
    //     ap_wait_until(px_clk);
    // }

    while (true) {
        #pragma HLS PIPELINE
        
        /**** process input tile 0 (2x2), write back output tile 1 (2x2) ****/

        // wait for 1 pixels to be read in
        // ap_wait_until(px_clk);
        // px_clk_cnt++;

        // send tile 0 from input frame 0 to processing system
        in_frame0_tile0[0] = in_frame_base[INPUT_FB_0 + in_row * INPUT_FRAME_WIDTH_2BYTES + in_col * 3];
        in_frame0_tile0[1] = in_frame_base[INPUT_FB_0 + in_row * INPUT_FRAME_WIDTH_2BYTES + in_col * 3 + 1];
        in_frame0_tile0[2] = in_frame_base[INPUT_FB_0 + in_row * INPUT_FRAME_WIDTH_2BYTES + in_col * 3 + 2];
        in_frame0_tile0[3] = in_frame_base[INPUT_FB_0 + (in_row + 1) * INPUT_FRAME_WIDTH_2BYTES + in_col * 3];
        in_frame0_tile0[4] = in_frame_base[INPUT_FB_0 + (in_row + 1) * INPUT_FRAME_WIDTH_2BYTES + in_col * 3 + 1];
        in_frame0_tile0[5] = in_frame_base[INPUT_FB_0 + (in_row + 1) * INPUT_FRAME_WIDTH_2BYTES + in_col * 3 + 2];

        // send tile 0 from input frame 1 to processing system
        in_frame1_tile0[0] = in_frame_base[INPUT_FB_1 + in_row * INPUT_FRAME_WIDTH_2BYTES + in_col * 3];
        in_frame1_tile0[1] = in_frame_base[INPUT_FB_1 + in_row * INPUT_FRAME_WIDTH_2BYTES + in_col * 3 + 1];
        in_frame1_tile0[2] = in_frame_base[INPUT_FB_1 + in_row * INPUT_FRAME_WIDTH_2BYTES + in_col * 3 + 2];
        in_frame1_tile0[3] = in_frame_base[INPUT_FB_1 + (in_row + 1) * INPUT_FRAME_WIDTH_2BYTES + in_col * 3];
        in_frame1_tile0[4] = in_frame_base[INPUT_FB_1 + (in_row + 1) * INPUT_FRAME_WIDTH_2BYTES + in_col * 3 + 1];
        in_frame1_tile0[5] = in_frame_base[INPUT_FB_1 + (in_row + 1) * INPUT_FRAME_WIDTH_2BYTES + in_col * 3 + 2];

        // wait for 1 pixels to be read in
        // ap_wait_until(px_clk);
        // px_clk_cnt++;

        // copy tile 0 from input frame 0 to old input frame 1
        in_frame_base[INPUT_FB_1 + in_row * INPUT_FRAME_WIDTH_2BYTES + in_col * 3] = in_frame_base[INPUT_FB_0 + in_row * INPUT_FRAME_WIDTH_2BYTES + in_col * 3];
        in_frame_base[INPUT_FB_1 + in_row * INPUT_FRAME_WIDTH_2BYTES + in_col * 3 + 1] = in_frame_base[INPUT_FB_0 + in_row * INPUT_FRAME_WIDTH_2BYTES + in_col * 3 + 1];
        in_frame_base[INPUT_FB_1 + in_row * INPUT_FRAME_WIDTH_2BYTES + in_col * 3 + 2] = in_frame_base[INPUT_FB_0 + in_row * INPUT_FRAME_WIDTH_2BYTES + in_col * 3 + 2];
        in_frame_base[INPUT_FB_1 + (in_row + 1) * INPUT_FRAME_WIDTH_2BYTES + in_col * 3] = in_frame_base[INPUT_FB_0 + (in_row + 1) * INPUT_FRAME_WIDTH_2BYTES + in_col * 3];
        in_frame_base[INPUT_FB_1 + (in_row + 1) * INPUT_FRAME_WIDTH_2BYTES + in_col * 3 + 1] = in_frame_base[INPUT_FB_0 + (in_row + 1) * INPUT_FRAME_WIDTH_2BYTES + in_col * 3 + 1];
        in_frame_base[INPUT_FB_1 + (in_row + 1) * INPUT_FRAME_WIDTH_2BYTES + in_col * 3 + 2] = in_frame_base[INPUT_FB_0 + (in_row + 1) * INPUT_FRAME_WIDTH_2BYTES + in_col * 3 + 2];

        // wait for 1 pixels to be read in
        // ap_wait_until(px_clk);
        // px_clk_cnt++;

        // send tile 1 from processing system to output frame 0
        out_frame_base[OUTPUT_FB_0 + out_row * INPUT_FRAME_WIDTH_2BYTES + out_col * 3] = out_frame0_tile1[0];
        out_frame_base[OUTPUT_FB_0 + out_row * INPUT_FRAME_WIDTH_2BYTES + out_col * 3 + 1] = out_frame0_tile1[1];
        out_frame_base[OUTPUT_FB_0 + out_row * INPUT_FRAME_WIDTH_2BYTES + out_col * 3 + 2] = out_frame0_tile1[2];
        out_frame_base[OUTPUT_FB_0 + (out_row + 1) * INPUT_FRAME_WIDTH_2BYTES + out_col * 3] = out_frame0_tile1[3];
        out_frame_base[OUTPUT_FB_0 + (out_row + 1) * INPUT_FRAME_WIDTH_2BYTES + out_col * 3 + 1] = out_frame0_tile1[4];
        out_frame_base[OUTPUT_FB_0 + (out_row + 1) * INPUT_FRAME_WIDTH_2BYTES + out_col * 3 + 2] = out_frame0_tile1[5];

        // wait for 1 pixels to be read in
        // ap_wait_until(px_clk);
        // px_clk_cnt++;

        // send tile 1 from processing system to output frame 1
        out_frame_base[OUTPUT_FB_1 + out_row * INPUT_FRAME_WIDTH_2BYTES + out_col * 3] = out_frame1_tile1[0];
        out_frame_base[OUTPUT_FB_1 + out_row * INPUT_FRAME_WIDTH_2BYTES + out_col * 3 + 1] = out_frame1_tile1[1];
        out_frame_base[OUTPUT_FB_1 + out_row * INPUT_FRAME_WIDTH_2BYTES + out_col * 3 + 2] = out_frame1_tile1[2];
        out_frame_base[OUTPUT_FB_1 + (out_row + 1) * INPUT_FRAME_WIDTH_2BYTES + out_col * 3] = out_frame1_tile1[3];
        out_frame_base[OUTPUT_FB_1 + (out_row + 1) * INPUT_FRAME_WIDTH_2BYTES + out_col * 3 + 1] = out_frame1_tile1[4];
        out_frame_base[OUTPUT_FB_1 + (out_row + 1) * INPUT_FRAME_WIDTH_2BYTES + out_col * 3 + 2] = out_frame1_tile1[5];

        /**** Ping Pong ****/
        // advance out_row and out_col
        out_row = in_row;
        out_col = in_col;

        // advance in_row and in_col
        if (in_col == (NUM_TILES_PER_ROW - 1)) {
            in_col = 0;
            in_row += 2;
        } else {
            in_col += 1;
        }

        /**** process input tile 1 (2x2), write back output tile 0 (2x2) ****/

        // wait for 1 pixels to be read in
        // ap_wait_until(px_clk);
        // px_clk_cnt++;

        // send tile 1 from input frame 0 to processing system
        in_frame0_tile1[0] = in_frame_base[INPUT_FB_0 + in_row * INPUT_FRAME_WIDTH_2BYTES + in_col * 3];
        in_frame0_tile1[1] = in_frame_base[INPUT_FB_0 + in_row * INPUT_FRAME_WIDTH_2BYTES + in_col * 3 + 1];
        in_frame0_tile1[2] = in_frame_base[INPUT_FB_0 + in_row * INPUT_FRAME_WIDTH_2BYTES + in_col * 3 + 2];
        in_frame0_tile1[3] = in_frame_base[INPUT_FB_0 + (in_row + 1) * INPUT_FRAME_WIDTH_2BYTES + in_col * 3];
        in_frame0_tile1[4] = in_frame_base[INPUT_FB_0 + (in_row + 1) * INPUT_FRAME_WIDTH_2BYTES + in_col * 3 + 1];
        in_frame0_tile1[5] = in_frame_base[INPUT_FB_0 + (in_row + 1) * INPUT_FRAME_WIDTH_2BYTES + in_col * 3 + 2];

        // send tile 1 from input frame 1 to processing system
        in_frame1_tile1[0] = in_frame_base[INPUT_FB_1 + in_row * INPUT_FRAME_WIDTH_2BYTES + in_col * 3];
        in_frame1_tile1[1] = in_frame_base[INPUT_FB_1 + in_row * INPUT_FRAME_WIDTH_2BYTES + in_col * 3 + 1];
        in_frame1_tile1[2] = in_frame_base[INPUT_FB_1 + in_row * INPUT_FRAME_WIDTH_2BYTES + in_col * 3 + 2];
        in_frame1_tile1[3] = in_frame_base[INPUT_FB_1 + (in_row + 1) * INPUT_FRAME_WIDTH_2BYTES + in_col * 3];
        in_frame1_tile1[4] = in_frame_base[INPUT_FB_1 + (in_row + 1) * INPUT_FRAME_WIDTH_2BYTES + in_col * 3 + 1];
        in_frame1_tile1[5] = in_frame_base[INPUT_FB_1 + (in_row + 1) * INPUT_FRAME_WIDTH_2BYTES + in_col * 3 + 2];

        // wait for 1 pixels to be read in
        // ap_wait_until(px_clk);
        // px_clk_cnt++;

        // copy tile 1 from input frame 0 to old input frame 1
        in_frame_base[INPUT_FB_1 + in_row * INPUT_FRAME_WIDTH_2BYTES + in_col * 3] = in_frame_base[INPUT_FB_0 + in_row * INPUT_FRAME_WIDTH_2BYTES + in_col * 3];
        in_frame_base[INPUT_FB_1 + in_row * INPUT_FRAME_WIDTH_2BYTES + in_col * 3 + 1] = in_frame_base[INPUT_FB_0 + in_row * INPUT_FRAME_WIDTH_2BYTES + in_col * 3 + 1];
        in_frame_base[INPUT_FB_1 + in_row * INPUT_FRAME_WIDTH_2BYTES + in_col * 3 + 2] = in_frame_base[INPUT_FB_0 + in_row * INPUT_FRAME_WIDTH_2BYTES + in_col * 3 + 2];
        in_frame_base[INPUT_FB_1 + (in_row + 1) * INPUT_FRAME_WIDTH_2BYTES + in_col * 3] = in_frame_base[INPUT_FB_0 + (in_row + 1) * INPUT_FRAME_WIDTH_2BYTES + in_col * 3];
        in_frame_base[INPUT_FB_1 + (in_row + 1) * INPUT_FRAME_WIDTH_2BYTES + in_col * 3 + 1] = in_frame_base[INPUT_FB_0 + (in_row + 1) * INPUT_FRAME_WIDTH_2BYTES + in_col * 3 + 1];
        in_frame_base[INPUT_FB_1 + (in_row + 1) * INPUT_FRAME_WIDTH_2BYTES + in_col * 3 + 2] = in_frame_base[INPUT_FB_0 + (in_row + 1) * INPUT_FRAME_WIDTH_2BYTES + in_col * 3 + 2];

        // wait for 1 pixels to be read in
        // ap_wait_until(px_clk);
        // px_clk_cnt++;

        // send tile 0 from processing system to output frame 0
        out_frame_base[OUTPUT_FB_0 + out_row * OUTPUT_FRAME_WIDTH_2BYTES + out_col * 3] = out_frame0_tile0[0];
        out_frame_base[OUTPUT_FB_0 + out_row * OUTPUT_FRAME_WIDTH_2BYTES + out_col * 3 + 1] = out_frame0_tile0[1];
        out_frame_base[OUTPUT_FB_0 + out_row * OUTPUT_FRAME_WIDTH_2BYTES + out_col * 3 + 2] = out_frame0_tile0[2];
        out_frame_base[OUTPUT_FB_0 + (out_row + 1) * OUTPUT_FRAME_WIDTH_2BYTES + out_col * 3] = out_frame0_tile0[3];
        out_frame_base[OUTPUT_FB_0 + (out_row + 1) * OUTPUT_FRAME_WIDTH_2BYTES + out_col * 3 + 1] = out_frame0_tile0[4];
        out_frame_base[OUTPUT_FB_0 + (out_row + 1) * OUTPUT_FRAME_WIDTH_2BYTES + out_col * 3 + 2] = out_frame0_tile0[5];

        // wait for 1 pixels to be read in
        // ap_wait_until(px_clk);
        // px_clk_cnt++;

        // send tile 0 from processing system to output frame 1
        out_frame_base[OUTPUT_FB_1 + out_row * OUTPUT_FRAME_WIDTH_2BYTES + out_col * 3] = out_frame1_tile0[0];
        out_frame_base[OUTPUT_FB_1 + out_row * OUTPUT_FRAME_WIDTH_2BYTES + out_col * 3 + 1] = out_frame1_tile0[1];
        out_frame_base[OUTPUT_FB_1 + out_row * OUTPUT_FRAME_WIDTH_2BYTES + out_col * 3 + 2] = out_frame1_tile0[2];
        out_frame_base[OUTPUT_FB_1 + (out_row + 1) * OUTPUT_FRAME_WIDTH_2BYTES + out_col * 3] = out_frame1_tile0[3];
        out_frame_base[OUTPUT_FB_1 + (out_row + 1) * OUTPUT_FRAME_WIDTH_2BYTES + out_col * 3 + 1] = out_frame1_tile0[4];
        out_frame_base[OUTPUT_FB_1 + (out_row + 1) * OUTPUT_FRAME_WIDTH_2BYTES + out_col * 3 + 2] = out_frame1_tile0[5];

        /**** Ping Pong ****/
        // advance out_row and out_col
        out_row = in_row;
        out_col = in_col;

        /**
         * dancing in the moonlight
         * everybody's feeling warm and right
         * it's such a fine and natural sight
         * everybody's feeling warm and right
         * 
         * hey jude
         * don't make it bad
         * take a sad song and make it better
         * remember to let her into your heart
         * then you can start to make it better
         * 
         * hey jude
         * don't be afraid
         * you were made to go out and get her
         * the minute you let her under your skin
         * then you begin to make it better
         * 
         * and anytime you feel the pain
         * hey jude, refrain
         * don't carry the world upon your shoulders
         * for well you know that it's a fool
         * who plays it cool
         * by making his world a little colder
         * 
         * hey jude
         * don't let me down
         * you have found her, now go and get her
         * remember to let her into your heart
         * then you can start to make it better
         * 
         * so let it out and let it in
         * hey jude, begin
         * you're waiting for someone to perform with
         * and don't you know that it's just you
         * hey jude, you'll do
         * the movement you need is on your shoulder
         * 
         * hey jude
         * don't make it bad
         * take a sad song and make it better
        */

        // advance in_row and in_col
        if (in_col == (NUM_TILES_PER_ROW - 1)) {
            in_col = 0;
            in_row += 2;
        } else {
            in_col += 1;
        }
    }
}