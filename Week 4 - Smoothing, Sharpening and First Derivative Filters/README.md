# Smoothing, Sharpening, and First Derivative Filters

[![MATLAB](https://img.shields.io/badge/MATLAB-R2021b%20or%20later-blue.svg)](https://www.mathworks.com/products/matlab.html)

This repository contains the code and results for the **Smoothing, Sharpening, and First Derivative Filters** assignment in the **Computer Vision** course. The objective of this assignment was to implement and compare various image filtering techniques, including **Gaussian smoothing**, **median filtering**, **sharpening**, and **Sobel first derivative filtering**.

## Gaussian Smoothing

Gaussian filtering is a linear operation used to smooth images by eliminating outliers, which are considered noise. The convolution of a given image with a 5x5 approximated Gaussian filter kernel is applied for smoothing.

The function `lab2gaussfilt.m` takes an image as input and returns the Gaussian smoothed version of the image using the provided kernel.

<div align="center">
    <img src="Media%20Resources/fGaussianFiltered.jpg" alt="1" width="700"/>
</div>
<div align="center">
    <em>1</em>
</div>



## Median Filtering

Median filtering is a nonlinear operation involving sorting and selecting the median element. It is used for noise reduction in images. Unlike convolution, median filtering cannot be represented as a linear operation.

The function `lab2medfilt.m` takes an image and a constant `k` as inputs and returns the median filtered version of the image.

<div align="center">
    <img src="Media%20Resources/bMedianFiltered.jpg" alt="1" width="700"/>
</div>
<div align="center">
    <em>1</em>
</div>

## Sharpening

Sharpening aims to enhance an image by increasing contrast along edges without introducing excessive noise in homogeneous regions. It can be implemented using the formula:

J(p) = I(p) + λ * (I(p) - S(p))

Where `S` is the smoothed version of the given image `I`, and `λ > 0` is a scaling factor controlling the correction signal's influence.

The function `lab2sharpen.m` takes an image, a constant `λ`, and an integer `M` as inputs to return the sharpened version of the image. The integer `M` is used to select the smoothing method (box filter, Gaussian filter, or median filter).

<div align="center">
    <img src="Media%20Resources/BallSharpened.jpg" alt="1" width="700"/>
</div>
<div align="center">
    <em>1</em>
</div>

## First Derivative (Sobel Filter)

Sobel filtering is a discrete 2D derivative operation used for computing the first derivatives of an image along x and y directions. It involves the following kernels:

Gx = [-1 0 1; -2 0 2; -1 0 1]
Gy = [-1 -2 -1; 0 0 0; 1 2 1]


The function `lab2sobelfilt.m` takes an image as input and returns two images, which are the first derivatives of the input image along the x and y directions using the Sobel filter.

<div align="center">
    <img src="Media%20Resources/eye.jpg" alt="1" width="700"/>
</div>
<div align="center">
    <em>1</em>
</div>

## Post Lab Discussion

The post-lab report includes brief explanations of the implemented functions and presents resulting images obtained using all these functions. We discussed the differences of the filters in terms of their applicability for different scenarios.

Additionally, we implemented the 'sigma filter,' another nonlinear smoothing filter that suppresses noise in an image without significant blurring. We compared its results with other filters to evaluate its performance.

<div align="center">
    <img src="Media%20Resources/SigFiltered2.jpg" alt="2" width="700"/>
</div>
<div align="center">
    <em>2</em>
</div>

<div align="center">
    <img src="Media%20Resources/SigFiltered3.jpg" alt="1" width="700"/>
</div>
<div align="center">
    <em>1</em>
</div>

## Report
For further details and visualizations, please refer to the [report](Report/Moses%20Chuka%20Ebere%20-%20EE%20417%20-%20Post-lab%20Assignment%202.pdf).

