function [output] = Calc_hist(q)

% The row, column, and channels of the image are obtained along with the cardinality of the image.
[r, c, ch] = size(q);
Card = r*c;

% Create a 256x1 matrix since we are dealing with gray scale image (8 bits)
% This will be used for the histogram H1(u)
H = zeros(256,1);

q = double(q);

umin = 0;
umax = 255;
h = zeros(256, 1);

for a = umin : umax
    k = find(q==a);
    kk = size(k);
    h(a+1) = kk(1);
end

% Return the histogram array
output = h-1;
% Plot the histogram of the image
%bar(H);
end