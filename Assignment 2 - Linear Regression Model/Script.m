%% Machine Learning Assignment 2

clear; close all;

%% Task 1: Get the data

carDataset = readtable("mtcarsdata-4features.csv");

carList = carDataset {:,1};

carDataset = carDataset {:,2:end};

stDataset = load("turkish-se-SP500vsMSCI.csv");

%%  Task 2 : Fit a linear regression model

% % One-dimensional problem without intercept on the Turkish stock exchange data

% linearRegression(stDataset,1);

% % Compare graphically the solution obtained on different random subsets
% % (10% or less) of the whole data set. To see  clear difference,
% % select data from different ends of the data set (beginning and end)
% % since they are in temporal order

% graphicCompare(stDataset);


% % One-dimensional problem with intercept on the Motor Trends car data,
% % predict mpg with weight

% linearRegressionWithOffset(carDataset, 1);


%  Multi-dimensional problem on the complete MTcars data, using all four columns
% (predict mpg with the other three columns)

% multiDimensionalLinearRegression(carDataset,1);

%% Task 3: Test regression model

% Compute MSE for one-dimensional problem without intercept on the Turkish stock exchange data
dimension = size(stDataset, 1);
mse_ten = 0 ; mse_sev = 0; mse_tot = 0;

iteration = 100000;
for i = 1:iteration
    randomStDataset = stDataset(randperm(dimension), :);
    mse_ten = mse_ten + oneDimMSE(randomStDataset(1:53,:),0);
    mse_sev = mse_sev + oneDimMSE(randomStDataset(1:482,:),0);
    mse_tot = mse_tot + oneDimMSE(randomStDataset(1:end,:),0);
end
 
 mse_ten = mse_ten / iteration;
 mse_sev = mse_sev / iteration;
 mse_tot = mse_tot / iteration;

 disp('MSE for one-dimensional problem without intercept on the Turkish stock exchange data');
 disp(['The one dimensional mse, averaged over #',num2str(iteration ),' iterations with a randomized dataset of 10% of the samples is:',num2str(mse_ten)]);
 disp(['The one dimensional mse, averaged over #',num2str(iteration ),' iterations with a randomized dataset of 90% of the samples is:',num2str(mse_sev)]);
 disp(['The one dimensional mse, averaged over #',num2str(iteration ),' iterations with a randomized dataset of 100% of the samples is:',num2str(mse_tot)]);

% % Compute MSE for one-dimensional problem with intercept on the Motor Trends car data, using columns mpg and weight

dimension = size(carDataset, 1);
mse_ten = 0 ; mse_sev = 0; mse_tot = 0;

iteration = 100000;
for i = 1:iteration
    randomCarDataset = carDataset(randperm(dimension), :);
    mse_ten = mse_ten + oneDimOffsetMSE(randomCarDataset(1:4,:),0);
    mse_sev = mse_sev + oneDimOffsetMSE(randomCarDataset(1:28,:),0);
    mse_tot = mse_tot + oneDimOffsetMSE(randomCarDataset(1:end,:),0);
end
 
 mse_ten = mse_ten / iteration;
 mse_sev = mse_sev / iteration;
 mse_tot = mse_tot / iteration;

 disp('MSE for one-dimensional problem with intercept on the Motor Trends car data');
 disp(['The one dimensional mse, averaged over #',num2str(iteration ),' iterations with a randomized dataset of 10% of the samples is:',num2str(mse_ten)]);
 disp(['The one dimensional mse, averaged over #',num2str(iteration ),' iterations with a randomized dataset of 90% of the samples is:',num2str(mse_sev)]);
 disp(['The one dimensional mse, averaged over #',num2str(iteration ),' iterations with a randomized dataset of 100% of the samples is:',num2str(mse_tot)]);

% Compute MSE for Multi-dimensional problem on the complete MTcars data
dimension = size(carDataset, 1);
mse_ten = 0 ; mse_sev = 0; mse_tot = 0;

iteration = 10000;
for i = 1:iteration
    randomCarDataset = carDataset(randperm(dimension), :);
    mse_ten = mse_ten + multiDimMSE(randomCarDataset(1:4,:),0);
    mse_sev = mse_sev + multiDimMSE(randomCarDataset(1:28,:),0);
    mse_tot = mse_tot + multiDimMSE(randomCarDataset(1:end,:),0);
end
 
 mse_ten = mse_ten / iteration;
 mse_sev = mse_sev / iteration;
 mse_tot = mse_tot / iteration;

 disp('MSE for Multi-dimensional problem on the complete MTcars data');
 disp(['The multi dimensional mse, averaged over #',num2str(iteration ),' iterations with a randomized dataset of 10% of the samples is:',num2str(mse_ten)]);
 disp(['The multi dimensional mse, averaged over #',num2str(iteration ),' iterations with a randomized dataset of 90% of the samples is:',num2str(mse_sev)]);
 disp(['The multi dimensional mse, averaged over #',num2str(iteration ),' iterations with a randomized dataset of 100% of the samples is:',num2str(mse_tot)]);

