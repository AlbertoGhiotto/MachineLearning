function [w, w0] = linearRegression(dataSet, doPlot)
% One-dimensional problem without intercept. Compute and returns the model

num = 0;
den = 0;

[dimension,~] = size(dataSet(:,1));

for i= 1:dimension
    num = num +  dataSet(i,1) * dataSet(i,2);
    den = den + (dataSet(i,1))^2;
end

w = num / den ;
w0 = 0;     % generic model for code reusability

if doPlot
    figure;
    plot (dataSet(:,1), dataSet(:,2), 'rx');        % plot points of dataset
    hold on;
    % plot line with computed slope y = slope * x
    plot (dataSet(:,1), w * dataSet(:,1), 'b-' , 'Linewidth', 2);
    title('One-dimensional problem without intercept on the Turkish stock exchange data');
end

end