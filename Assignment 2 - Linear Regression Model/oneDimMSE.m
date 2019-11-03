function J_mse = oneDimMSE(dataSet, w1, w0, doPlot)
% Given the parameter of the model, the function computes the MSE on the
% given dataset with the given model.

[dimension,~] = size(dataSet(:,1));

% slope = linearRegression(dataSet, 0);
J_mse = 0 ;
% y = w1 * x;
y = w1 * dataSet(:,1);

for i = 1: dimension
%     J_mse = J_mse + (dataSet(i, 2) - slope * dataSet(i,1) ) ^2 ;    % Target is column 1 -> S&P index
      J_mse = J_mse + (dataSet(i, 2) - y(i) ) ^2 ;    % Target is column 1 -> S&P index
end

J_mse = J_mse / dimension;

if (doPlot)
    disp(['The one dimensional mse with a dataset of #', num2str(dimension),' samples is:',num2str(J_mse)]);
end

end