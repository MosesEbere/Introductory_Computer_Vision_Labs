%% Prewitt Filter
% Read the image to be preprocessed
a = imread('peppers.png');
% The threshold is a user-defined variable to obtain the edges. 
thr = 150;

% We call the prewitt filter function. y represents the Sobel Y-filtered
% image, x - Sobel X-fitered image, gr - Sobel Gradient, and ed - Sobel
% Edge
[y, x, gr, ed] = lab3prewitt (a, thr);

%The original image,the Prewitt X & Y filtered images, the Prewitt Gradient,
%and the Prewitt Edges are displayed. 
figure
subplot(2, 3, 1)
imshow(a)
title('Original Image')

subplot(2, 3, 2)
imshow(x)
title('Prewitt X Filtered Image');

subplot(2, 3, 3)
imshow(y)
title('Prewitt Y Filtered Image');

subplot(2, 3, 5)
imshow(gr)
title('Prewitt Gradient')

subplot(2, 3, 6)
imshow(ed)
title('Prewitt Edges')

%% Sobel Filter
% Read the image to be preprocessed
b = imread('peppers.png');
% The threshold is a user-defined variable to obtain the edges. 
th1 = 150;

% We call the Sobel filter function. y1 represents the Sobel Y-filtered
% image, x1 - Sobel X-fitered image, gr1 - Sobel Gradient, and ed1 - Sobel
% Edge
[y1, x1, gr1, ed1] = lab3sobel(b, th1);

%The original image,the Sobel X & Y filtered images, the Sobel Gradient,
%and the Sobel Edges are displayed. 
figure
subplot(2, 3, 1)
imshow(b)
title('Original Image')

subplot(2, 3, 2)
imshow(x1)
title('Sobel X Filtered Image');

subplot(2, 3, 3)
imshow(y1)
title('Sobel Y Filtered Image');

subplot(2, 3, 5)
imshow(gr1)
title('Sobel Gradient')

subplot(2, 3, 6)
imshow(ed1)
title('Sobel Edges')

%% Laplacian of Gaussian
% Read the image to be preprocessed
c = imread('Object_contours.jpg');

% We call the LoG function. v represents the LoG filtered image, while g
% represents the gradient profile.
[v, g] = lab3log(c);

%The original image, the LoG filtered image, and a gradient profile are
%displayed. 
figure
subplot(1, 3, 1)
imshow(c)
title('Original Image')

subplot(1, 3, 2)
imshow(v)
title('LOG Filtered Image')

subplot(1, 3, 3)
plot(30:1:60, g(:, 30:1:60), 'LineWidth', 2)
title('Gradient Profile'); xlabel('Pixel Location'); ylabel('Gradient Magnitude');

%% Compare Prewitt and Sobel Filter
% Read the image to be preprocessed
h = imread('peppers.png');
% The threshold is a user-defined variable to obtain the edges. 
th2 = 150;

% We call the Sobel filter function. y1 represents the Sobel Y-filtered
% image, x1 - Sobel X-fitered image, gr1 - Sobel Gradient, and ed1 - Sobel
% Edge
[y2, x2, gr2, ed2] = lab3sobel(h, th2);
[y3, x3, gr3, ed3] = lab3prewitt (h, th2);

%The original image,the Sobel X & Y filtered images, the Sobel Gradient,
%and the Sobel Edges are displayed. 
figure
subplot(3, 3, 1)
imshow(h)
title('Original Image')

subplot(3, 3, 2)
imshow(x2)
title('Sobel X Filtered Image');

subplot(3, 3, 3)
imshow(x3)
title('Prewitt X Filtered Image');

subplot(3, 3, 4)
imshow(y2)
title('Sobel Y Filtered Image');

subplot(3, 3, 5)
imshow(y3)
title('Prewitt Y Filtered Image');

subplot(3, 3, 6)
imshow(gr2)
title('Sobel Gradient')

subplot(3, 3, 9)
imshow(gr3)
title('Prewitt Gradient')

subplot(3, 3, 7)
imshow(ed2)
title('Sobel Edges')

subplot(3, 3, 8)
imshow(ed3)
title('Prewitt Edges')

%% Zero Crossing
% Read the image to be preprocessed
pp = imread('Object_contours.jpg');

% We call the LoG function. E represents the LoG filtered image, while F
% represents the gradient profile. G and H are the same as E and F but in
% double format. 
[E, F, G, H] = lab3ZeroCrossing(pp);

%The original image, the LoG filtered image, and the zero crossing are
%displayed. 
figure
subplot(2, 3, 1)
imshow(pp)
title('Original Image')

subplot(2, 3, 2)
imshow(E)
title('LOG Filtered Image')

subplot(2, 3, 3)
imshow(F)
title('Zero Crossing');

subplot(2, 3, 5)
imshow(G)
title('LOG Filtered Image - in Double Format')

subplot(2, 3, 6)
imshow(H)
title('Zero Crossing - in Double Format');
