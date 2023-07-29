# Edge Detection with First and Second Order Derivative Filters

[![MATLAB](https://img.shields.io/badge/MATLAB-R2021b%20or%20later-blue.svg)](https://www.mathworks.com/products/matlab.html)

This repository contains the code and results for the **Edge Detection** assignment in the **Computer Vision** course. The objective of this assignment was to implement and compare three edge detection algorithms using **Prewitt**, **Sobel**, and **Laplacian of Gaussian (LoG)** filters.

## Prewitt Operator

The Prewitt operator is a discrete 2D derivative operation applied with the following kernels:

Gx = [-1 0 1; -1 0 1; -1 0 1]
Gy = [-1 -1 -1; 0 0 0; 1 1 1]


To detect edges in a grayscale image, we calculate the gradient image G(p) using the horizontal and vertical Prewitt operators and binarize it with a specified threshold. The gradient image is computed as follows:

G(p) = sqrt(Gx(p)^2 + Gy(p)^2)

The function `lab3prewitt.m` takes an image and a threshold value as inputs and returns a binary image of detected edges using Prewitt filters.

<div align="center">
    <img src="Media%20Resources/bri_Result.jpg" alt="1" width="700"/>
</div>
<div align="center">
    <em>1</em>
</div>

<div align="center">
    <img src="Media%20Resources/Prewitt_Result.jpg" alt="2" width="700"/>
</div>
<div align="center">
    <em>2</em>
</div>

## Sobel Operator

The Sobel operator is another discrete 2D derivative operation applied with the following kernels:

Gx = [-1 0 1; -2 0 2; -1 0 1]
Gy = [-1 -2 -1; 0 0 0; 1 2 1]

Similar to Prewitt-based edge detection, we compute the gradient image G(p) by using the Sobel operators and apply binarization with the given threshold.

The function `lab3sobel.m` takes an image and a threshold value as inputs and returns a binary image of detected edges using Sobel filters.

<div align="center">
    <img src="Media%20Resources/Sobel_Result.jpg" alt="1" width="700"/>
</div>
<div align="center">
    <em>1</em>
</div>

<div align="center">
    <img src="Media%20Resources/sun_Result.jpg" alt="2" width="700"/>
</div>
<div align="center">
    <em>2</em>
</div>

<div align="center">
    <img src="Media%20Resources/bri_Result_Sobel.jpg" alt="3" width="700"/>
</div>
<div align="center">
    <em>3</em>
</div>

## Laplacian of Gaussian (LoG) Filter

To detect edges in an image while minimizing noise, we first smooth the image with a Gaussian filter and then apply the Laplacian operator. The LoG filter is used to obtain the gradient information. The kernel for the LoG filter is:

LoG = [0 0 -1 0 0; 0 -1 -2 -1 0; -1 -2 16 -2 -1; 0 -1 -2 -1 0; 0 0 -1 0 0]

<div align="center">
    <img src="Media%20Resources/LoG_Result.jpg" alt="1" width="700"/>
</div>
<div align="center">
    <em>1</em>
</div>

<div align="center">
    <img src="Media%20Resources/laptop_Result.jpg" alt="2" width="700"/>
</div>
<div align="center">
    <em>2</em>
</div>

<div align="center">
    <img src="Media%20Resources/ZeroCrossing_Result.jpg" alt="3" width="700"/>
</div>
<div align="center">
    <em>3</em>
</div>

Unlike the Sobel and Prewitt-based edge detection, zero-crossing points represent the edge pixels in the LoG filtered image.

The function `lab3log.m` takes an image as input and returns the LoG filtered image.

## Post Lab Discussion

In the post-lab report, we provided brief explanations of the functions implemented in this lab and presented resulting images obtained using all these functions. We discussed the differences of the edge detectors in terms of their applicability for different scenarios.

We also developed a program to find zero crossings in the LoG filtered image for edge detection.

## Report
For further details and visualizations, please refer to the [report](Report/Moses%20Chuka%20Ebere%20-%20EE%20417%20-%20Post-lab%20Assignment%203.pdf).

### Conclusion

This assignment provided valuable insights into edge detection algorithms and their parameter tuning. We explored the effectiveness of Prewitt, Sobel, and LoG filters for detecting edges in various scenarios.
