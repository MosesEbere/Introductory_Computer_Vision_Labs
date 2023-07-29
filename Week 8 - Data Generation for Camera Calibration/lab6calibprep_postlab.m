clear all; close all; clc;

% Read the image to be preprocessed
im = imread('3D_Calibration_Object.jpg');

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
subplot(1,2,1)
imshow(im)
title('Original Image')

subplot(1,2,2)
imshow(img), hold on
title('Extracted Lines Using Hough Transform')

for k = 1:length(lines)
    % Obtain the endpoints of each line found earlier. 
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',1,'Color','green');
      
   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',1,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',1,'Color','red');
   
   % Obtain rho and theta for the two intersecting lines
   % First intersection
   if xy(1) == 863 && xy(3) == 1642 && xy(2) == 1472 && xy(4) == 1739
       k1 = k;
   elseif xy(1) == 1357 && xy(3) == 1638 && xy(2) == 1204 && xy(4) == 2037
       k2 = k;
   end
   if xy(1) == 880 && xy(3) == 1498 && xy(2) == 1380 && xy(4) == 1568
       k3 = k;
   elseif xy(1) == 1147 && xy(3) == 1300 && xy(2) == 954 && xy(4) == 1714
       k4 = k;
   end
   if xy(1) == 1386 && xy(3) == 1891 && xy(2) == 1845 && xy(4) == 1972
       k5 = k;
   elseif xy(1) == 1822 && xy(3) == 1325 && xy(2) == 1626 && xy(4) == 2008
       k6 = k;
   end
   if xy(1) == 1086 && xy(3) == 760 && xy(2) == 1513 && xy(4) == 804
       k7 = k;
   elseif xy(1) == 1116 && xy(3) == 712 && xy(2) == 1146 && xy(4) == 846
       k8 = k;
   end
   if xy(1) == 700 && xy(3) == 430 && xy(2) == 803 && xy(4) == 439
       k9 = k;
   elseif xy(1) == 679 && xy(3) == 329 && xy(2) == 723 && xy(4) == 476
       k10 = k;
   end
   if xy(1) == 1279 && xy(3) == 1412 && xy(2) == 1861 && xy(4) == 1493
       k11 = k;
   elseif xy(1) == 1822 && xy(3) == 1325 && xy(2) == 1626 && xy(4) == 2008
       k12 = k;
   end
   if xy(1) == 1080 && xy(3) == 1837 && xy(2) == 1200 && xy(4) == 1858
       k13 = k;
   elseif xy(1) == 1129 && xy(3) == 1739 && xy(2) == 1025 && xy(4) == 1984
       k14 = k;
   end
   if xy(1) == 1153 && xy(3) == 900 && xy(2) == 1563 && xy(4) == 943
       k15 = k;       
   elseif xy(1) == 1150 && xy(3) == 863 && xy(2) == 1199 && xy(4) == 1072
       k16 = k;
   end
end

% Parameters for the 16 Lines
rho1 = lines(k1).rho; theta1 = lines(k1).theta*pi/180; % Line 1
rho2 = lines(k2).rho; theta2 = lines(k2).theta*pi/180; % Line 2
rho3 = lines(k3).rho; theta3 = lines(k3).theta*pi/180; % Line 3
rho4 = lines(k4).rho; theta4 = lines(k4).theta*pi/180; % Line 4
rho5 = lines(k5).rho; theta5 = lines(k5).theta*pi/180; % Line 5
rho6 = lines(k6).rho; theta6 = lines(k6).theta*pi/180; % Line 6
rho7 = lines(k7).rho; theta7 = lines(k7).theta*pi/180; % Line 7
rho8 = lines(k8).rho; theta8 = lines(k8).theta*pi/180; % Line 8
rho9 = lines(k9).rho; theta9 = lines(k9).theta*pi/180; % Line 9
rho10 = lines(k10).rho; theta10 = lines(k10).theta*pi/180; % Line 10
rho11 = lines(k11).rho; theta11 = lines(k11).theta*pi/180; % Line 11
rho12 = lines(k12).rho; theta12 = lines(k12).theta*pi/180; % Line 12
rho13 = lines(k13).rho; theta13 = lines(k13).theta*pi/180; % Line 13
rho14 = lines(k14).rho; theta14 = lines(k14).theta*pi/180; % Line 14
rho15 = lines(k15).rho; theta15 = lines(k15).theta*pi/180; % Line 15
rho16 = lines(k16).rho; theta16 = lines(k16).theta*pi/180; % Line 16

