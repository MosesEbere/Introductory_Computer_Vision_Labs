function [output] = Neg(img)

[ro, co, ch] = size(img);
Card = ro*co;

% Find the number of gray levels
L = 2 ^ 8;

% Find the General Maximum Image Value
Gmax = L - 1;

% Create the negative image
Nimg = Gmax - img;

figure
subplot(1,2,1)
imshow(img)
title('Original Image')

subplot(1,2,2)
imshow(Nimg)
title('Negative Image')

output = Nimg;
end