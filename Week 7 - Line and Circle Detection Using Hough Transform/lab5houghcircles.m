function lab5houghcircles (im)
tic

% The row, column, and channels of the image are obtained along with the cardinality of the image. 
[r, c, ch] = size(im);
Card = r*c;

% This is added in case the image introduced is an RGB image. 
% It functions to convert it to a gray-scale image.
if ch == 3
    im = rgb2gray(im);
end

% Set the range of circle radii to be detected. 
Rmin = 20;
Rmax = 60;

% Find all the bright circles in the image within 20 <= raduis <= 60 pixels
[centersBright, radiiBright] = imfindcircles(im,[Rmin Rmax],'ObjectPolarity','bright');

% Sensitivity
s = 0.9;

% Plot the results
figure 
subplot(1,3,1)
imshow(im)
hold
viscircles(centersBright, radiiBright,'Color','b');
title({('Detected Circles Using Hough Transform'), [num2str(Rmin),...
    ' <= Radius <= ', num2str(Rmax)]})

subplot(1,3,2)
imshow(im)
hold
[centersBright1, radiiBright1]...
    = imfindcircles(im,[Rmin Rmax],'ObjectPolarity','bright', 'Sensitivity', s);
viscircles(centersBright1, radiiBright1,'Color','r');
title({('Detected Circles Using Hough Transform'), [num2str(Rmin),...
    ' <= Radius <= ', num2str(Rmax), ' & Sensitivity = ', num2str(s)]})

subplot(1,3,3)
imshow(im)
hold
[centersBright2, radiiBright2]...
    = imfindcircles(im,[Rmin Rmax],'ObjectPolarity','bright', 'Sensitivity', s);

% Find all the dark circles in the image within 20 <= raduis <= 60 pixels
[centersDark2, radiiDark2]...
    = imfindcircles(im,[Rmin Rmax],'ObjectPolarity','dark', 'Sensitivity', s);
viscircles(centersBright2, radiiBright2,'Color','b');
viscircles(centersDark2, radiiDark2,'LineStyle','--');
title({('Detected Bright and Circles'), [num2str(Rmin),...
    ' <= Radius <= ', num2str(Rmax), ' & Sensitivity = ', num2str(s)]})

toc
end