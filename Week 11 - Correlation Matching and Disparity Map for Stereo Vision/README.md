# Correlation Matching and Disparity Map for Stereo Vision 

[![MATLAB](https://img.shields.io/badge/MATLAB-R2021b%20or%20later-blue.svg)](https://www.mathworks.com/products/matlab.html)

## Introduction

I am excited to present my work on the lab assignment titled "Correlation Matching for finding Correspondences." During this lab, I dived into the intriguing world of stereo vision, utilizing correlation matching to solve the correspondence problem. I successfully implemented a similarity measure, specifically Sum of Squared Differences (SSD), to find the best matches between left and right sub-images, thus generating the disparity map for stereo vision.

## Task Overview

The primary objectives of this lab assignment were as follows:

1. **Correlation Matching:** Utilize correlation matching to solve the correspondence problem between left and right sub-images in stereo vision.

2. **Similarity Measure (SSD):** Calculate the similarity measure between sub-images for each displacement (d = [d1, d2]T) within a given search window (R = ω × ω).

3. **Disparity Map Generation:** Store the displacements and similarity values in a matrix named "dist" and utilize the "find" command to retrieve the row index of the minimum similarity value. Use the corresponding points to calculate the disparity map for stereo images.

## Implementation

In my implementation, I meticulously followed these steps to achieve accurate correlation matching and disparity map generation:

1. **Similarity Calculation:** I applied the SSD similarity measure to compute the similarity between left and right sub-images for various displacements (d) within the search window. This involved comparing pixel intensities and summing the squared differences.

2. **Disparity Estimation:** For each pixel P = [x, y]T, I found the corresponding right sub-image P_right by considering the displacement d obtained from the minimum similarity value in the "dist" matrix. This process allowed me to compute the disparity map for the stereo vision.

## Results 

My results demonstrate the effectiveness of correlation matching and the accuracy of the generated disparity map. To ensure comprehensive analysis, I experimented with different window sizes and search areas. The selection of sub-image size and search window was based on balancing computational efficiency and maintaining reliable correspondences. In the post-lab analysis, I compared my disparity map with the result obtained from the built-in MATLAB function called 'disparity,' gaining valuable insights into the strengths and limitations of each approach.

<div align="center">
    <img src="Media%20Resources/L.jpg" alt="Reference Left Image" width="400"/>
    <img src="Media%20Resources/R.jpg" alt="Reference Right Image" width="400"/>
</div>
<div align="center">
    <em>Reference Left Image</em>
    <em>Reference Right Image</em>
</div>

<div align="center">
    <img src="Media%20Resources/LR_Result.png" alt="Stereo Anaglyph" width="400"/>
    <img src="Media%20Resources/Post_lab/Multiple/Combined.jpg" alt="Disparity Map" width="400"/>
</div>
<div align="center">
    <em>Stereo Anaglyph</em>
    <em>Disparity Map</em>
</div>
<br>
<br>

<div align="center">
    <img src="Media%20Resources/S01L.png" alt="Reference Left Image" width="400"/>
    <img src="Media%20Resources/S01R.png" alt="Reference Right Image" width="400"/>
</div>
<div align="center">
    <em>Reference Left Image</em>
    <em>Reference Right Image</em>
</div>

<div align="center">
    <img src="Media%20Resources/S01_Result.png" alt="Stereo Anaglyph" width="400"/>
    <img src="Media%20Resources/S01_Disparity_Map.jpg" alt="Disparity Map" width="400"/>
</div>
<div align="center">
    <em>Stereo Anaglyph</em>
    <em>Disparity Map</em>
</div>
<br>
<br>

<div align="center">
    <img src="Media%20Resources/S00L.jpg" alt="Reference Left Image" width="400"/>
    <img src="Media%20Resources/S00R.jpg" alt="Reference Right Image" width="400"/>
</div>
<div align="center">
    <em>Reference Left Image</em>
    <em>Reference Right Image</em>
</div>

<div align="center">
    <img src="Media%20Resources/S00_Result.png" alt="Stereo Anaglyph" width="400"/>
    <img src="Media%20Resources/Post_lab/S00_D_k=8;1x40.jpg" alt="Disparity Map" width="400"/>
</div>
<div align="center">
    <em>Stereo Anaglyph</em>
    <em>Disparity Map</em>
</div>
<br>
<br>


## Lab Report
For a more detailed report of this work, you can find the PDF [here](Report/Moses%20Chuka%20Ebere%20-%20EE%20417%20-%20Post-lab%20Assignment%208.pdf).

## Conclusion

This lab assignment on correlation matching and disparity map generation for stereo vision provided an enriching experience in computer vision (CV) algorithms. By implementing the 8-point algorithm and similarity measures, I successfully solved the correspondence problem and obtained reliable disparity maps. The skills and knowledge acquired through this lab have further fueled my passion for computer vision, and I am eager to learn and apply more CV algorithms. 
