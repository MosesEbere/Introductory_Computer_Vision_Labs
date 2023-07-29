clear all; close all; clc;

% Read the image to be preprocessed
ImLeft = imread('S00L.tif');
ImRight = imread('S00R.tif');

% ImLeft = imread('S01L.png');
% ImRight = imread('S01R.png');

% It functions to convert it to a gray-scale image. 
if (size(ImLeft,3) == 3)
    ImLeft = rgb2gray(ImLeft);
    ImRight = rgb2gray(ImRight);
end

min_disp = 0; max_disp = 16; % Range for the search area
win_size = 5; % correlation window size
disparityRange = [min_disp max_disp];
disparityMap = disparity(ImLeft, ImRight, 'Method','SemiGlobal', 'BlockSize', win_size,'DisparityRange',disparityRange);

figure 
imshow(disparityMap,disparityRange);
title('Disparity Map');
xlabel(['Correlation Window Size (2k+1), k = ', num2str(win_size),...
    '; Minimum Disparity = ', num2str(min_disp), '; Maximum Disparity = ', num2str(max_disp)])
colormap(gca,jet) 
colorbar