function J_mse = oneDimMSE(dataSet, doPlot)

[dimension,~] = size(dataSet(:,1));

slope = linearRegression(dataSet, 0);
J_mse = 0 ;

for i = 1: dimension
    J_mse = J_mse + (dataSet(i, 2) - slope * dataSet(i,1) ) ^2 ;    % Target is column 1 -> S&P index
end

J_mse = J_mse / dimension;

if (doPlot)
    disp(['The one dimensional mse with a dataset of #', num2str(dimension),' samples is:',num2str(J_mse)]);
end

end