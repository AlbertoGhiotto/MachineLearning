function J_mse = multiDimMSE(dataSet, doPlot)

[dimension,~] = size(dataSet(:,1));

y = multiDimensionalLinearRegression(dataSet, 0);
J_mse = 0 ;

% for i = 1: dimension
%     J_mse = J_mse + (dataSet(i, 1) - y(i) ) ^2 ;  % Target is column 1 ->mpg
% end
% 
% J_mse = J_mse / dimension;


% the computation of the MSE can be either done with the above commented
% formula or by directly using the immse function
t = dataSet(:, 1);
J_mse = immse(t, y); 

if (doPlot)
    disp(['The one dimensional mse with a dataset of #', num2str(dimension),' samples is:',num2str(J_mse)]);
end

end