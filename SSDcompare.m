function bestIndex = SSDcompare(LeftWindow, RightWindows)
%Get the index of the window in RightWindows that best matches the
%LeftWindow based on sum of squared differences.
numWindows = size(RightWindows, 3);
matchingCosts = zeros(numWindows, 1);
for windowNum = 1 : numWindows
    RightWindow = RightWindows(:, :, windowNum);
    diffMat = LeftWindow - RightWindow;
    %Square each element.
    diffSquares = diffMat.*diffMat;
    ssd = sum(diffSquares, 'all');
    matchingCosts(windowNum) = ssd;
end
[M, bestIndex] = min(matchingCosts);