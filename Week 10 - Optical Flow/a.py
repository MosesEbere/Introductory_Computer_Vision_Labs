# import os
# from PIL import Image
# import imageio

# def create_gif(input_directory, output_filename, duration=0.2):
#     images = []

#     # Read PNG images from the input directory
#     for filename in sorted(os.listdir(input_directory)):
#         if filename.lower().endswith(".png"):
#             file_path = os.path.join(input_directory, filename)
#             image = Image.open(file_path)
#             images.append(image)

#     # Save images as a GIF
#     with imageio.get_writer(output_filename, mode="I", duration=duration) as writer:
#         for image in images:
#             writer.append_data(image.convert("P"))

# if __name__ == "__main__":
#     input_directory = "/home/moses/Documents/Sabanci University/OneDrive_1_7-29-2023/Labs/Week 10 - Optical Flow/Results/In-Lab Results/Cars1"
#     output_filename = "output.gif"
#     create_gif(input_directory, output_filename)

import os
import imageio

def create_gif(input_directory, output_filename, duration=0.2):
    images = []

    # Read PNG images from the input directory
    for filename in sorted(os.listdir(input_directory)):
        if filename.lower().endswith(".png"):
            file_path = os.path.join(input_directory, filename)
            images.append(imageio.imread(file_path))

    # Save images as a GIF with the Pillow plugin to preserve metadata (including arrows)
    with imageio.get_writer(output_filename, mode="I", duration=duration, plugin='pillow') as writer:
        for image in images:
            writer.append_data(image)

if __name__ == "__main__":
    # input_directory = "path/to/png/images"
    input_directory = "/home/moses/Documents/Sabanci University/OneDrive_1_7-29-2023/Labs/Week 10 - Optical Flow/Results/In-Lab Results/Traffic"
    output_filename = "Traffic.gif"
    duration = 100
    create_gif(input_directory, output_filename, duration=duration)
