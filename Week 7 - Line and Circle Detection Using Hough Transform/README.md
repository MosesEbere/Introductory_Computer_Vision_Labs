# Line and Circle Detection using Hough Transform

[![MATLAB](https://img.shields.io/badge/MATLAB-R2021b%20or%20later-blue.svg)](https://www.mathworks.com/products/matlab.html)


This repository contains the code and results for the **Line and Circle Detection using Hough Transform** assignment. The goal of this assignment was to detect lines and circles in images using the Hough transform with different parameters.

## Line Detection

### Step 1: Edge Detection
We started by reading an image and converting it to a black-white edge image using our chosen edge detector.

### Step 2: Hough Transform
Next, we obtained the Hough transform of the black-white image and displayed it along ρ vs θ axes using the 'hough' function.

### Step 3: Peak Detection
We selected the peak Hough points with an appropriate threshold (e.g., half of the maximum Hough points) using the 'houghpeaks' function.

### Step 4: Line Detection
Using the peak points, we found the lines in the image using the 'houghlines' function.

### Step 5: Visualization
We plotted all the detected lines with a green color and highlighted the longest and shortest lines with cyan and red colors, respectively. We also calculated and reported the maximum and minimum lengths of the detected lines.

## Circle Detection

### Step 1: Preprocessing
We read an image that contains several different-sized circles and converted it to a black-white image.

### Step 2: Hough Transform for Circle Detection
We detected all the circles with radii between 20 and 60 pixels using the 'imfindcircles' function. We experimented with different 'Sensitivity' factors to test the performance of circle detection and also adjusted the 'ObjectPolarity' parameter to detect 'bright' and 'dark' circles separately.

## Post Lab Discussion

In the post-lab report, we provided brief explanations of each method used in this lab. We included resulting images obtained through all these methods and discussed the results.

### Line Detection Results
We observed that line detection worked effectively, and the cyan and red highlighted lines provided useful insights into the longest and shortest lines present in the image. The execution time was also evaluated using the 'tic-toc' commands.

<div align="center">
    <img src="Media%20Resources/B_Subplot.jpg" alt="1" width="700"/>
</div>
<div align="center">
    <em>1</em>
</div>

<div align="center">
    <img src="Media%20Resources/C_Subplot.jpg" alt="2" width="700"/>
</div>
<div align="center">
    <em>2</em>
</div>

<div align="center">
    <img src="Media%20Resources/HT_Subplot.jpg" alt="3" width="700"/>
</div>
<div align="center">
    <em>3</em>
</div>

### Circle Detection Results
Circle detection also performed well, and we found circles of various sizes within the image. We experimented with different 'Sensitivity' factors to adjust the circle detection accuracy.

<div align="center">
    <img src="Media%20Resources/ci_c.jpg" alt="1" width="700"/>
</div>
<div align="center">
    <em>1</em>
</div>

<div align="center">
    <img src="Media%20Resources/HT_Circle.jpg" alt="2" width="700"/>
</div>
<div align="center">
    <em>2</em>
</div>

## Parameter Sensitivity

Changing parameters, such as threshold or sensitivity factor, had a significant impact on the accuracy of line and circle detection. Higher sensitivity factors in circle detection allowed us to detect more circles, but it also increased the risk of detecting false positives. Similarly, adjusting thresholds in line detection affected the number and accuracy of detected lines.

<div align="center">
    <img src="Media%20Resources/S=0.3.jpg" alt="0.3 Sensitivity" width="700"/>
</div>
<div align="center">
    <em>0.3 Sensitivity</em>
</div>

<div align="center">
    <img src="Media%20Resources/S=0.6.jpg" alt="0.6 Sensitivity" width="700"/>
</div>
<div align="center">
    <em>0.6 Sensitivity</em>
</div>

## Report
For further details and visualizations, please refer to the [report](Report/Moses%20Chuka%20Ebere%20-%20EE%20417%20-%20Post-lab%20Assignment%205.pdf).

## Conclusion

Overall, this assignment helped us gain valuable experience in utilizing the Hough transform for line and circle detection and exploring the effects of parameter adjustments on detection accuracy.
