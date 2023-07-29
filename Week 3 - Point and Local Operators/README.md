# Point and Local Operators

[![MATLAB](https://img.shields.io/badge/MATLAB-R2021b%20or%20later-blue.svg)](https://www.mathworks.com/products/matlab.html)

This repository contains the code and results for the **Point and Local Operators** assignment in the **Computer Vision** course. The objective of this lab was to implement various preprocessing operations for grayscale images, including histogram equalization, linear scaling, conditional scaling, local mean filter (box filter), and local max/min filters.

## Histogram Equalization

Histogram equalization is a point operator that adjusts the contrast of an image using its histogram. We applied histogram equalization to the given image using MATLAB's built-in "histeq" function and obtained histograms of both the original and resulting images using "imhist" function.

<div align="center">
    <img src="Media%20Resources/Blu.jpg" alt="1" width="700"/>
</div>
<div align="center">
    <em>1</em>
</div>

## Linear Scaling

Linear scaling is a point operator that linearly scales pixel values between `u_min` and `u_max` using a gradation function. The function `lab1linscale.m` takes an image as input and returns the linearly scaled version of it. The pixel values of the returned image are scaled between 0 and 255. We compared histograms of the resulting linearly scaled and histogram equalized images.

<div align="center">
    <img src="Media%20Resources/Linear_Scaling.jpg" alt="1" width="700"/>
</div>
<div align="center">
    <em>1</em>
</div>

<div align="center">
    <img src="Media%20Resources/monalisa.jpg" alt="2" width="700"/>
</div>
<div align="center">
    <em>2</em>
</div>

## Conditional Scaling

Conditional scaling is another point operator that maps an image `J` to a new image `J_new` with the same mean and variance as a reference image `I`. The function `lab1condscale.m` takes two images as inputs and returns the conditionally scaled version of the first image. The resultant image has the same mean and variance as the second image.

<div align="center">
    <img src="Media%20Resources/Conditional_Scaling.jpg" alt="1" width="700"/>
</div>
<div align="center">
    <em>1</em>
</div>

## Local Mean Filter (Box Filter)

The local mean filter (box filter) is a local operator used to attenuate noise in images. It replaces each pixel with the average of its neighborhood in a sliding window. The function `lab1locbox.m` takes an image and a window size as inputs and returns the local mean (box filter) filtered version of the image.

<div align="center">
    <img src="Media%20Resources/Box_Filter.jpg" alt="1" width="700"/>
</div>
<div align="center">
    <em>1</em>
</div>

## Local Max and Min Filters

The local max and min filters are local operators used for dilation and erosion of pixels in images. They replace each pixel with the maximum and minimum of its neighborhood in a sliding window, respectively. The function `lab1locmaxmin.m` takes an image and a window size as inputs and returns the local maximum and minimum filtered versions of the image.

<div align="center">
    <img src="Media%20Resources/Dark_Walkway.jpg" alt="1" width="700"/>
</div>
<div align="center">
    <em>1</em>
</div>

## Post Lab Discussion

The post-lab report includes brief explanations of the implemented functions and presents resulting images obtained using all these functions with different window sizes. We discussed the results and observed how each operator affects the image in terms of contrast enhancement, noise reduction, and dilation/erosion of edges.

Additionally, we implemented our own histogram equalization function to compare its performance with the built-in "histeq" function in MATLAB.

## Report
For further details and visualizations, please refer to the [report](Report/Moses%20Chuka%20Ebere%20-%20EE%20417%20-%20Post-lab%20Assignment%201.pdf).

