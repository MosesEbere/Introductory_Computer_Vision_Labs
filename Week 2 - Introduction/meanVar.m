function [mean,variance] = meanVar(img)

% Recall: The name of the function has to be the name of the m-file. 

% It's important to always find the size of the image first. 
% A good syntax should be able to identify the rows, columns, and channels
% from the get go. 

[row, col, ch] = size(img);

% The cardinality of the carrier is a frequently used parameter, so it's
% important to find it. 

Card = row*col; 

% We should also be sure to check the image we're working with. 

if (ch == 3)
    img = rgb2gray(img);
end

