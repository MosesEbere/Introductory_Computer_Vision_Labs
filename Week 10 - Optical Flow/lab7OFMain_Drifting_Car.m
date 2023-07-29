clear all; close all; clc;

% read in the video
v = VideoReader('e.mp4');
% Extract some frames for the optical flow calculation.
frames = read(v,[5 20]);

Seq = frames;

% The 'num' variable corresponds to the frame number. 
[row,col,num]=size(Seq);

% Define k (window size) and Threshold
k = 3;
Threshold = 9000;

for j=2:1:num
    ImPrev = Seq(:,:,j-1);
    ImCurr = Seq(:,:,j);
    h = lab7OF_Post_lab(ImPrev, ImCurr, k, Threshold);
    % To save every frame.
    saveas(h, sprintf('FIG%d.png',j));
    pause(0.5);
end