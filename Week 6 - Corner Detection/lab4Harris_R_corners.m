function [output1, output2] = lab4Harris_R_corners(img, t)

% First of all, smoothen the image using Gaussian filtering.
img = lab3gaussfilt(img);

% The row, column, and channels of the image are obtained along with the cardinality of the image. 
[r, c, ch] = size(img);
Card = r*c;

% This is added in case the image introduced is an RGB image. 
% It functions to convert it to a gray-scale image. 
if (ch == 3)
    img = rgb2gray(img);
end

%Convert the image to double before performing any %mathematical operation
I = double(img);

% Compute the image gradients
[Gx, Gy] = imgradientxy(I);
% Initialize the second order moment matrix and the list with empty arrays.
H = []; list = [];

% The window size for the gaussian filtering operation is specified. 
k = 2;
% The Empirical Constant for the Cornerness Function is defined
kk = 0.05;

% Use nested for-loops to create a window for scanning the image.
for i=(k+1):1:r-k
    for j=(k+1):1:c-k
        % Create a window of the image gradients (from -k to +k)
        wpx = Gx(i-k:i+k, j-k:j+k);
        wpy = Gy(i-k:i+k, j-k:j+k);
        % Create the corner matrix, H. 
        H(1,1) = sum(sum(wpx.*wpx));
        H(1,2) = sum(sum(wpx.*wpy));
        H(2,1) = H(1,2);
        H(2,2) = sum(sum(wpy.*wpy));
        % R is the cornerness function
        R = det(H) - kk*(trace(H))^2;
        % Threshold R to obtain the corners. 
        if R > t
            list = [list; [i,j]];
        end        
    end
end
% Convert the resulting image to unsigned 8-bit image and return the
% result and the list. 
output1 = uint8(I);
output2 = list;
end
