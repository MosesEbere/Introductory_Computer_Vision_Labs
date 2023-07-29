function [output1, output2, output3, output4] = lab3sobel(img, t1)

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
x_filt = [-1 0 1; -2 0 2; -1 0 1];
y_filt = [-1 -2 -1; 0 0 0; 1 2 1];

% The sobel filter has a size (2k+1)x(2k+1), where k = 1;
k = 1;

% To ensure that we don't end up with images of different sizes relative
% to the original images, we initialize our final images with the same number of rows
% and columns as the original ones. 
Ihor = zeros(r, c);
Iver = zeros(r, c);
Igrad = zeros(r, c);
Iedge = zeros(r, c);

% Use nested for-loops to create a window for scanning the image.
for i=(k+1):1:r-k
    for j=(k+1):1:c-k
        %the window will go from -k to +k
        wp = I(i-k:i+k, j-k:j+k);
        % Perform convolution using the previously created masks. 
        Iver(i,j) = sum(wp(:).*x_filt(:));
        Ihor(i,j) = sum(wp(:).*y_filt(:));
        Igrad(i,j) = sqrt((Iver(i,j)^2 + Ihor(i,j)^2));
        
        Iedge(i,j) = Igrad(i,j);
        % Use the threshold to determine which pixels qualify as edges.
        if Iedge(i,j) >= t1
            Iedge(i,j) = 255;
        else
            Iedge(i,j) = 0;
        end
    end
end

% Convert the resulting images to unsigned 8-bit images and return the
% results.
output1 = uint8(Ihor);
output2 = uint8(Iver);
output3 = uint8(Igrad);
output4 = uint8(Iedge);

end