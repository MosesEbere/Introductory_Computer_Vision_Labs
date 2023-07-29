function [output] = lab2sharpen(img, li, m)

% The row, column, and channels of the image are obtained along with the cardinality of the image. 
[r, c, ch] = size(img);
Card = r*c;

% This is added in case the image introduced is an RGB image. 
% It functions to convert it to a gray-scale image. 
if (ch == 3)
    img = rgb2gray(img);
end

%Convert the image to double before performing any %mathematical operations
I = double(img);

% The window size for the smoothing operation is specified. 
k = 2;

% The following conditional statements are used to specify the smoothing
% method to apply. 
if m == 1
    % This applies the Box Filter as the smoothing method. 
    im = lab1locbox(img, k);
elseif m == 2
        % This applies the Gaussian Filter as the smoothing method. 
        im = lab2gaussfilt(img);
elseif m == 3
        % This applies the Median Filter as the smoothing method. 
        im = lab2medfilt(img, k);
end

% Convert the resulting image from the above conditional statements to a
% double for mathematical operations. 
ima = double(im);

% Sharpening doesn't involve any convolution, hence, no for-loop is used. 
Inew = I + li*(I - ima);

% Convert the resulting image to unsigned 8-bit image and return the
% result.
output = uint8(Inew);
end