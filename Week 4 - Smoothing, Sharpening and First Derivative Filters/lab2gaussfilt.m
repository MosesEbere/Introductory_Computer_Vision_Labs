function [output] = lab2gaussfilt(img)

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

%create the gaussian filter
Gauss_filt = [1 4 7 4 1; 4 16 26 16 4; 7 26 41 26 7; 4 16 26 16 4; 1 4 7 4 1]/273;

% % The window size for the gaussian filtering operation is specified. 
k = 2;

% To ensure that we don't end up with an image of a different size relative
% to the original image, we initialize our final image with the same number of rows
% and columns as the original one. 
Inew = zeros(r, c);

% Use nested for-loops to create a window for scanning the image.
for i=(k+1):r-k
    for j=(k+1):c-k
        %the window will go from -k to +k
        wp = I(i-k:i+k, j-k:j+k);
        % Perform convolution using the previously created gaussian filter. 
        Inew(i,j) = sum(wp(:).*Gauss_filt(:));
    end
end

% Convert the resulting image to unsigned 8-bit image and return the
% result.
output = uint8(Inew);

end