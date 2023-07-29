# Computer Vision Labs

[![MATLAB](https://img.shields.io/badge/MATLAB-R2021b%20or%20later-blue.svg)](https://www.mathworks.com/products/matlab.html)

This repository contains my solutions to the practical assignments for the **Computer Vision** course. The labs cover various topics and techniques in computer vision, including image processing, edge detection, corner detection, optical flow, stereo vision, and camera pose recovery.

## Table of Contents

0. [Lab #0: Introduction](#lab-1-Introduction)
1. [Lab #1: Point and Local Operators](#lab-1-point-and-local-operators)
2. [Lab #2: Smoothing, Sharpening, and 1st Derivative Filters](#lab-2-smoothing-sharpening-and-1st-derivative-filters)
3. [Lab #3: Edge Detection with First and Second Order Derivative Filters](#lab-3-edge-detection-with-first-and-second-order-derivative-filters)
4. [Lab #4: Corner Detection](#lab-4-corner-detection)
5. [Lab #5: Line and Circle Detection using Hough Transform](#lab-5-line-and-circle-detection-using-hough-transform)
6. [Lab #6: Data Generation for Camera Calibration](#lab-6-data-generation-for-camera-calibration)
7. [Lab #7: Optical Flow](#lab-7-optical-flow)
8. [Lab #8: Correlation Matching and Disparity Map for Stereo Vision](#lab-8-correlation-matching-and-disparity-map-for-stereo-vision)
9. [Lab #9: Pose Recovery of a Calibrated Camera through Essential Matrix using the 8-Point Algorithm](#lab-9-pose-recovery-of-a-calibrated-camera-through-essential-matrix-using-the-8-point-algorithm)

## Lab #0: Introduction

This lab covers a brief introduction to coding with MATLAB for computer vision applications. 

## Lab #1: Point and Local Operators

In this lab, we implemented various preprocessing operations for grayscale images. The operations include histogram equalization, linear scaling, conditional scaling, local mean filter (box filter), and local max/min filters. We also compared the results obtained using different parameter settings for window sizes.

## Lab #2: Smoothing, Sharpening, and 1st Derivative Filters

This lab focused on implementing smoothing and sharpening operations using linear and nonlinear filters. We applied Gaussian smoothing and Laplacian of Gaussian (LoG) filtering to enhance images and discussed the effect of different filter sizes on image quality.

## Lab #3: Edge Detection with First and Second Order Derivative Filters

In this lab, we explored edge detection using first and second-order derivative filters, such as Prewitt and Sobel operators. We applied edge detection techniques to grayscale images and compared the results with different threshold values.

## Lab #4: Corner Detection

The focus of this lab was on corner detection algorithms, specifically the Kanade-Tomasi and Harris algorithms. We implemented both algorithms and compared their performance in detecting corners in various images.

## Lab #5: Line and Circle Detection using Hough Transform

In this lab, we applied the Hough transform to detect lines and circles in images. We implemented Hough line detection and circle detection with different parameter settings and discussed the results.

## Lab #6: Data Generation for Camera Calibration

The final lab involved data generation for camera calibration. We utilized edge detection techniques, Hough transform, and corner detection algorithms to extract calibration points from images of 3D calibration objects. We discussed the accuracy and applicability of different methods.

## Lab #7: Optical Flow

In this lab, we explored the concept of optical flow, which deals with estimating the motion of objects in consecutive image frames. We implemented optical flow algorithms to visualize the movement of objects in video sequences.

## Lab #8: Correlation Matching and Disparity Map for Stereo Vision

This lab focused on stereo vision and depth perception. We implemented correlation matching techniques to compute disparity maps from stereo image pairs, enabling us to estimate the distance of objects from the camera.

## Lab #9: Pose Recovery of a Calibrated Camera through Essential Matrix using the 8-Point Algorithm

In this lab, we worked with calibrated cameras and estimated the pose of a camera relative to a scene using the essential matrix and the 8-point algorithm. We reconstructed the camera's position and orientation from image correspondences.

---

Please note that the above content provides a brief overview of each lab's objectives and topics covered. For detailed explanations, code implementations, and results, please refer to the corresponding directories for each lab.

Feel free to explore the labs and experiment with the provided code to gain a deeper understanding of computer vision techniques.
