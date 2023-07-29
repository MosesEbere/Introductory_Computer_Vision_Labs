function [output] = lab2medfilt(img, k)

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

% To ensure that we don't end up with an image of a different size relative
% to the original image, we initialize our final image with the same number of rows
% and columns as the original one. 
Inew = zeros(r, c);

% Use nested for-loops to create a window for scanning the image.
for i=(k+1):1:r-k
    for j=(k+1):1:c-k
        %the window will go from -k to +k
        wp = I(i-k:i+k, j-k:j+k);
        % Obtain the parameters (number of rows and columns of the window
        % and its cardinality).
        [ro, co] = size(wp);
        w_card = ro*co;
        % We'll need to sort the intensities in ascending or descending
        % order, so it's imperative that we create a row vector to make the
        % sorting process straightforward. 
        d = reshape(wp, [1, w_card]);
        sorted = sort(d);
        % The following is used to obtain the index of the median
        % intensity.
        ind = (w_card + 1)/2;
        med = sorted(ind);
        % Replace the intensity at the window's reference point with the
        % above median.
        Inew(i,j) = med;
    end
end

% Convert the resulting image to unsigned 8-bit image and return the
% result.
output = uint8(Inew);
end