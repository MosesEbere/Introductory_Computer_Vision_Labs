# Corner Detection

[![MATLAB](https://img.shields.io/badge/MATLAB-R2021b%20or%20later-blue.svg)](https://www.mathworks.com/products/matlab.html)

This repository contains the code and results for the **Corner Detection** assignment in the **Computer Vision** course. The goal of this assignment was to implement and compare two corner detection algorithms: the **Minimum Eigenvalue Algorithm** (Kanade-Tomasi) and the **Harris Algorithm**.

## Minimum Eigenvalue Algorithm (Kanade-Tomasi)

1. **Gradients Computation:** Compute the gradients G<sub>x</sub> and G<sub>y</sub> of the grayscale image using the `imgradientxy` function.

2. **H Matrix Calculation:** Create the H matrix of each pixel in a window.

3. **Eigenvalue Computation:** Compute the eigenvalues λ<sub>1</sub> and λ<sub>2</sub> of the H matrix.

4. **Corner Detection:** If the minimum of λ<sub>1</sub> and λ<sub>2</sub> is greater than the specified threshold, add the pixel coordinates to the corner list.

## Harris Algorithm

1. **Gradients Computation:** Compute the gradients G<sub>x</sub> and G<sub>y</sub> of the grayscale image using the `imgradientxy` function.

2. **H Matrix Calculation:** Create the H matrix of each pixel in a window.

3. **Corner Response Calculation:** Compute the corner response value f as `det(H) / trace(H)`, where trace(H) is the sum of the diagonals of the H matrix.

4. **Corner Detection:** If the corner response value f is greater than the specified threshold, add the pixel coordinates to the corner list.

## Post Lab Discussion

In the post-lab report, we provided brief explanations of each method used in this lab. We included resulting images obtained through both Kanade-Tomasi and Harris corner detection algorithms and discussed the results.

### Kanade-Tomasi Corner Detector
We observed that the Kanade-Tomasi corner detector performed well on various images, accurately detecting corner points. The implementation of this algorithm was efficient, and the threshold played a crucial role in controlling the corner detection sensitivity.

<div align="center">
    <img src="Media%20Resources/KT.jpg" alt="1" width="700"/>
</div>
<div align="center">
    <em>1</em>
</div>

<div align="center">
    <img src="Media%20Resources/KT1.jpg" alt="2" width="700"/>
</div>
<div align="center">
    <em>2</em>
</div>

### Harris Corner Detector
The Harris corner detector also yielded promising results, successfully detecting corners in different images. We compared two corner response measures, f and R (R = det(H) - k(trace(H))^2), and evaluated their performance. The choice of the measure can affect the corner detection performance, and further experimentation with different images might be necessary to determine the most suitable measure.


<div align="center">
    <img src="Media%20Resources/ads.jpg" alt="1" width="700"/>
</div>
<div align="center">
    <em>1</em>
</div>

<div align="center">
    <img src="Media%20Resources/Harris_R1.jpg" alt="2" width="700"/>
</div>
<div align="center">
    <em>2</em>
</div>

## Conclusion

Overall, this assignment allowed us to gain practical experience in corner detection algorithms and their parameter tuning. We also explored the differences in performance between the Kanade-Tomasi and Harris corner operators.

## Report
For further details and visualizations, please refer to the [report](Report/Moses%20Chuka%20Ebere%20-%20EE%20417%20-%20Post-lab%20Assignment%204.pdf).