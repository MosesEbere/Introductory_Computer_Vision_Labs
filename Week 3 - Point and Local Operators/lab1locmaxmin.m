function [output1,output2] = lab1locmaxmin(img, k)

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
%the window must be created wrt the reference point which will be (k+1)
%pixels away from the top or left and it will go up to k pixels less than
%the column or row. 
for i=(k+1):1:r-k
    for j=(k+1):1:c-k
        %the window will go from -k to +k
        wp = I(i-k:i+k, j-k:j+k);
        Imax(i,j) = max(wp(:));
        Imin(i,j) = min(wp(:));
    end
end

% Convert the resulting images to unsigned 8-bit images and return the
% results.
output1 = uint8(Imax);
output2 = uint8(Imin);

end
