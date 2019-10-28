function y = linearRegressionWithOffset(dataSet, doPlot)

% One-dimensional problem with intercept

num = 0;
den = 0;
x_bar = 0;
t_bar = 0;

[dimension,~] = size(dataSet(:,1));

for i= 1:dimension
    x_bar = x_bar + dataSet(i,1);
    t_bar = t_bar + dataSet(i,4);
end

% Multiply by 1/N ( N: dimension of dataset)
x_bar = x_bar/dimension;
t_bar = t_bar/dimension;

for i = 1:dimension
    num = num +  (dataSet(i,1) - x_bar) * (dataSet(i,4) - t_bar);
    den = den + (dataSet(i,1) - x_bar)^2;
end

w1 = num / den ;  % slope (gain)

w0 = t_bar - w1 * x_bar ;   % intercept / offset (bias)


y = w1 * dataSet(:,1) + w0;
if(doPlot)
    figure;
    plot (dataSet(:,1), dataSet(:,4), 'rx');        % plot points of dataset
    hold on;
    % plot line with computed slope y = w1 * x + w0
    plot (dataSet(:,1), y , 'b-' , 'Linewidth', 2);
    %maybe put title in script?
    title('One-dimensional problem with intercept on the on the Motor Trends car data');
end

end