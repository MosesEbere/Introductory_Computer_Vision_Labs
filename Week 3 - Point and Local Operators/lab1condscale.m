function [output] = lab1condscale(j, i)

[row, col, ch] = size(i);
Card = row*col;

if (ch == 3)
    i = rgb2gray(i);
end

[row, col, ch] = size(j);
Card = row*col;

if (ch == 3)
    j = rgb2gray(j);
end

j = double(j);
i = double(i);

mi = mean(i(:));
mj = mean(j(:));
si = std(i(:));
sj = std(j(:));

a = (mi*(sj/si)) - mj;

b = si/sj;

j_new = b*(j + a);

j_new = uint8(j_new);

output = j_new;