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

%Basic algorithm: For each pixel scan along the epipolar line in the second
%image (i.e. scan along the same row)