%% Line Detection
% Read the image to be preprocessed
a = imread('checker.jpg');

% Call the Hough Transform Function for Lines.
lab5houghlines (a);

%% Circle Detection
% Read the image to be preprocessed
b = imread('circlesBrightDark.png');

% Call the Hough Transform Function for Circles.
lab5houghcircles (b);

