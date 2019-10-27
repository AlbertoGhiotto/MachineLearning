function multiDimensionalLinearRegression(dataSet)
% Multidimensional problem with 3 observation vector (column 2,3,4) 
% and 1 target vector (mpg in the case of motor trend data, column 1)

[dimension,~] = size(dataSet(:,1));

% Build observation vector 
X = [ dataSet(:,2), dataSet(:,3), dataSet(:,4) ];
  
% Build target vector
t = dataSet(:,1);

% Compute slope
w = pinv(X' * X) * X' * t;

figure;
plot (X, t, 'rx');        % plot points of dataset
hold on;
% plot line with computed slope y = X * w
plot (X, X * w  , 'b-' , 'Linewidth', 2);

title('Multi dimensional problem on the on the Motor Trends car data');


end