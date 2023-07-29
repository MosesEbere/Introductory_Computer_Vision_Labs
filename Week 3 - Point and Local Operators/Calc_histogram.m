function [output] = Calc_histogram(q)

% The row, column, and channels of the image are obtained along with the cardinality of the image.
[r, c, ch] = size(q);
Card = r*c;

% Create a 256x1 matrix since we are dealing with gray scale image (8 bits)
% This will be used for the histogram H1(u)
H = ones(256,1);

for i=1:1:r
    for j=1:1:c
        % Initialize a new variable with the intensities at each pixel of
        % the image
        u = q(i,j);
        % Since the intensities of a gray scale image go from 0 to 255, it
        % will be help to increment each of the by 1 to enable us use the
        % indices of H directly
        H(u + 1)=H(u + 1) + 1;
    end
end

% Return the histogram array
output = H;
% Plot the histogram of the image
%bar(H);
end