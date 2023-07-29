function [output] = lab1locbox(img, k)

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

% Use a for-loop to create a window for scanning the image.
for i=(k+1):1:r-k
    for j=(k+1):1:c-k
        wp = I(i-k:i+k, j-k:j+k);
        Inew(i,j) = mean(wp(:));
    end
end

% Convert the box filtered image to unsigned 8-bit images and return the
% result.
output = uint8(Inew);

end
