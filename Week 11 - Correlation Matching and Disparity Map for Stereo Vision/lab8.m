clear all; close all; clc;

% Read the image to be preprocessed
ImLeft = imread('S00L.tif');
ImRight = imread('S00R.tif');

% ImLeft = imread('S01L.png');
% ImRight = imread('S01R.png');

% This is added in case the image introduced is an RGB image. 
% It functions to convert it to a gray-scale image. 
if (size(ImLeft,3) == 3)
    ImLeft = rgb2gray(ImLeft);
    ImRight = rgb2gray(ImRight);
end

%Convert the image to double before performing any mathematical operation
IL = double(ImLeft);
IR = double(ImRight);

% Define the left window size
k = 5; 

% Define the search window size
ww1 = 40; ww2 = 1;

offset1 = ww1 + k; % Column offset
offset2 = ww2 + k; % Row offset

paddedImL = padarray(IL,[offset2 offset1],'both');
paddedImR = padarray(IR,[offset2 offset1],'both');

% The numbers of rows and columns of the padded image are obtained  
[r, c, ch] = size(paddedImL);

disparity1 = zeros(r,c);

for i =(offset2+1):r-offset2
    for j =(offset1+1):c-offset1
        % Reset the data storage matrix before any cycle. 
        dist = [];
        
        % The window will go from -k to +k
        wL = paddedImL(i-k:i+k, j-k:j+k);
        
        for ii = 0:ww2
            for jj = 0:ww1
                wR = paddedImR(i-k-ii:i+k-ii, j-k-jj:j+k-jj);
                ssd = sum(sum((wL - wR).^2));
                dist = [dist; i-ii j-jj ssd];
            end
        end
        ind = find(dist(:,3) == min(dist(:,3)));
        d1 = j - dist(ind(1),2);
        d2 = i - dist(ind(1),1);
        disparity1(i,j) = d1;
        disparity2(i,j) = d2;
    end
end

dispar1 = uint8(disparity1);

% Show stereo pair in a red-cyan anaglyph
imshow(stereoAnaglyph(ImLeft,ImRight));
% Show disparity map with colorbar
figure; imagesc(dispar1); colormap jet; colorbar
title(['Correlation Window Size (2k+1), k = ', num2str(k), '; Search Window Size, w = ', num2str(ww2), 'x', num2str(ww1)])
