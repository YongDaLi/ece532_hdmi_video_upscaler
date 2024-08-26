import numpy as np
from PIL import Image

R = (0xFF, 0x00, 0x00) # red
H = (0x8B, 0x45, 0x00) # hair
S = (0x99, 0x69, 0x1A) # skin
B = (0x00, 0x00, 0x00) # black
C = (0x00, 0x00, 0xFF) # clothes
Y = (0xFF, 0xFF, 0x00) # yellow
W = (0xFF, 0xFF, 0xFF) # white

MARIO_BMP = np.array([
  [W, W, W, W, W, R, R, R, R, R, W, W, W, W, W, W],
  [W, W, W, W, R, R, R, R, R, R, R, R, R, W, W, W],
  [W, W, W, W, H, H, H, S, S, B, S, W, W, W, W, W],
  [W, W, W, H, S, H, S, S, S, B, S, S, S, W, W, W],
  [W, W, W, H, S, H, H, S, S, S, B, S, S, S, W, W],
  [W, W, W, H, H, S, S, S, S, B, B, B, B, W, W, W],
  [W, W, W, W, W, S, S, S, S, S, S, S, W, W, W, W],
  [W, W, W, W, R, R, C, R, R, R, W, W, W, W, W, W],
  [W, W, W, R, R, R, C, R, R, C, R, R, R, W, W, W],
  [W, W, R, R, R, R, C, C, C, C, R, R, R, R, W, W],
  [W, W, W, W, R, C, Y, C, C, Y, C, R, R, W, W, W],
  [W, W, W, W, W, C, C, C, C, C, C, W, W, W, W, W],
  [W, W, W, W, C, C, C, C, C, C, C, C, W, W, W, W],
  [W, W, W, W, C, C, C, W, W, C, C, C, W, W, W, W],
  [W, W, W, H, H, H, W, W, W, W, H, H, H, W, W, W],
  [W, W, H, H, H, H, W, W, W, W, H, H, H, H, W, W],
])

MARIO_JUMP_BMP = np.array([
  [W, W, W, W, W, W, W, W, W, W, W, W, W, W, W, W],
  [W, W, W, W, W, R, R, R, R, R, W, W, S, S, S, W],
  [W, W, W, W, R, R, R, R, R, R, R, R, R, S, S, W],
  [W, W, W, W, H, H, H, S, S, B, S, W, R, R, R, W],
  [W, W, W, H, S, H, S, S, S, B, S, S, S, R, R, W],
  [W, W, W, H, S, H, H, S, S, S, B, S, S, S, R, W],
  [W, W, W, H, H, S, S, S, S, B, B, B, B, R, W, W],
  [W, W, W, W, W, S, S, S, S, S, S, S, R, R, W, W],
  [W, W, R, R, R, R, C, R, R, R, C, R, R, W, W, H],
  [S, S, R, R, R, R, R, C, R, R, R, C, W, W, H, H],
  [S, S, S, R, R, R, R, C, C, C, C, Y, C, C, H, H],
  [W, S, W, W, C, R, C, C, Y, C, C, C, C, C, H, H],
  [W, W, H, H, H, C, C, C, C, C, C, C, C, C, H, H],
  [W, H, H, H, C, C, C, C, C, C, W, W, W, W, W, W],
  [W, H, H, W, W, W, W, W, W, W, W, W, W, W, W, W],
  [W, W, W, W, W, W, W, W, W, W, W, W, W, W, W, W],
])

def bmp_to_chunks(bmp, cell_size, chunk_size):
  cells = []
  for i in range(0, len(bmp), cell_size):
    for j in range(0, len(bmp), cell_size):
      cell = bmp[i:i+cell_size, j:j+cell_size]
      cells.append(cell)

  chunks = []
  for i in range(0, len(cells), chunk_size):
    chunks.append(cells[i:i+chunk_size])

  return chunks

def format_pixel(pixel):
  r, g, b = pixel
  return f"{{ 8'h{r:02x}, 8'h{g:02x}, 8'h{b:02x} }}"

def format_cell(cell):
  return f"{{ {', '.join(format_pixel(pixel) for pixel in cell.reshape(-1, 3))} }}"

