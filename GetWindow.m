function window = GetWindow(imageMat, pixRow, pixColumn, hw)
%get the submatrix of an image with the given pixel as the center and

%hw dictates the window size such that the dimensions are hw*2+1
%assume no out of bounds errors will occur
windowDim = hw * 2 + 1;
imFirstRow = pixRow - hw;
imLastRow = pixRow + hw;
imFirstCol = pixColumn - hw;
imLastCol = pixColumn + hw;
window = imageMat(imFirstRow : imLastRow, imFirstCol : imLastCol);
%window = reshape(window, 1, windowDim * 2);