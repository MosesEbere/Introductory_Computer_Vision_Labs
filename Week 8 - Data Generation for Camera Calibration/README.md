# Data Generation for Camera Calibration assignment

[![MATLAB](https://img.shields.io/badge/MATLAB-R2021b%20or%20later-blue.svg)](https://www.mathworks.com/products/matlab.html)

## Introduction

This directory contains the code and results for the **Data Generation for Camera Calibration assignment**. The goal of this assignment was to implement corner detection using two different methods: **Harris corners** (with integer values) and **Intersection point of two lines** (with sub-pixel accuracy).

## Task Overview

In this lab, we followed these steps:

1. **Edge Detection**: We started by reading the image of the calibration cube provided in the SUCourse and converted it to a black-white edge image using our chosen edge detection algorithm.

2. **Line Detection**: Next, we used the Hough transform with appropriate parameters to find the lines in the edge image. We plotted the beginnings and ends of the lines with yellow and red crosses, respectively, and displayed the lines with a green color on the gray-scale version of the original image.

3. **Intersection Point**: We manually selected two intersecting lines from the plot obtained in the previous step. From the output of the 'houghlines' function, we extracted the corresponding ρ and θ values. Using these values, we found the equations of these two lines and plotted them with a magenta color on the same figure. We then solved the line equations to find the intersection point with sub-pixel accuracy and plotted that point on the same figure.

4. **Harris Corner Detection**: Using the gray-scale version of the original image, we performed Harris corner detection and plotted the detected corner points with blue circles on the same figure.

5. **Comparison and Distance Calculation**: We calculated and displayed the distance between two corner points obtained with the two different methods.


## Results 

<div align="center">
    <img src="Media%20Resources/In-lab_subplot.jpg" alt="1" width="700"/>
</div>
<div align="center">
    <em>1</em>
</div>

<div align="center">
    <img src="Media%20Resources/In-lab_subplot_m.jpg" alt="2" width="700"/>
</div>
<div align="center">
    <em>2</em>
</div>

<div align="center">
    <img src="Media%20Resources/Post-lab_Subplot.jpg" alt="Line Extraction" width="700"/>
</div>
<div align="center">
    <em>Line Extraction</em>
</div>

<div align="center">
    <img src="Media%20Resources/Post_lab_final.jpg" alt="Line Extraction - b" width="700"/>
</div>
<div align="center">
    <em>Line Extraction - b</em>
</div>

## Discussion

In comparing the two corner extraction methods, we observed that the intersection point of two lines provided better sub-pixel accuracy compared to the Harris corner detection algorithm. The sub-pixel accuracy is crucial for precise camera calibration, making the intersection point method more favorable for calibration purposes.
<div align="center">
    <img src="Media%20Resources/comparison.jpg" alt="Sub-pixel Accuracy" width="700"/>
</div>
<div align="center">
    <em>Sub-pixel Accuracy</em>
</div>

## Conclusion

While the intersection point method performed well in this assignment, further research could explore more sophisticated corner detection algorithms and potentially improve the accuracy and robustness of calibration.

For better performance, advanced techniques like **SIFT (Scale-Invariant Feature Transform)** or **SURF (Speeded-Up Robust Features)** could be investigated. These methods are known for their robustness and ability to handle different lighting conditions and viewpoints.

Overall, this assignment has provided valuable insights into corner detection and its significance in camera calibration.

## Report
For further details and visualizations, please refer to the [report](Report/Moses%20Chuka%20Ebere%20-%20EE%20417%20-%20Post-lab%20Assignment%206.pdf).
