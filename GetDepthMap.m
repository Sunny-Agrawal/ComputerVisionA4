function depthMap = GetDepthMap(firstImage, secondImage)
%returns the depth map from a basic stareo match between two images
%THE IMAGES MUST ALREADY HAVE BEEN RECTIFIED

%get grayscales and initialize depthMap
firstImMat = imread(firstImage);
firstGrayMat = im2gray(firstImMat);
secondImMat = imread(secondImage);
secondGrayMat = im2gray(secondImMat);
imDimensions = size(firstGrayMat);
depthMap = zeros(imDimensions);
%Ensure disparity is even
disparity = imDimensions(2);
%pick between ssd and normalized correlation
ssd = true;

%Basic algorithm: For each pixel scan along the epipolar line in the second
%image and pick the lowest disparity.
for column = 1 : imDimensions(2)
   %find the interval of pixels to scan based on disparity range
   scanStart = 0;
   scanEnd = 0;
   if((column + (disparity/2) - 1) >= imDimensions(2))
       scanEnd = imDimensions(2);
       scanStart = imDimensions(2) - disparity + 1;
   elseif ((column - disparity/2) < 1)
       scanStart = 1;
       scanEnd = disparity;
   else
       scanStart = column - (disparity/2);
       scanEnd = scanStart + (disparity) - 1;
   end
   
   
   
   
end