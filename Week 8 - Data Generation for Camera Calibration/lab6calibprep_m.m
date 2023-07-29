clear all; close all; clc;

% Read the image to be preprocessed
im = imread('b.jpg');

tic 
% The row, column, and channels of the image are obtained along with the cardinality of the image. 
[r, c, ch] = size(im);
Card = r*c;

img = im;

% This is added in case the image introduced is an RGB image. 
% It functions to convert it to a gray-scale image.
if ch == 3
    img = rgb2gray(img);
end

% Create a Black-white Edge Image
I = edge(img, 'log');

% Find the space matrix, theta, and rho parameters.
[H,T,R] = hough(I);

% Threshold
t = 0.5*max(H(:));

% Find the peaks
P = houghpeaks(H, 20, 'threshold', t);

% Extract the line segments based on Hough Transform
lines = houghlines(I,T,R,P,'FillGap',10,'MinLength',40);

figure %1
subplot(2,2,1)
imshow(im)
title('Original Image')

subplot(2,2,2)
% figure
imshow(img), hold on
title('Extracted Lines Using Hough Transform')

for k = 1:length(lines)
    % Obtain the endpoints of each line found earlier. 
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',1,'Color','green');
      
   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',1,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',1,'Color','red');
   
   % r = lines(k).theta
   %a = xy(1), b = xy(2), c = xy(3), d = xy(4)
   
   if xy(1) == 353 && xy(3) == 1113 && xy(2) == 323 && xy(4) == 1255
       k1 = k;
       rho1 = lines(k).rho;
       theta1 = lines(k).theta*pi/180;
   end
   
   if xy(1) == 35 && xy(3) == 1169 && xy(2) == 378 && xy(4) == 1169
       k2 = k;
       rho2 = lines(k).rho;
       theta2 = lines(k).theta*pi/180;
   end

end

x1 = 0:1:1600;
y1 = (rho1 - x1*cos(theta1))/sin(theta1);

x2 = 0:1:1600;
y2 = (rho2 - x2*cos(theta2))/sin(theta2);

subplot(2,2, [3,4])
%figure
imshow(img), hold on
title('Harris Corners and Sub-pixel Accurate Corner')
plot(x1, y1,'LineWidth',1,'Color','magenta');
plot(x2, y2,'LineWidth',1,'Color','magenta');

% Find the intersection point of the two lines
intersection = [cos(theta1) sin(theta1); cos(theta2) sin(theta2)] \ [rho1; rho2];
% Plot the intersection point
plot(intersection(1), intersection(2), 'mo')

% H = detectHarrisFeatures(I);
% plot(H.selectStrongest(100));

% Find the Harris corners
C_H = corner(I, 'Harris');
plot(C_H(:,1),C_H(:,2),'bo');

% Find the distance between the two points
len = norm(intersection - [145.5; 170.5]);
len2 = norm([146; 170] - [145.5; 170.5]);

fprintf('The distance between the Hough corner and the real corner is %.4f.\n', len)
fprintf('The distance between the Harris corner and the real corner is %.4f.\n', len2)

toc
