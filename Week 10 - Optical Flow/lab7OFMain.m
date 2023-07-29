clear all; close all; clc;

% Load the files given as Seq variable
load('cars1.mat'); 
load('cars2.mat'); 
load('rubic.mat'); 
load('sphere.mat'); 
load('taxi.mat'); 
load('traffic.mat');

Seq = traffic;

% The 'num' variable corresponds to the frame number. 
[row,col,num]=size(Seq);

% Define k (window size) and Threshold
k = 30;
Threshold = 200000;

for j=2:1:num
    ImPrev = Seq(:,:,j-1);
    ImCurr = Seq(:,:,j);
    h = lab7OF_Post_lab(ImPrev, ImCurr, k, Threshold);
    % To save every frame.
    if mod(j,7) == 0 
        saveas(h, sprintf('FIG%d.png',j));
    end
    pause(0.1);
end