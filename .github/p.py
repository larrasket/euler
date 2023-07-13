from PIL import Image, ImageDraw, ImageFont
import os

num_rows = 4
num_cols = 25
cell_width = 48
cell_height = 48
table_margin = 50
table_spacing = 50

font = ImageFont.truetype("f.ttf", 22)

image_width = (num_cols * cell_width) + (table_margin * 2)
image_height = (num_rows * cell_height) * 4 + (table_margin * 2) + (table_spacing * 3)

image = Image.new("RGB", (image_width, image_height), (253, 253, 253))
draw = ImageDraw.Draw(image)

file_list = sorted([f for f in os.listdir("../src") if not f.endswith('.png')])

prev_num = None
missing_files = []

for filename in file_list:
    num = int(filename.split(".")[0])
    if prev_num is not None and num != prev_num + 1:
        missing_files.extend(list(range(prev_num + 1, num)))
    prev_num = num

num = 0
for i in range(4):
    x_offset = table_margin
    y_offset = (num_rows * cell_height + table_spacing) * i + table_margin

    for row in range(num_rows):
        for col in range(num_cols):
            x = x_offset + col * cell_width
            y = y_offset + row * cell_height

            draw.rectangle((x, y, x+cell_width, y+cell_height), outline=(0, 0, 0))

            num = num + 1

            if num in missing_files:
                draw.rectangle((x+1, y+1, x+cell_width-1, y+cell_height-1), fill=(221, 221, 51))
                draw.text((x+2, y+2), str(num), font=font, fill=(0, 0, 0))
            elif str(num).zfill(4) + ".l" in file_list or str(num).zfill(4) + ".jl" in file_list:
                draw.rectangle((x+1, y+1, x+cell_width-1, y+cell_height-1), fill=(0, 153, 0))
                draw.text((x+2, y+2), str(num), font=font, fill=(255, 255, 255))
            else:
                draw.text((x+2, y+2), str(num), font=font, fill=(0, 0, 0))

    draw.line((table_margin, y_offset + num_rows * cell_height - 1,
               image_width - table_margin, y_offset + num_rows * cell_height - 1), fill=(0, 0, 0), width=2)

    if i < 3:
        draw.rectangle((table_margin, y_offset + num_rows * cell_height,
                        image_width - table_margin, y_offset + num_rows * cell_height + table_spacing),
                       fill=(255, 255, 255))

# mark files in ../skt with red
# mark files in ../skt with red
for filename in os.listdir("../skt"):
    if filename.endswith(".l"):
        num = int(filename.split(".")[0])
        if num <= num_cols * num_rows * 4:
            x_offset = table_margin + ((num-1) % num_cols) * cell_width
            y_offset = table_margin + ((num-1) // (num_cols * num_rows)) * ((num_rows * cell_height) + table_spacing)

            draw.rectangle((x_offset+1, y_offset+1, x_offset+cell_width-1, y_offset+cell_height-1), fill=(255, 0, 0))
            draw.text((x_offset+2, y_offset+2), str(num), font=font, fill=(0, 0, 0))

image.save("../src/p.png")
