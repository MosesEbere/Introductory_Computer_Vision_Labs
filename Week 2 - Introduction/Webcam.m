% Check the available webcams

camList = webcamlist;

% connect to webcam

cam = webcam(1);

% show the camera feed
preview(cam);

% Take a photo
img = snapshot(cam);

imshow(img)