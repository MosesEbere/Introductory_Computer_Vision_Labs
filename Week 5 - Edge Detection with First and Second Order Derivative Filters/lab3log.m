function [output1, output2] = lab3log(img)

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

% Create the sobel filters; the x-filter will be used to create the
% vertically filtered image, while the y-filter will be used to create the
% horizontally filtered image. 
LoG_filt = [0 1 0; 1 -4 1; 0 1 0];

% The prewitt filter has a size (2k+1)x(2k+1), where k = 1;
k = 1;

% To ensure that we don't end up with images of different sizes relative
% to the original images, we initialize our final images with the same number of rows
% and columns as the original ones. 
ILoG = zeros(r, c);

% Use nested for-loops to create a window for scanning the image.
for i=(k+1):1:r-k
    for j=(k+1):1:c-k
        %the window will go from -k to +k
        wp = I(i-k:i+k, j-k:j+k);
        % Perform convolution using the previously created masks. 
        ILoG(i,j) = sum(wp(:).*LoG_filt(:));
    end
end

% Create a row vector having the same number of columns as our original image. 
Inew = zeros(1, c);
ii = 1;

% This is used to select the line segment. 
% The following syntax is just a trivial inclusion based on our observation of where an
% edge will be present. 
if mod(r, 2) == 0
    r1 = r/2;
else
    r1 = (r+1)/2;
end

% This for-loop is included just in case we want the gradient profile along
% the entire width of the image. 
for c1 = 1:1:c    
    Inew(ii,c1) = ILoG(r1, c1);
end
ILoG
% Convert the resulting images to unsigned 8-bit images and return the
% results.
output1 = uint8(ILoG);

% Since uint8 doesn't include negative values, we return the array for the
% gradient profile as a double. 
output2 = Inew;

end