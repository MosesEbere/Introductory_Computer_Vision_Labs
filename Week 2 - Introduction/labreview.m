img = imread('shot.jpg');

img1 = rgb2gray(img);

figure
subplot(1, 2, 1)
imshow(img)
title('Original color image!')

subplot(1, 2, 2)
imshow(img1)
title('Gray image')

[row, col, ch] = size(img);

% Extract the red, green, blue images separately

redCh = img(:,:,1);
greenCh = img(:,:,2);
blueCh = img(:,:,3);
% checkCh = img(:,:,4)

figure(2)
subplot(3, 2, 1)
imshow(img)
title('Original image')

subplot(3, 2, 2)
imshow(redCh)
title('Red image')

subplot(3, 2, 3)
imshow(greenCh)
title('Green image')

subplot(3, 2, 4)
imshow(blueCh)
title('Blue image')

% subplot(3, 2, 5)
% imshow(checkCh)
% title('Check image')

% Find the negative of the original image

