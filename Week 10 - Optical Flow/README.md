# Optical Flow

[![MATLAB](https://img.shields.io/badge/MATLAB-R2021b%20or%20later-blue.svg)](https://www.mathworks.com/products/matlab.html)

## Introduction

In this computer vision lab, I implemented a program and a function to calculate the optical flow throughout a video. Optical flow is a fundamental concept in computer vision that deals with estimating the distribution of apparent velocities of objects in an image. By estimating optical flow between consecutive video frames, we can measure the velocities of objects in the video.

## Task Overview

The primary objectives of this lab assignment were as follows:

1. **Correlation Matching:** Utilize correlation matching to solve the correspondence problem between left and right sub-images in stereo vision.

2. **Similarity Measure (SSD):** Calculate the similarity measure between sub-images for each displacement (d = [d1, d2]T) within a given search window (R = ω × ω).

3. **Disparity Map Generation:** Store the displacements and similarity values in a matrix named "dist" and utilize the "find" command to retrieve the row index of the minimum similarity value. Use the corresponding points to calculate the disparity map for stereo images.

## Implementation

The main program, `lab7OFMain.m`, is responsible for loading the video files, defining the parameters `k` and `Threshold`, and calling the optical flow function, `lab7OF.m`, for each pair of consecutive frames in the video. The optical flow function then computes the optic flow for the given input images.

## Results 

After implementing the optical flow algorithm, I obtained the resulting images for each process step. I also compared the performances of the optical flow algorithm with different window sizes (k = 10, k = 20, k = 30) and smoothing filters (Box and Gaussian).

| ![Cars 1](https://github.com/MosesEbere/Introductory_Computer_Vision_Labs/blob/main/Week%2010%20-%20Optical%20Flow/Results/Cars1.gif) | ![Cars 2](https://github.com/MosesEbere/Introductory_Computer_Vision_Labs/blob/main/Week%2010%20-%20Optical%20Flow/Results/Cars2.gif) |
|:---------------------------------------:|:---------------------------------------:|
|                Cars 1                  |                Cars 2                  |
| ![Rubic](https://github.com/MosesEbere/Introductory_Computer_Vision_Labs/blob/main/Week%2010%20-%20Optical%20Flow/Results/Rubic.gif) | ![Sphere](https://github.com/MosesEbere/Introductory_Computer_Vision_Labs/blob/main/Week%2010%20-%20Optical%20Flow/Results/Sphere.gif) |
|:---------------------------------------:|:---------------------------------------:|
|                Rubic                  |                Sphere                  |
| ![Taxi](https://github.com/MosesEbere/Introductory_Computer_Vision_Labs/blob/main/Week%2010%20-%20Optical%20Flow/Results/Taxi.gif) | ![Traffic](https://github.com/MosesEbere/Introductory_Computer_Vision_Labs/blob/main/Week%2010%20-%20Optical%20Flow/Results/Traffic.gif) |
|:---------------------------------------:|:---------------------------------------:|
|                Taxi                  |                Traffic                  |


## Conclusion

The optical flow algorithm provides valuable insights into the apparent velocities of objects in a video. By experimenting with different window sizes and smoothing filters, I observed variations in the quality of optical flow estimation. These results are essential for further analysis and understanding of moving objects in the video.

For further details and visualizations, please refer to the [report](Report/Moses%20Chuka%20Ebere%20-%20EE%20417%20-%20Post-lab%20Assignment%207.pdf).
