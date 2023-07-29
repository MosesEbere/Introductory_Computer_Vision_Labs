clc; clear all;
%histogram equalization
img = imread('Blur.jfif');

%img1 = rgb2gray(img);

%the histogram of the original image
imhist(img);

%applying histogram equalization on the city.png
img2 = histeq(img);

%the histogram of the new image (equalized)

figure
subplot(2, 2, 1)
imshow(img)
title('Original Image')

subplot(2, 2, 2)
imshow(img2)
title('Histogram Equalized image')

subplot(2, 2, 3)
imhist(img)
title('Histogram of the Original Image')

subplot(2, 2, 4)
imhist(img2)
title('New Histogram')

%% Linear Scaling

a = imread('nob.png');

res = lab1linscale(a);

figure
subplot(2, 2, 1)
imshow(a)
title('Original Image');

subplot(2, 2, 2)
imshow(res)
title('Linearly Scaled image');

subplot(2, 2, 3)
imhist(a);
title(['Histogram of the Original Image Umin = ', num2str(min(a(:))),' and Umax = ', num2str(max(a(:)))]);

subplot(2, 2, 4)
imhist(res);
title(['Histogram of the Linearly Scaled Image Umin = ', num2str(min(res(:))),' and Umax = ', num2str(max(res(:)))]);

%% Conditional Scaling

b = imread('mona.jpg');
c = imread('nob.png');

re = lab1condscale(b, c);

p = rgb2gray(c);

figure
subplot(2, 2, [1,2])
imshow(p)
title('Reference Image')
xlabel({['\mu = ', num2str(mean(p(:)))], ['\sigma = ', num2str(std(double(p(:))))]})

subplot(2, 2, 3)
imshow(b)
title('Current image');
xlabel({['\mu = ', num2str(mean(b(:)))], ['\sigma = ', num2str(std(double(b(:))))]})

subplot(2, 2, 4)
imshow(re)
title('Resulting Image')
xlabel({['\mu = ', num2str(mean(re(:)))], ['\sigma = ', num2str(std(double(re(:))))]})

%% Local Mean Filter

% Read the image to be preprocessed
d = imread('jump.png');
e = 10;

% This syntax calls the box filter function
r = lab1locbox(d, e);

%The original image and the box filtered image are displayed.
figure
subplot(2, 1, 1)
imshow(d)
title('Original Image')

subplot(2, 1, 2)
imshow(r)
title(['Box Filtered image, k = ', num2str(e)])

%% Local Max and Min

f = imread('currentimage.png');
g = 0;

[resu, sur] = lab1locmaxmin(f, g);

%The original image and the local max & local min filtered images are displayed.
figure
subplot(1, 3, 1)
imshow(f)
title('Original Image')

subplot(1, 3, 2)
imshow(resu)
title(['Local Max Filtered image, k = ', num2str(g)])

subplot(1, 3, 3)
imshow(sur)
title(['Local Min Filtered image, k = ', num2str(g)])