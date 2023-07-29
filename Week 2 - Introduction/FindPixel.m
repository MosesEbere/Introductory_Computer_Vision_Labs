Im = imread('blocks.png');
Im = rgb2gray(Im);

% make a new image that is fully black; however, its size must be the same as the image I'm working with.
Im2 = zeros(size(Im));  

% locate all portions of the image whose intensities fall within the stipulated range. 
k = find((Im>170)&(Im<200)); 

Im2(k)=255; % the aforementioned located portions should be colored white

% k is a 1D vector containing all the located indices.
imshow(Im2)

% Excercise: Make a black background and highlight the nineteenth pixel
% with a white marker. 