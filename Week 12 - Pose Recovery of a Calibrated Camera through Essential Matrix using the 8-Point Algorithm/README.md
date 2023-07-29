# Pose Recovery of a Calibrated Camera 

[![MATLAB](https://img.shields.io/badge/MATLAB-R2021b%20or%20later-blue.svg)](https://www.mathworks.com/products/matlab.html)

## Introduction

This directory showcases my work on a lab titled "Pose Recovery of a Calibrated Camera through Essential matrix using the 8-point algorithm." During this lab, I delved into the fascinating world of camera pose recovery by estimating the Essential Matrix (E) using the 8-point algorithm and making use of epipolar geometry. I would like to share the approach I took to complete this assignment.

## Task Overview

The main objectives of this assignment were as follows:

1. **Essential Matrix Estimation:** Recover the pose of a calibrated camera by estimating the Essential Matrix (E) using the 8-point algorithm. The intrinsic camera parameters (matrix K) were already known, allowing us to focus on recovering the camera's pose.

2. **Epipolar Geometry:** Understand the concept of epipolar geometry and its significance in pose recovery. Verify that image points and epipoles for one view lie on the epipolar line.

3. **Pose Recovery:** Recover the rotation and translation of the camera using the estimated Essential Matrix and perform necessary post-processing to obtain reliable results.

## Implementation

In my implementation, I followed a rigorous step-by-step procedure to achieve accurate pose recovery:

1. **Data Preparation:** I first ran the provided "lab9.m" file to generate 3D world points and obtain their corresponding image points from two different views. The intrinsic camera matrix K was used to transform points into pixel coordinates.

2. **Essential Matrix Estimation:** To ensure a reliable Essential Matrix, I carefully selected 8 point pairs, avoiding degenerate configurations. For each pair, I calculated the vector 'a' and stacked 8 of them to form the matrix 'X,' as described in the instructions.

3. **Eigenvector Computation:** From the equation XE_s = 0, where E_s is the stacked Essential Matrix, I computed the eigenvector associated with the smallest eigenvalue of X^T X to obtain the initial Essential Matrix E.

4. **Essential Matrix Characterization:** To satisfy the Essential Matrix Characterization theorem, I adjusted the singular values of the estimated E. Replacing σ1 = σ2 = 1 and σ3 = 0, I ensured that U and V were elements of SO(3) for E = UΣV^T.

5. **Epipoles and Epipolar Lines:** I utilized the null(E) function to find the epipoles (e1, e2) and the coefficients of epipolar lines for a selected point pair. I verified that the image points and epipoles for one view lay on the epipolar line.

6. **Camera Pose Recovery:** Finally, I recovered the rotation and translation of the camera using the computed Essential Matrix. Two possible poses were recovered based on the formulas provided in the instructions.

## Results 

I diligently executed the assignment tasks, recovering the camera pose for multiple scenarios, including points on the same plane and all points combined. I compared the results obtained for each case and provided images from two views to support my findings. Additionally, I explained the procedures followed and thoroughly discussed the significance of the recovered poses and their verifications in the accompanying report.

## Lab Report
For a more detailed report of this work, you can find the PDF [here](Report/Moses%20Chuka%20Ebere%20-%20EE%20417%20-%20Post-lab%20Assignment%209.pdf).

## Conclusion

This assignment on camera pose recovery through the Essential matrix using the 8-point algorithm was a challenging yet rewarding experience. I thoroughly enjoyed exploring epipolar geometry and understanding the intricacies of camera calibration. My commitment to professional excellence and my passion for computer vision have driven me to strive for accurate and reliable results.
