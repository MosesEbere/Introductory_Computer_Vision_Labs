Im = imread('darkImage.png');
[r,c] = size(Im);
n = r*c;
f = zeros(256,1);
for i=1:1:r
for j=1:1:c
value = Im(i,j);
f(value+1)=f(value+1)+1;
end
end
pdf = f./n;
cdf = zeros(256,1);
out = zeros(256,1);
sum=0;
for i=1:1:256
sum = sum+f(i);
cdf(i) = sum/n;
out(i) = round(cdf(i)*255);
end
histeqIm = uint8(zeros(r,c));
for i=1:1:r
for j=1:1:c
histeqIm(i,j)=out(Im(i,j)+1);
end
end
figure;
subplot(1,2,1); imshow(Im);
title('Original Image')
subplot(1,2,2); imshow(histeqIm);
title('Histogram Equalized Image')
figure;
subplot(1,2,1); imhist(Im);
subplot(1,2,2); imhist(histeqIm);