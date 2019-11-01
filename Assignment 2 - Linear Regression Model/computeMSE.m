function [mse_ten, mse_ninety, mse_tot] = computeMSE(iteration, dataset, relativeMSE, perc_1, perc_2)

dimension = size(dataset, 1);
mse_ten = 0 ; mse_ninety = 0; mse_tot = 0;

% set percentage
ten = floor(dimension * perc_1);
ninety = floor(dimension * perc_2);

% Compute MSW
for i = 1:iteration
    randomDataset = dataset(randperm(dimension), :);
    mse_ten = mse_ten + relativeMSE(randomDataset(1:ten,:),0);
    mse_ninety = mse_ninety + relativeMSE(randomDataset(1:ninety,:),0);
    mse_tot = mse_tot + relativeMSE(randomDataset(1:end,:),0);
end

mse_ten = mse_ten / iteration;
mse_ninety = mse_ninety / iteration;
mse_tot = mse_tot / iteration;

% print table
col_1 = [ (ten/dimension)*100 ; (ninety/dimension)*100 ; 100];
col_2 = [ mse_ten ; mse_ninety ; mse_tot ];
f = figure;
data = [ col_1 col_2 ];
colNames = {'Percentage', 'MSE'};
uitable(f, 'Data', data, 'ColumnName', colNames, 'Position', [5 340 184 80]);


end