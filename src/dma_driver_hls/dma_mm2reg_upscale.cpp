#include <ap_int.h>
#include <stdint.h>
#include <iostream>
#include <ap_utils.h>
#include <hls_stream.h>

typedef uint64_t chunk_t[12]; // 2 rows of 6 uint64_t each

void read_chunk(uint64_t *in_frame, hls::stream<uint64_t> &out);
void write_chunk(uint64_t *out_frame, hls::stream<uint64_t> &in);
void upscale_chunk(hls::stream<uint64_t> &in, hls::stream<uint64_t> &out);


void read_chunk(uint64_t *in_frame, hls::stream<uint64_t> &out) {
    for (int row = 0; row < 720; row+=2) {
        for (int col = 0; col < 480; col+=6) {
            chunk_t tmp;
            tmp[0] = in_frame[row * 480 + col];
            tmp[1] = in_frame[row * 480 + col + 1];
            tmp[2] = in_frame[row * 480 + col + 2];
            tmp[3] = in_frame[row * 480 + col + 3];
            tmp[4] = in_frame[row * 480 + col + 4];
            tmp[5] = in_frame[row * 480 + col + 5];
            tmp[6] = in_frame[(row + 1) * 480 + col];
            tmp[7] = in_frame[(row + 1) * 480 + col + 1];
            tmp[8] = in_frame[(row + 1) * 480 + col + 2];
            tmp[9] = in_frame[(row + 1) * 480 + col + 3];
            tmp[10] = in_frame[(row + 1) * 480 + col + 4];
            tmp[11] = in_frame[(row + 1) * 480 + col + 5];
            // memcpy(&tmp[0], &in_frame[row * 480 + col], 6 * sizeof(uint64_t));
            // // copy whole row of 6 pixels
            // memcpy(&tmp[6], &in_frame[(row + 1) * 480 + col], 6 * sizeof(uint64_t));

            for (int i = 0; i < 12; i++) {
                #pragma HLS PIPELINE
                out.write(tmp[i]);
            }
        }
    }
}

void upscale_chunk(hls::stream<uint64_t> &in, hls::stream<uint64_t> &out) {
    for (int row = 0; row < 720; row++) {
        for (int col = 0; col < 480; col++) {
            chunk_t tmp_in;
            chunk_t tmp_out;
            for (int i = 0; i < 12; i++) {
                #pragma HLS PIPELINE
                tmp_in[i] = in.read();
                tmp_out[i] = tmp_in[i];
                out.write(tmp_out[i]);
            }
        }
    }
}

void write_chunk(uint64_t *out_frame, hls::stream<uint64_t> &in) {
    for (int row = 0; row < 720; row+=2) {
        for (int col = 0; col < 480; col+=6) {
            chunk_t tmp;
            for (int i = 0; i < 12; i++) {
                #pragma HLS PIPELINE
                tmp[i] = in.read();
            }

            // copy whole row of 6 pixels
            out_frame[row * 480 + col] = tmp[0];
            out_frame[row * 480 + col + 1] = tmp[1];
            out_frame[row * 480 + col + 2] = tmp[2];
            out_frame[row * 480 + col + 3] = tmp[3];
            out_frame[row * 480 + col + 4] = tmp[4];
            out_frame[row * 480 + col + 5] = tmp[5];
            out_frame[(row + 1) * 480 + col] = tmp[6];
            out_frame[(row + 1) * 480 + col + 1] = tmp[7];
            out_frame[(row + 1) * 480 + col + 2] = tmp[8];
            out_frame[(row + 1) * 480 + col + 3] = tmp[9];
            out_frame[(row + 1) * 480 + col + 4] = tmp[10];
            out_frame[(row + 1) * 480 + col + 5] = tmp[11];
            // memcpy(&out_frame[row * 480 + col], &tmp[0], 6 * sizeof(uint64_t));
            // // copy whole row of 6 pixels
            // memcpy(&out_frame[(row + 1) * 480 + col], &tmp[6], 6 * sizeof(uint64_t));
        }
    }
}

void dma_mm2reg_upscale(uint64_t *in_frame,
                        uint64_t *out_frame
                        ) {
    #pragma HLS INTERFACE m_axi port=in_frame offset=slave max_read_burst_length=16 max_write_burst_length=16
    #pragma HLS INTERFACE m_axi port=out_frame offset=slave max_read_burst_length=16 max_write_burst_length=16
    #pragma HLS INTERFACE s_axilite port=return

    #pragma HLS DATAFLOW
    hls::stream<uint64_t> in_chunk;
    hls::stream<uint64_t> out_chunk;
    read_chunk(in_frame, in_chunk);
    upscale_chunk(in_chunk, out_chunk);
    write_chunk(out_frame, out_chunk);
}
