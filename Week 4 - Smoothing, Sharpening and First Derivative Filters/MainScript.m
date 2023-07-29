clc; clear all;

%% Gauss Filter

a = imread('jump.png');

hs = lab2gaussfilt(a);

figure
subplot(1, 2, 1)
imshow(a)
title('Original Image');

subplot(1, 2, 2)
imshow(hs)
title('Gaussian Filtered Image');

%% Median Filter

b = imread('tiger.png');
rq = 5;

mr = lab2medfilt(b, rq);
mer = lab2gaussfilt(b);

figure
subplot(1, 3, 1)
imshow(b)
title('Original Image')

subplot(1, 3, 2)
imshow(mer)
title('Gaussian Filtered Image');

subplot(1, 3, 3)
imshow(mr)
title('Median Filtered Image')

%% Sharpening

% Read the image to be preprocessed
d = imread('mother.png');
% This is lambda which controls the influence of the correction signal.
l = 10;
% This integer is used to select the smoothing operation to be applied
m = 3;

% This syntax calls the Sharpening function
e = lab2sharpen(d, l, m);

%The original image and the sharpened image are displayed.
figure
subplot(1, 2, 1)
imshow(d)
title('Original Image')

subplot(1, 2, 2)
imshow(e)
title('Sharpened Image')

%% Sobel Filter

f = imread('house.png');

[hor, ver] = lab2sobelfilt(f);

%The original image and the Sobel filtered images are displayed.
figure
subplot(2, 2, [1, 2])
imshow(f)
title('Original Image')

subplot(2, 2, 3)
imshow(ver)
title('Sobel Vertical Filtered image')

subplot(2, 2, 4)
imshow(hor)
title('Sobel Horizontal Filtered Image')

%% Multiple Results1

g = imread('jump.png');

[hori, vert] = lab2sobelfilt(g);

%The original image and the Sobel filtered images are displayed.
figure
subplot(2, 2, [1, 2])
imshow(g)
title('Original Image')

subplot(2, 2, 3)
imshow(vert)
title('Sobel Vertical Filtered image')

subplot(2, 2, 4)
imshow(hori)
title('Sobel Horizontal Filtered Image')

%% Multiple Results2

% Read the image to be preprocessed
ur = imread('ball.jpg');
% This is lambda which controls the influence of the correction signal.
la = 1.5;
% This integer is used to select the smoothing operation to be applied
mq = 1;

% This syntax calls the Sharpening function
rq = lab2sharpen(ur, la, mq);

%The original image and the sharpened image are displayed.
figure
subplot(1, 2, 1)
imshow(ur)
title('Original Image')

subplot(1, 2, 2)
imshow(rq)
title('Sharpened Image')

%% Multiple Results3

p = imread('b.png');
rqq = 2;

rer = lab2medfilt(p, rqq);
remm = lab2gaussfilt(p);

figure
subplot(1, 3, 1)
imshow(p)
title('Original Image')

subplot(1, 3, 2)
imshow(remm)
title('Gaussian Filtered Image');

subplot(1, 3, 3)
imshow(rer)
title('Median Filtered Image')


%% % Gauss Filter2

h = imread('f.jpg');

sh = lab2gaussfilt(h);

figure
subplot(1, 2, 1)
imshow(h)
title('Original Image');

subplot(1, 2, 2)
imshow(sh)
title('Gaussian Filtered Image');

%% %% Comparing Median, Gauss, Box, and Sobel Filters

pp = imread('f.jpg');
rqr = 2;

prp = lab2medfilt(pp, rqr);
pop = lab2gaussfilt(pp);
po = lab1locbox(pp, rqr);
%op = lab2sigmafilt(pp, rqr);
[horiz, verti] = lab2sobelfilt(pp);

figure
subplot(3, 2, 1)
imshow(pp)
title('Original Image')

subplot(3, 2, 2)
imshow(po)
title('Box Filtered Image');

subplot(3, 2, 3)
imshow(pop)
title('Gaussian Filtered Image');

subplot(3, 2, 4)
imshow(prp)
title('Median Filtered Image')

subplot(3, 2, 5)
imshow(verti)
title('Sobel Vertical Filtered image')

subplot(3, 2, 6)
imshow(horiz)
title('Sobel Horizontal Filtered Image')

%% Sigma Filter

p = imread('mona.jpg');
rq = 2;
sigm = 30;

re = lab2medfilt(p, rq);
rem = lab2gaussfilt(p);
reme = lab1locbox(p, rq);
remem = lab2sigmafilt1(p, sigm, rq);

figure
subplot(3, 2, 1)
imshow(p)
title('Original Image')

subplot(3, 2, 2)
imshow(reme)
title(['Box Filtered Image, k = ', num2str(rq)]);

subplot(3, 2, 3)
imshow(rem)
title('Gaussian Filtered Image');

subplot(3, 2, 4)
imshow(re)
title(['Median Filtered Image, k = ', num2str(rq)])

subplot(3, 2, [5, 6])
imshow(remem)
title(['Sigma Filtered Image, Sigma = ', num2str(sigm), ', k = ', num2str(rq)])

%% %% Sigma Filter

rp = imread('tiger.png');
k_ = 3;
sigm = 30;

sigfil = lab2sigmafilt1(rp, sigm, k_);

figure
subplot(1, 2, 1)
imshow(rp)
title('Original Image')

subplot(1, 2, 2)
imshow(sigfil)
title(['Sigma Filtered Image, Sigma = ', num2str(sigm), ', k = ', num2str(k_)])
