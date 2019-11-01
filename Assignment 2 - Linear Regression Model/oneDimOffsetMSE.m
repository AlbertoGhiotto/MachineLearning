function J_mse = oneDimOffsetMSE(dataSet, doPlot)

[dimension,~] = size(dataSet(:,1));

y = linearRegressionWithOffset(dataSet, 0);
J_mse = 0 ;

for i = 1: dimension
    J_mse = J_mse + (dataSet(i, 1) - y(i) ) ^2 ;  % Target is column 1 ->mpg
end

J_mse = J_mse / dimension;


if (doPlot)
    disp(['The one dimensional mse with a dataset of #', num2str(dimension),' samples is:',num2str(J_mse)]);
end

end