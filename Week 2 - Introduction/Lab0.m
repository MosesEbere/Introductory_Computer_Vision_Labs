% %imwrite (img, 'board.jpg');
% 
% Im = imread('board.jpg');
% 
% % general notation (rows, columns, channels)
% 
% %Now, let's try to isolate the different channels. 
% 
% % redChannel = Im(:, :, 1);
% % greenChannel = Im(:, :, 2);
% % blueChannel = Im(:, :, 3);
% % 
% % figure
% % subplot(2,2,1)
% % imshow (Im)
% % title('Original RGB Image')
% % 
% % subplot(2,2,2)
% % imshow (redChannel)
% % title('Red Channel')
% % 
% % subplot(2,2,3)
% % imshow (greenChannel)
% % title('Original RGB Image')
% % 
% % subplot(2,2,4)
% % imshow (blueChannel)
% % title('Original RGB Image')
% 
% Im2 = rgb2gray(Im);
% figure
% subplot(1,2,1)
% imshow(Im)
% title('Original RGB Image')
% subplot(1,2,2)
% imshow(Im2)
% title('Grayscale Image')



%Image Cropping

Im = imread('blocks.png');
% method 1

crop1 = Im(100:150, 50:200) % Im(y1:y2, x1:x2)
%Note: this indexing method only crops from the first channel. 

figure
subplot(1, 2, 1)
imshow(Im);

subplot(1, 2, 2)
imshow(crop1)

%method 2
crop2 = imcrop(Im, [50 100 150 50]) % [x1 y1 width height]

figure (2)
subplot(1, 2, 1)
imshow(Im);

subplot(1, 2, 2)
imshow(crop2)