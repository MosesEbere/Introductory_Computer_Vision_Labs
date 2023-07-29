function [output1, output2, output3, output4] = lab3ZeroCrossing(img)

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

% Threshold
t = 0.5 * mean(abs(img(:)));

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
IZC = zeros(r, c);

% Use nested for-loops to create a window for scanning the image.
for i=(k+1):1:r-k
    for j=(k+1):1:c-k
        %the window will go from -k to +k
        wp = I(i-k:i+k, j-k:j+k);
        % Perform convolution using the previously created masks. 
        ILoG(i,j) = sum(wp(:).*LoG_filt(:));
    end
end

% Now, we find the zero crossings.
for i= 2:r-1
    for j = 2:c-1
        if ILoG(i,j)>0
            if ((ILoG(i,j+1) >= 0 && ILoG(i,j-1) < 0) || (ILoG(i,j+1) < 0 &&...
                    ILoG(i,j-1) >= 0)) && abs(ILoG(i,j+1) - ILoG(i,j-1)) > t
                IZC(i,j) = ILoG(i,j+1);
            elseif ((ILoG(i+1,j) >= 0 && ILoG(i-1,j) < 0) || (ILoG(i+1,j) < 0 &&...
                    ILoG(i-1,j) >= 0)) && abs(ILoG(i+1,j) - ILoG(i-1,j)) > t
                IZC(i,j) = I(i,j+1);
            elseif ((ILoG(i+1,j+1) >= 0 && ILoG(i-1,j-1) < 0) || (ILoG(i+1,j+1) < 0 &&...
                    ILoG(i-1,j-1) >= 0)) && abs(ILoG(i+1,j+1) - ILoG(i-1,j-1)) > t
                IZC(i,j) = ILoG(i,j+1);
            elseif ((ILoG(i-1,j+1) >= 0 && ILoG(i+1,j-1) < 0) || (ILoG(i-1,j+1) < 0 &&...
                    ILoG(i+1,j-1) >= 0)) && abs(ILoG(i+1,j-1) - ILoG(i-1,j-1)) > t
                IZC(i,j) = ILoG(i,j+1);
            end
        end
    end
end

% Convert the LoG filtered image to an unsigned 8-bit image, but retain the
output1 = uint8(ILoG);
output2 = uint8(IZC);
output3 = ILoG;
output4 = IZC;
end