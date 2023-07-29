function [output] = lab2sigmafilt1(img, sig, k)
    
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

% Initialize the variables to be used for the sigma equation. 
denom = 0;
kipp = 0;
mult = 0;
ad = 0;

% To ensure that we don't end up with an image of a different size relative
% to the original image, we initialize our final image with the same number of rows
% and columns as the original one. 
Inew = zeros(r, c);

% Use nested for-loops to create a window for scanning the image.
for i = (k+1):1:(r-k)
    for j = (k+1):1:(c-k)
        %the window will go from -k to +k
        wp = I(i-k:i+k, j-k:j+k);
        % Obtain the intensity of the central pixel, and create the upper
        % and lower limits for the sigma function. 
        w = wp((1+k), (1+k));
        low = w - sig;
        high = w + sig;
        
        % Use a for-loop to scan the window for pixels values within the
        % limits.
        for range = low :1: high
            % Use a find function to locate pixels of the same
            % intensity.
            kip = find(wp==range);
            % Use the size function to count the pixels found above
            % (this serves as a histogram function).
            kipp = size(kip);
            % Obtain the u.H(u)
            mult = kipp(1)*range;
            % Take the summation of the above
            ad = ad + mult;
            % This is for the denominator of the sigma equation, S.
            denom = denom + kipp(1);                
        end
     Inew(i,j) = ad/denom;
     
    % It's important to return the sigma equation parameters to zero
    % before the next iteration. This helps us avoid producing a really
    % awkward image. 
    denom = 0; kip = 0; kipp = 0; mult = 0; ad = 0;
    end
end
    
% Convert the resulting image to unsigned 8-bit image and return the
% result.
output = uint8(Inew);
end