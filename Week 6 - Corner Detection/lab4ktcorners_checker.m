function [output1, output2] = lab4ktcorners_checker(img, t)

% The row, column, and channels of the image are obtained along with the cardinality of the image. 
[r, c, ch] = size(img);
Card = r*c;

% This is added in case the image introduced is an RGB image. 
% It functions to convert it to a gray-scale image. 
if (ch == 3)
    img = rgb2gray(img);
end

%Convert the image to double before performing any %mathematical operation
I = double(img);

% Compute the image gradients
[Gx, Gy] = imgradientxy(I);

H = zeros(2,2);
list = [];

% % The window size for the gaussian filtering operation is specified. 
k = 2;

for i=(k+1):1:r-k
    for j=(k+1):1:c-k
        %the window will go from -k to +k
        wpx = Gx(i-k:i+k, j-k:j+k);
        wpy = Gy(i-k:i+k, j-k:j+k);
        % Perform convolution using the previously created masks. 
%         [wpx, wpy] = imgradientxy(wp);
        H(1,1) = sum(sum(wpx.*wpx));
        H(1,2) = sum(sum(wpx.*wpy));
        H(2,1) = H(1,2);
        H(2,2) = sum(sum(wpy.*wpy));
        
        L1 = eig(H);
        
        if min(L1) > t
            list = [list; [i,j]];
        end
        
    end
end
%list
output1 = uint8(I);
output2 = list;

end
