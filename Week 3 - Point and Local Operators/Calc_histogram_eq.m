function [output] = Calc_histogram_eq(q)
 
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
 

% To write some code for the histogram equalization, we need to obtain the
% parameters in our gradation function, g(u) = c1(u).Gmax; where c1(u) is
% our relative cumulative histogram, i.e. summation of h1(u). And h1(u) =
% H1(u)/cardinality

%Let's find h1(u)
h1 = H./Card;

%Create variables for c1 and the gradation function g(u)
c1 = zeros(256,1);
g_u = zeros(256,1);
sum = 0;

% Use a for-loop to find the relative cumulative histogram
for i=1:1:256
    sum = sum+H(i);
    c1(i) = sum/Card;
    g_u(i) = round(c1(i)*255);
end

% Now, for the histogram equalization, we can make use of the gradation
% function, g_u, above.

histogram_eq = uint8(zeros(r,c));
for i=1:1:r
    for j=1:1:c
        histogram_eq(i,j) = g_u(q(i,j)+1);
    end
end

% Return the histogram equalized image
output = histogram_eq;

end