% Define the equations of each pair of lines
x1 = 0:1:2505; 
y1 = (rho1 - x1*cos(theta1))/sin(theta1); y2 = (rho2 - x1*cos(theta2))/sin(theta2);
y3 = (rho3 - x1*cos(theta3))/sin(theta3); y4 = (rho4 - x1*cos(theta4))/sin(theta4);
y5 = (rho5 - x1*cos(theta5))/sin(theta5); y6 = (rho6 - x1*cos(theta6))/sin(theta6);
y7 = (rho7 - x1*cos(theta7))/sin(theta7); y8 = (rho8 - x1*cos(theta8))/sin(theta8);
y9 = (rho9 - x1*cos(theta9))/sin(theta9); y10 = (rho10 - x1*cos(theta10))/sin(theta10);
y11 = (rho11 - x1*cos(theta11))/sin(theta11); y12 = (rho12 - x1*cos(theta12))/sin(theta12);
y13 = (rho13 - x1*cos(theta13))/sin(theta13); y14 = (rho14 - x1*cos(theta14))/sin(theta14);
y15 = (rho15 - x1*cos(theta15))/sin(theta15); y16 = (rho16 - x1*cos(theta16))/sin(theta16);

figure %2
imshow(img), hold on
title('Harris Corners and Sub-pixel Accurate Corner')
plot(x1, y1,'LineWidth',1,'Color','magenta');
plot(x1, y2,'LineWidth',1,'Color','magenta');
plot(x1, y3,'LineWidth',1,'Color','magenta');
plot(x1, y4,'LineWidth',1,'Color','magenta');
plot(x1, y5,'LineWidth',1,'Color','magenta');
plot(x1, y6,'LineWidth',1,'Color','magenta');
plot(x1, y7,'LineWidth',1,'Color','magenta');
plot(x1, y8,'LineWidth',1,'Color','magenta');
plot(x1, y9,'LineWidth',1,'Color','magenta');
plot(x1, y10,'LineWidth',1,'Color','magenta');
plot(x1, y11,'LineWidth',1,'Color','magenta');
plot(x1, y12,'LineWidth',1,'Color','magenta');
plot(x1, y13,'LineWidth',1,'Color','magenta');
plot(x1, y14,'LineWidth',1,'Color','magenta');
plot(x1, y15,'LineWidth',1,'Color','magenta');
plot(x1, y16,'LineWidth',1,'Color','magenta');
% Find the intersection point of the two lines
intersection1 = [cos(theta1) sin(theta1); cos(theta2) sin(theta2)] \ [rho1; rho2];
intersection2 = [cos(theta3) sin(theta3); cos(theta4) sin(theta4)] \ [rho3; rho4];
intersection3 = [cos(theta5) sin(theta5); cos(theta6) sin(theta6)] \ [rho5; rho6];
intersection4 = [cos(theta7) sin(theta7); cos(theta8) sin(theta8)] \ [rho7; rho8];
intersection5 = [cos(theta9) sin(theta9); cos(theta10) sin(theta10)] \ [rho9; rho10];
intersection6 = [cos(theta11) sin(theta11); cos(theta12) sin(theta12)] \ [rho11; rho12];
intersection7 = [cos(theta13) sin(theta13); cos(theta14) sin(theta14)] \ [rho13; rho14];
intersection8 = [cos(theta15) sin(theta15); cos(theta16) sin(theta16)] \ [rho15; rho16];

% Plot the intersection point
plot(intersection1(1), intersection1(2), 'mo', 'LineWidth',2)
plot(intersection2(1), intersection2(2), 'mo', 'LineWidth',2)
plot(intersection3(1), intersection3(2), 'mo', 'LineWidth',2)
plot(intersection4(1), intersection4(2), 'mo', 'LineWidth',2)
plot(intersection5(1), intersection5(2), 'mo', 'LineWidth',2)
plot(intersection6(1), intersection6(2), 'mo', 'LineWidth',2)
plot(intersection7(1), intersection7(2), 'mo', 'LineWidth',2)
plot(intersection8(1), intersection8(2), 'mo', 'LineWidth',2)

% H = detectHarrisFeatures(I);
% plot(H.selectStrongest(100));

% Find the Harris corners
C_H = corner(I, 'Harris');
plot(C_H(:,1),C_H(:,2),'bo');

% Find the distance between the two points - Lines 13 and 14 were chosen.
% The real corner from inspection lies around (1085.5, 1837.5), while the
% Harris corner lies on (1086, 1838)
len = norm(intersection7 - [1085.5; 1837.5]);
len2 = norm([1086; 1838] - [1085.5; 1837.5]);

fprintf('The distance between the Hough corner and the real corner is %.4f.\n', len)
fprintf('The distance between the Harris corner and the real corner is %.4f.\n', len2)

toc
