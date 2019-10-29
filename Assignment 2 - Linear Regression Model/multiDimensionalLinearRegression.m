function prediction = multiDimensionalLinearRegression(dataSet, doPlot)
% Multidimensional problem with 3 observation vector (column 2,3,4) 
% and 1 target vector (mpg in the case of motor trend data, column 1)

[dimension,~] = size(dataSet(:,1));

% Build observation vector 
X = [ dataSet(:,2), dataSet(:,3), dataSet(:,4) ];
  
% Build target vector -> mpg column 1
t = dataSet(:,1);

% Compute slope
w = pinv(X' * X) * X' * t;

% Plot the table representing the estimate of the target
% figure;
% plot (X, t, 'rx');        % plot points of dataset
% hold on;
% plot line with computed slope y = X * w
% plot (X, X * w  , 'b-' , 'Linewidth', 2);

prediction = X*w ;

if doPlot
    
    f = figure;
    data = [X t prediction];
    colNames = {'disp', 'hp', 'weight', 'dataset mpg', 'Predicted mpg' };
    uitable(f, 'Data', data, 'ColumnName', colNames, 'Position', [0 0 470 420]);
end

% title('Multi dimensional problem on the on the Motor Trends car data');


end