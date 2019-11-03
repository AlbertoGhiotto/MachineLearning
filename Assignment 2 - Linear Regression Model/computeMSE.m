function [mse_ten, mse_ninety] = computeMSE(iteration, dataset, relativeMSE,relativeRegressionAlgo, perc_1, perc_2)

dimension = size(dataset, 1);
mse_ten = 0 ; mse_ninety = 0;

% set percentage
ten = floor(dimension * perc_1);
ninety = floor(dimension * perc_2);

% Compute MSE
for i = 1:iteration
    randomDataset = dataset(randperm(dimension), :);
    [w1, w0] = relativeRegressionAlgo(randomDataset(1:ten,:), 0);      % Compute model on 10% of dataset
    % Compute MSE on
    mse_ten = mse_ten + relativeMSE(randomDataset(1:ten,:), w1, w0, 0);              % Ten percent of dataset
    mse_ninety = mse_ninety + relativeMSE(randomDataset(ten+1:end,:), w1, w0, 0);    % Remaining 90% of dataset
%     mse_tot = mse_tot + relativeMSE(randomDataset(1:end,:), w1, w0, 0);              % Whole dataset    
end

mse_ten = mse_ten / iteration;
mse_ninety = mse_ninety / iteration;
% mse_tot = mse_tot / iteration;

% print table
col_0 = {'Train set' ; 'Test set' };
col_1 = { (ten/dimension)*100 ; (ninety/dimension)*100};
col_2 = { mse_ten ; mse_ninety};
f = figure;
data = [ col_0 col_1 col_2 ];
colNames = {'Dataset' , 'Percentage' , 'MSE'};
uitable(f, 'Data', data, 'ColumnName', colNames, 'Position', [5 340 260 60]);


end