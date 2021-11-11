function bestIndex = normCorCompare(LeftWindow, RightWindows)

numWindows = size(RightWindows, 3);
correlations = zeros(numWindows, 1);
meanLeft = mean(LeftWindow);
leftDeviations = LeftWindow - meanLeft;
for windowNum = 1 : numWindows
    RightWindow = RightWindows(:, :, windowNum);
    meanRight = mean(RightWindow);
    rightDeviations = RightWindow - meanRight;
    numerator = sum(rightDeviations.*leftDeviations);
    denominator = sqrt(sum(rightDeviations.^2).*sum(leftDeviations.^2));
    correlations(windowNum) = numerator/denominator;
end
[M, bestIndex] = max(correlations);
