function depthMap = GetDepthMap(firstImage, secondImage, hw, dispRange)
%returns the depth map from a basic stareo match between two images
%THE IMAGES MUST ALREADY HAVE BEEN RECTIFIED
windowSize = hw * 2 + 1;

%get grayscales and initialize depthMap
firstImMat = imread(firstImage);
firstGrayMat = im2gray(firstImMat);
secondImMat = imread(secondImage);
secondGrayMat = im2gray(secondImMat);
imDimensions = size(firstGrayMat);
paddedFirstImage = zeros(imDimensions(1) + 2 * hw, imDimensions(2) + 2 * hw);
paddedFirstImage(hw + 1 : imDimensions(1) + hw, hw + 1 : imDimensions(2) + hw) = firstGrayMat;
paddedSecondImage = zeros(imDimensions(1) + 2 * hw, imDimensions(2) + 2 * hw);
paddedSecondImage(hw + 1 : imDimensions(1) + hw, hw + 1 : imDimensions(2) + hw) = secondGrayMat;
paddedDepthMap = zeros(imDimensions + hw);

%pick between ssd and normalized correlation
ssd = true;

%Basic algorithm: For each pixel scan along the epipolar line in the second
%image and pick the lowest dispRange.
for column = 1 : imDimensions(2)
   %find the interval of columns to scan based on dispRange range
   scanStart = 0;
   scanEnd = 0;
   if((column + (dispRange/2) - 1) >= imDimensions(2))
       scanEnd = imDimensions(2);
       scanStart = imDimensions(2) - dispRange + 1;
   elseif ((column - dispRange/2) < 1)
       scanStart = 1;
       scanEnd = dispRange;
   else
       scanStart = column - (dispRange/2);
       scanEnd = scanStart + (dispRange) - 1;
   end
   
   for row = 1 : imDimensions(1)
       %Get the source window from the left image;
       paddedRow = row + hw;
       paddedCol = column + hw;
       leftWindow = GetWindow(paddedFirstImage, paddedRow, paddedCol, hw);
       %Get an array of all windows to scan from right image
       rightWindows = zeros(windowSize, windowSize, scanEnd - scanStart + 1);
       rightWindowIndex = 1;
       for scanCol = scanStart : scanEnd
           paddedScanCol = scanCol + hw;
           window = GetWindow(paddedSecondImage, paddedRow, paddedScanCol, hw);
           rightWindows(:, :, rightWindowIndex) = window;
           rightWindowIndex = rightWindowIndex + 1;
       end
   end
   
end