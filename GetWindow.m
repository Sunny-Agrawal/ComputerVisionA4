function window = GetWindow(imageMat, pixRow, pixColumn, hw)
%get the submatrix of an image with the given pixel as the center and

%hw dictates the window size such that the dimensions are hw*2+1
%assume no out of bounds errors will occur
windowDim = hw * 2 + 1;
imFirstRow = pixRow - hw;
imFirstRow = cast(imFirstRow, 'uint16');
imLastRow = pixRow + hw;
imLastRow = cast(imLastRow, 'uint16');
imFirstCol = pixColumn - hw;
imFirstCol = cast(imFirstCol, 'uint16');
imLastCol = pixColumn + hw;
imLastCol = cast(imLastCol, 'uint16');
window = imageMat(imFirstRow : imLastRow, imFirstCol : imLastCol);
%window = reshape(window, 1, windowDim * 2);