function lab5houghlines (im)
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
I = edge(img, 'zerocross');

% Find the space matrix, theta, and rho parameters.
[H,T,R] = hough(I);

% Threshold
t = 0.5*max(H(:));

% Find the peaks
P = houghpeaks(H, 20, 'threshold', t);

% Plot the results
figure %1
subplot(2,2,1);
imshow(im);
title('Original Image');

subplot(2,2,2)
imshow(I)
title('Edges')

subplot(2,2,3.5);
imshow(imadjust(rescale(H)),'XData',T,'YData',R,'InitialMagnification','fit');
title('Hough Transform');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;

figure %2
imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
plot(T(P(:,2)),R(P(:,1)),'s','color','white');
title('20 Peaks Hough Transform with Default Threshold (0.5 of Maximum Hough Points)')

% Extract the line segments based on Hough Transform
lines = houghlines(I,T,R,P,'FillGap',10,'MinLength',40);

% Plot the lines extracted and highlight the longest and shortest lines.
figure %3
imshow(img), hold on
max_len = 0;
min_len = 0;
for k = 1:length(lines)
    % Obtain the endpoints of each line found earlier. 
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',1,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',1,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',1,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if (len > max_len)
      max_len = len;
      xy_long = xy;
   end
   
   if(k==1)
       min_len = max_len;
   end
   % Use this to find the shortest line. 
   if (len <= min_len)
      min_len = len;
      xy_short = xy;
   end
end

% Highlight the longest and shortest lines. 
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','cyan');
plot(xy_short(:,1),xy_short(:,2),'LineWidth',2,'Color','red');
title('Found Longest and Shortest Lines, FillGap 10, MinLength 40')
xlabel(['Threshold = ', num2str(t)])

toc
end