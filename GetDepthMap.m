function depthMap = GetDepthMap(firstImage, secondImage, hw, dispRange)
%returns the depth map from a basic stareo match between two images
%THE IMAGES MUST ALREADY HAVE BEEN RECTIFIED

%get grayscales and initialize depthMap
firstImMat = imread(firstImage);
firstGrayMat = im2gray(firstImMat);
secondImMat = imread(secondImage);
secondGrayMat = im2gray(secondImMat);
imDimensions = size(firstGrayMat);
paddedFirstImage = zeros(imDimensions(1) + 2 * hw, imDimensions(2) + 2 * hw);
paddedFirstImage(hw + 1 : imDimensions(1) + hw + 1, hw + 1 : imDimensions(2) + hw + 1) = firstGrayMat;
paddedSecondImage = zeros(imDimensions(1) + 2 * hw, imDimensions(2) + 2 * hw);
paddedSecondImage(hw + 1 : imDimensions(1) + hw + 1, hw + 1 : imDimensions(2) + hw + 1) = secondGrayMat;
paddedDepthMap = zeros(imDimensions + hw);

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
   scanStart = scanStart + windowSize;
   scanEnd = scanEnd + windowSize;
   
   %Get the source window from the left image;
   
   
   
end