def bmp_to_vivado_hex(bmp, cell_size, chunk_size):
  """
  Given the pixelwise bmp representation, convert into packed hex.
  Here, it is divided into chunks/cells, each of which is serialized in row-major form.
  """
  chunks = bmp_to_chunks(bmp, cell_size, chunk_size)
  chunk = chunks[0]

  hex = f"""{{{', '.join(format_cell(cell) for cell in chunk)} }}"""
  print(hex)

def packed_hex_to_bmp(cell_size, image_size, hex):
  digits = []
  for i in range(0, len(hex), 2):
    digits.append(int(hex[i:i+2], 16))

  pixels = []
  for i in range(0, len(digits), 3):
    pixels.append(digits[i:i+3])

  digits_np = np.array(digits)
  cells_np = digits_np.reshape(image_size//cell_size, image_size//cell_size, cell_size, cell_size, 3)
  

  image = np.zeros((image_size, image_size, 3))
  for i in range(0, image_size, cell_size):
    for j in range(0, image_size, cell_size):
      image[i:i+cell_size, j:j+cell_size] = cells_np[i//cell_size, j//cell_size]

  img = Image.fromarray(image.astype(np.uint8))
  img.show()

  


# Previous Frame
# bmp_to_vivado_hex(MARIO_BMP, 2, 64)

# Current Frame
bmp_to_vivado_hex(MARIO_JUMP_BMP, 2, 64)

# # Previous Input
# packed_hex_to_bmp(
#   2, 16,
#   "ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000ffffffffffffff0000ff0000ffffffffffffff0000ff0000ffffffffffffffffffffffffffffffffffff99691a99691affffffffffff99691affffffffffffffffffffffffffffffffffffffffffffffffffffffff0000ff00008b45008b4500ff0000ff00008b450099691aff0000ff000099691a000000ff0000ff000099691affffffff000099691aff0000ff000099691affffffff0000ffffffffffffffffffffffffffffffffffff8b4500ffffff8b450099691a8b450099691a8b450099691a99691a8b450099691a99691a00000099691a99691a99691a99691a00000099691a99691aff000099691a99691aff0000ffffffff0000ffffffffffffffffffffffffffffffffffff8b4500ffffffffffff8b450099691affffff99691a99691a99691a99691a99691a99691a00000099691a99691a00000000000099691a99691a000000ff0000ff0000ff0000ffffffffffffffffffffffffffffffffffff99691a99691aff0000ff0000ff0000ff0000ff0000ff0000ff0000ff00000000ffff0000ff00000000ffff0000ff0000ff0000ff00000000ffff0000ff00000000ffff0000ffffffffffffffffffffffff8b45008b45008b450099691a99691affffff99691a99691aff0000ffffffffffffff0000ff00000000ffff0000ff00000000ff0000ff0000ff0000ff0000ffffff000000ff0000ffffff000000ff0000ff0000ff0000ff0000ff0000ff8b45008b45008b45008b4500ffffffffffffffffff8b45008b45008b45008b45008b45008b45000000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ffffffffffffff0000ff0000ffffffffffffff8b45008b4500ffffffffffffffffff8b4500ffffffffffff8b4500ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff"  
# )

# # Current Input
# packed_hex_to_bmp(
#   2, 16,
#   "ffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ffffffffffffff0000ff0000ffffffffffffff0000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8b45008b45008b450099691a8b45008b450099691a99691a99691a99691a00000099691a00000099691affffff99691a99691affffffffffff99691affffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8b4500ffffff8b450099691a8b45008b450099691a8b450099691a99691a99691a99691a99691a99691a00000000000099691a00000000000099691a99691a000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff99691aff0000ff000099691a99691a0000ffff000099691a99691aff0000ff000099691a99691affffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000ff0000ff0000ff0000ff0000ff0000ff00000000ffff00000000ff0000ffff00000000ff0000ff0000ffff0000ff0000ff0000ff0000ff0000ffffffff0000ff0000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000ffffffff0000ffffff000000ff0000ff0000ff0000ffffff000000ff0000ff0000ffff00000000ffffffffff0000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000ff0000ff0000ff0000ff0000ff0000ff0000ffffffff0000ff0000ffffffff0000ff0000ff0000ff0000ff0000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8b45008b45008b45008b45008b45008b45008b4500ffffffffffffffffffffffffffffffffffffffffffffffff8b45008b45008b45008b45008b4500ffffff8b45008b4500ffffffffffffffffffffffff"  
# )

# Previous Output
packed_hex_to_bmp(
  3, 24,
  "ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffbfbfff7f7fffffffff7f7fff0000ffffffffffffffffffff7f7fff7f7fff7f7fff0000ff0000ff0000ffffffffffffffffffff7f7fff7f7fff7f7fff0000ff0000ff0000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffccb48cccb48cccb48c99691a99691a99691affffffffffffffffffccb48ce5d9c5ffffff99691accb48cffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000ff0000ff0000c52200c52200c522008b45008b45008b4500ff0000ff0000ff0000c52200c82b06cc340d8b450092570d99691aff0000ff0000ff0000cc340da51a067f000099691a4c340d000000ff0000ff0000ff0000cc340de55a46ff7f7f99691accb48cffffffff0000cc340d99691aff0000e51a06cc340dff0000ff0000ff000099691accb48cffffffcc340de59985ffffffff0000ff7f7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc5a27f8b4500ffffffc5a27f8b4500ffffffc5a27f8b450099691a92570d8b450099691a92570d8b450099691a92570d8b450099691a99691a99691a92570d95601399691a8b450092570d99691a99691a4c340d00000099691a724e134c340d99691a99691a99691a99691a99691a99691a4c340d724e1399691a0000004c340d99691a99691acc340dff000099691ab24e13cc340d99691a99691a99691aff0000ff7f7fffffffff0000ff7f7fffffffff0000ff7f7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc5a27f8b4500ffffffe2d0bfc5a27fffffffffffffffffff8b450092570d99691ac5a27faf854c99691affffffccb48c99691a99691a99691a99691a99691a99691a99691a99691a99691a99691a99691a4c340d00000099691a724e134c340d99691a99691a99691a0000000000000000004c340d4c340d4c340d99691a99691a99691a0000007f0000ff00007f0000bf0000ff0000ff0000ff0000ff0000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffccb48cccb48cccb48c99691a99691a99691aff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff00000000ff7f007fff00007f007f7f007f7f007fff00007f007f0000ffff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff00000000ff7f007fff00007f007f7f007f7f007fff00007f007f0000ffff0000ff7f7fffffffff7f7fffbfbfffffffffffffffffffffffffffffffc5a27f8b4500c5a27fa8733f8b45008b45008b45008b450099691a99691a99691accb48cb28e5399691affffffccb48c99691a99691acc340dff0000ccb48ce59986ff7f7fffffffffffffffffffff0000ff0000ff00007f007fbf003fff00000000ff7f007fff0000ff00007f007f0000ff7f007f3f00bf0000ff0000ff0000ff0000ff0000ff0000ff0000ff7f7f7f3f3fbf0000ffffff007f7f7f0000ff0000ff7f7f7fffff000000ff3f3fbf7f7f7f0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff8b45008b45008b45008b45008b45008b45008b45008b45008b4500ffffffffffffffffffffffffe2d0bfc5a27fffffffc5a27f8b45008b45008b45008b45008b45008b45008b45008b45008b45008b45008b450045227f0000ff45227f2211bf0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff7f7fff7f7fff7f7fffffffffffffffffffff0000ff0000ff0000ff7f7fff7f7fff7f7fffffffffffffffffffff8b45008b45008b4500c5a27fc5a27fc5a27fffffffffffffffffffffffffc5a27f8b4500ffffffe2d0bfc5a27fffffffffffffffffff8b4500c5a27fffffffc5a27fe2d0bfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff"  
)

# Current Output
packed_hex_to_bmp(
  3, 24,
  "ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffbfbfff7f7fffbfbfff7f7fff3f3fff7f7fff3f3fff0000ff7f7fff7f7fff7f7fff3f3fff3f3fff3f3fff0000ff0000ff0000ff7f7fff7f7fff7f7fff3f3fff3f3fff3f3fff0000ff0000ff0000ffffffffffffffffffffbfbfffbfbfffbfbfff7f7fff7f7fff7f7fffffffffffffffffffe59986e5b9a5e5d9c5cc340dcc744cccb48cffffffffffffffffffe5d9c5f2ece2ffffffccb48ce5d9c5fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0e7dfe2d0bfffffffe2d0bfc5a27fc52200c52200c52200ab3c06a93803a8330092570d8e4e068b4500c52200c82b06cc340dab3c06ae450cb24e1392570d95601399691acc340da51a067f0000b24e137827093f000099691a4c340d000000cc340de55946ff7f7fb24e13cb734ce5998599691ab28e53ccb48cff7f7fe59985ccb48ce55946e57965e59985cc340de55946ff7f7fccb48ce5d9c5ffffffe59985f2ccc2ffffffff7f7fffbfbfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc5a27f8b4500ffffffc5a27f8b4500ffffffc5a27f8b450099691a92570d8b450095601392570d8e4e0692570d92570d92570d92570d95601399691a92570d95601399691a92570d95601399691a99691a724e134c340d99691a724e134c340d99691a724e134c340d4c340d724e1399691a261a064c340c724e13000000261a064c340d99691ab24e13cc340d724e139f612fcc744c4c340d8c744cccb48cff7f7fffbfbfffffffff7f7fffbfbfffffffff7f7fffbfbfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe2d0bfc5a27ffffffff0e7dfe2d0bfffffffffffffffffffc5a27faf854c99691ae2907fca6f49b24e13ff7f7fe55946cc340d99691a99691a99691a724e53924e33b24e134c348c8c344ccc340d99691a724e134c340db24e139f41108c340dcc340dcc340dcc340d4c340d4c340d4c340d8c744c8c744c8c744cccb48cccb48cccb48c7f7f7fbf7f7fff7f7fbf7f7fdf7f7fff7f7fff7f7fff7f7fff7f7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe5d9c5e5d9c5e5d9c5ccb48cccb48cccb48cff7f7fff3f3fff0000ff3f3fff1f1fff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff00000000ff7f007fff00003f00bf5f009f7f007f7f007f3f00bf0000ffff0000bf003f7f007fbf003f9f005f7f007f7f007f7f007f7f007f7f007fbf003fff0000bf003fbf003fbf003fff0000bf003f7f007fff0000ff7f7fffffffff3f3fff7f7fffbfbfff7f7fff7f7fff7f7fffffffe2d0bfc5a27fe2d0bfd3b99fc5a27fc5a27fc5a27fc5a27fccb48cccb48cccb48ce5d9c5d8c6a8ccb48cffffffe5d9c5ccb48cccb48ce59985ff7f7fe5d9c5f2ccc2ffbfbfffffffffffffffffffff0000bf003f7f007fbf3f7f9f1f7f7f007f7f7fff7f3fbf7f007fff7f007f3f7f0000ff7f3f7f3f1fbf0000ff0000ff0000ff0000ff0000ff3f3fbf7f7f7f3f3fbf3f3fbf3f3fbf7f7f7f3f3fbf0000ff0000ff7f3f7fff7f000000ff5f3fbfbf7f7f0000ff3f3fff7f7fff7f007f7f3fbf7f7fff7f3fbf7f5fdf7f7fff7f7fff7f7fff7f7fffc5a27fc5a27fc5a27fc5a27fc5a27fc5a27fc5a27fc5a27fc5a27ffffffffffffffffffffffffff0e7dfe2d0bfffffffe2d0bfc5a27fc5a27fc5a27fc5a27fc5a27fc5a27fc5a27fc5a27fc5a27fc5a27f45227f2211bf0000ff2211bf1108df0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff1f1fff3f3fff0000ff3f3fff7f7fff0000ff0000ff0000ff3f3fff1f1fff0000ff7f7fff3f3fff0000ff0000ff0000ff0000ff3f3fff3f3fff3f3fff7f7fff7f7fff7f7fff7f7fff7f7fff7f7fffbfbfffbfbfffbfbfffffffffffffffffffffc5a27fc5a27fc5a27fe2d0bfe2d0bfe2d0bfffffffffffffffffffffffffe2d0bfc5a27ffffffff0e7dfe2d0bfffffffffffffffffffc5a27fc5a27fc5a27fc5a27fc5a27fc5a27fc5a27fc5a27fc5a27fc5a27fc5a27fc5a27fc5a27fc5a27fc5a27fc5a27fc5a27fc5a27fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc5a27fc5a27fc5a27fc5a27fc5a27fc5a27fc5a27fc5a27fc5a27fc5a27fe2d0bfffffffc5a27fd3b99fe2d0bfc5a27fc5a27fc5a27fffffffffffffffffffffffffffffffffffffffffffffffffffffff"  
)