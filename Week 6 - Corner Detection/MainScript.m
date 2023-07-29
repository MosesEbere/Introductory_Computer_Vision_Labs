%% Kanade-Tomasi Corner Detection
% Read the image to be preprocessed
a = imread('blocks.png');
a1 = imread('ct.png');
a2 = imread('Monastry.bmp');
% The threshold is a user-defined variable to obtain the corners. 
thr = 500000; th = 50000; th1 = 200000;

% We call the Kanade-Tomasi function and obtain a smoothed image and a list
% of detected corners.
[x, pp] = lab4ktcorners_checker (a1, th1);
[x1, y1] = lab4ktcorners (a2, thr);
[x2,y2] = lab4ktcorners (a, th);

% We plot the detected corners on the smoothed image.
figure
subplot(1,3,1)
imshow(x)
hold on
plot(pp(:,2), pp(:,1), 'r*', 'Markersize', 1, 'Linewidth', 1)
title('Kanade-Tomasi Corner Detection')

subplot(1,3,2)
imshow(x1)
hold on
plot(y1(:,2), y1(:,1), 'r*', 'Markersize', 2, 'Linewidth', 1)
title('Kanade-Tomasi Corner Detection')

subplot(1,3,3)
imshow(x2)
hold on
plot(y2(:,2), y2(:,1), 'r*', 'Markersize', 2, 'Linewidth', 1)
title('Kanade-Tomasi Corner Detection')

%% Harris Corner Detection
% Read the image to be preprocessed
b = imread('blocks.png');
b1 = imread('Monastry.bmp');
% The threshold is a user-defined variable to obtain the corners.  
thr1 = 400000; thr2 = 40000;

% We call the Harris function and obtain a smoothed image and a list
% of detected corners.
[r, q] = lab4Harriscorners (b, thr2);
[r1, q1] = lab4Harriscorners (b1, thr1);

% We plot the detected corners on the smoothed image.
figure
subplot(1,2,1)
imshow(r1)
hold on
plot(q1(:,2), q1(:,1), 'r*', 'Markersize', 1, 'Linewidth', 1)
title('Harris Corner Detection')

subplot(1,2,2)
imshow(r)
hold on
plot(q(:,2), q(:,1), 'r*', 'Markersize', 1, 'Linewidth', 1)
title('Harris Corner Detection')

%% %% Harris Corner Detection using the Measure of Corner Response
% Read the image to be preprocessed
c = imread('blocks.png');
c1 = imread('Monastry.bmp');
% The threshold is a user-defined variable to obtain the corners. 
thr3 = 4e+11; thr4 = 4e+9;

% We call the Harris function and obtain a smoothed image and a list
% of detected corners.
[m, n] = lab4Harris_R_corners (c, thr4);
[m1, n1] = lab4Harris_R_corners (c1, thr3);

% We plot the detected corners on the smoothed image.
figure
subplot(2,2,1)
imshow(m1)
hold on
plot(n1(:,2), n1(:,1), 'r*', 'Markersize', 1, 'Linewidth', 1)
title(['Harris Corner Detection using R, Threshold = ', num2str(thr3)])

subplot(2,2,2)
imshow(m)
hold on
plot(n(:,2), n(:,1), 'r*', 'Markersize', 1, 'Linewidth', 1)
title(['Harris Corner Detection using R, Threshold = ', num2str(thr4)])

subplot(2,2,3)
imshow(c1)
title('Original Image')

subplot(2,2,4)
imshow(c)
title('Original Image')

%% %% Comparison of Kanade-Tomasi and Harris
% Read the image to be preprocessed
c = imread('blocks.png');
c1 = imread('Monastry.bmp');
% The threshold is a user-defined variable to obtain the corners. 
thr5 = 6e+4; thr6 = 6e+4;

% We call the corner detection function and obtain a smoothed image and a list
% of detected corners.
[m2, n2] = lab4ktcorners (c, thr5);
[m3, n3] = lab4Harriscorners (c, thr6);

