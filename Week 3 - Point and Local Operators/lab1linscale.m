function [output] = lab1linscale(img)

[row, col, ch] = size(img);
Card = row*col;

if (ch == 3)
    img = rgb2gray(img);
end

%convert the image to double before performing any mathematical operations
img = double(img);

%find the max and min intensities
umax = max(img(:));
umin = min(img(:));

Gmax = 255;
a = -(umin);

b = Gmax / (umax - umin);

img_new = b*(img +a);

img_new = uint8(img_new);

output = img_new;

end