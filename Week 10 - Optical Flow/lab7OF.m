function [output] = lab7OF(ImPrev, ImCurr, k, Threshold)
% Smooth the input images using a Box filter
Box_filt = [1 1 1; 1 1 1; 1 1 1];
ImPrev1 = conv2(ImPrev, Box_filt);
ImCurr1 = conv2(ImCurr, Box_filt);

% Calculate spatial gradients (Ix, Iy) using Prewitt filter
x_filt = [1 0 -1; 1 0 -1; 1 0 -1];
y_filt = [1 1 1; 0 0 0; -1 -1 -1];
Ix = conv2(ImCurr1, x_filt,'same');
Iy = conv2(ImCurr1, y_filt,'same');

% Calculate temporal (It) gradient
It = ImCurr1 - ImPrev1;

[ydim,xdim] = size(ImCurr);
Vx = zeros(ydim,xdim);
Vy = zeros(ydim,xdim);
G = zeros(2,2);
b = zeros(2,1);
cx=k+1;

for x=k+1:k:xdim-k-1
    cy=k+1;
    for y=k+1:k:ydim-k-1
        % Create a window of the image gradients (from -k to +k)
        wpx = Ix(y-k:y+k, x-k:x+k);
        wpy = Iy(y-k:y+k, x-k:x+k);
        % Create the corner matrix, G.
        G(1,1) = sum(sum(wpx.*wpx));
        G(1,2) = sum(sum(wpx.*wpy));
        G(2,1) = G(1,2);
        G(2,2) = sum(sum(wpy.*wpy));
        % Find the eigenvalues of G.
        L1 = eig(G);
        
        wpt = It(y-k:y+k, x-k:x+k);
        b(1,1) = sum(sum(wpt.*wpx));
        b(2,1) = sum(sum(wpt.*wpy));
        
        if (min(L1) < Threshold)
            Vx(cy,cx)=0;
            Vy(cy,cx)=0;
        else
            % Calculate u
            u = -1*(G\b);
            Vx(cy,cx)=u(1);
            Vy(cy,cx)=u(2);
        end
            cy=cy+k;
    end
    cx=cx+k;
end

cla reset;
h = imagesc(ImPrev); hold on;
[xramp,yramp] = meshgrid(1:1:xdim,1:1:ydim);
quiver(xramp,yramp,Vx,Vy,10,'r');
colormap gray;

output = h;
end