% We plot the detected corners on the smoothed image.
figure
subplot(1,2,1)
imshow(m3)
hold on
plot(n3(:,2), n3(:,1), 'r*')
title(['Harris Corner Detection, Threshold = ', num2str(thr6)])

subplot(1,2,2)
imshow(m2)
hold on
plot(n2(:,2), n2(:,1), 'r*')
title(['Kanade-Tomasi Corner Detection, Threshold = ', num2str(thr5)])

%% %% Comparison of Kanade-Tomasi and the two Harris Operators
% Read the image to be preprocessed
c = imread('blocks.png');
c1 = imread('Monastry.bmp');
% The threshold is a user-defined variable to obtain the edges. 
thr7 = 7.5e+4; thr8 = 5.5e+4; thr9 = 9e+9;

% We call the corner detection function and obtain a smoothed image and a list
% of detected corners.
[m5, n5] = lab4ktcorners (c, thr7);
[m6, n6] = lab4Harriscorners (c, thr8);
[m7, n7] = lab4Harris_R_corners (c, thr9);

% We plot the detected corners on the smoothed image.
figure
subplot(1,3,1)
imshow(m6)
hold on
plot(n6(:,2), n6(:,1), 'r*')
title(['Harris Corner Detection, Threshold = ', num2str(thr8)])

subplot(1,3,2)
imshow(m5)
hold on
plot(n5(:,2), n5(:,1), 'r*')
title(['Kanade-Tomasi Corner Detection, Threshold = ', num2str(thr7)])

subplot(1,3,3)
imshow(m7)
hold on
plot(n7(:,2), n7(:,1), 'r*')
title(['Harris using R, Threshold = ', num2str(thr9)])

%% Kanade-Tomasi Corner Detection for multiple results
% Read the image to be preprocessed
a = imread('er.jpg');
a1 = imread('lon.jpg');
a2 = imread('y.jpg');
% The threshold is a user-defined variable to obtain the corners. 
thr = 1000000; th = 900000; th1 = 700000;

% We call the Kanade-Tomasi function and obtain a smoothed image and a list
% of detected corners.
[x, pp] = lab4ktcorners_checker (a1, th1);
[x1, y1] = lab4ktcorners (a2, thr);
[x2,y2] = lab4ktcorners (a, th);

% We plot the detected corners on the smoothed image.
figure
subplot(1,3,1)
imshow(x)
hold on
plot(pp(:,2), pp(:,1), 'r*', 'Markersize', 1, 'Linewidth', 1)
title('Kanade-Tomasi Corner Detection')

subplot(1,3,2)
imshow(x1)
hold on
plot(y1(:,2), y1(:,1), 'r*', 'Markersize', 2, 'Linewidth', 1)
title('Kanade-Tomasi Corner Detection')

subplot(1,3,3)
imshow(x2)
hold on
plot(y2(:,2), y2(:,1), 'r*', 'Markersize', 2, 'Linewidth', 1)
title('Kanade-Tomasi Corner Detection')

%% %% Harris Corner Detection for multiple results
% Read the image to be preprocessed
b4 = imread('ct.png');
b5 = imread('b.png');
% The threshold is a user-defined variable to obtain the corners.  
thr0 = 300000; thr01 = 200000;

% We call the Harris function and obtain a smoothed image and a list
% of detected corners.
[r4, q4] = lab4Harriscorners (b4, thr01);
[r5, q5] = lab4Harriscorners (b5, thr0);

% We plot the detected corners on the smoothed image.
figure
subplot(1,2,1)
imshow(r5)
hold on
plot(q5(:,2), q5(:,1), 'r*')
title('Harris Corner Detection')

subplot(1,2,2)
imshow(r4)
hold on
plot(q4(:,2), q4(:,1), 'r*')
title('Harris Corner Detection')