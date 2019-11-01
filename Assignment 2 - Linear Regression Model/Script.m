%% Machine Learning Assignment 2

clear; close all;

%% Task 1: Get the data

carDataset = readtable("mtcarsdata-4features.csv");

carList = carDataset {:,1};

carDataset = carDataset {:,2:end};

stDataset = load("turkish-se-SP500vsMSCI.csv");

%%  Task 2 : Fit a linear regression model

% One-dimensional problem without intercept on the Turkish stock exchange data

linearRegression(stDataset,1);

% Compare graphically the solution obtained on different random subsets
% (10% or less) of the whole data set. To see  clear difference,
% select data from different ends of the data set (beginning and end)
% since they are in temporal order

graphicCompare(stDataset);

% One-dimensional problem with intercept on the Motor Trends car data,
% predict mpg with weight

linearRegressionWithOffset(carDataset, 1);

%  Multi-dimensional problem on the complete MTcars data, using all four columns
% (predict mpg with the other three columns)

multiDimensionalLinearRegression(carDataset,1);

%% Task 3: Test regression model
iteration = 10000;
% Compute MSE for one-dimensional problem without intercept on the Turkish stock exchange data
[mse_ten, mse_ninety, mse_tot] = computeMSE(iteration, stDataset, @oneDimMSE, 0.1, 0.9);
disp('MSE for one-dimensional problem without intercept on the Turkish stock exchange data');
disp(['The one dimensional mse, averaged over #',num2str(iteration ),' iterations with a randomized dataset of 10% of the samples is:',num2str(mse_ten)]);
disp(['The one dimensional mse, averaged over #',num2str(iteration ),' iterations with a randomized dataset of 90% of the samples is:',num2str(mse_ninety)]);
disp(['The one dimensional mse, averaged over #',num2str(iteration ),' iterations with a randomized dataset of 100% of the samples is:',num2str(mse_tot)]);

% Compute MSE for one-dimensional problem with intercept on the Motor Trends car data, using columns mpg and weight
%here use 0.125 since with exactly 10% of data -> 3 observation, we can incur in singularity
[mse_ten, mse_ninety, mse_tot] = computeMSE(iteration, carDataset, @oneDimOffsetMSE, 0.125, 0.9);
disp('MSE for one-dimensional problem with intercept on the Motor Trends car data');
disp(['The one dimensional mse, averaged over #',num2str(iteration ),' iterations with a randomized dataset of 10% of the samples is:',num2str(mse_ten)]);
disp(['The one dimensional mse, averaged over #',num2str(iteration ),' iterations with a randomized dataset of 90% of the samples is:',num2str(mse_ninety)]);
disp(['The one dimensional mse, averaged over #',num2str(iteration ),' iterations with a randomized dataset of 100% of the samples is:',num2str(mse_tot)]);


% Compute MSE for Multi-dimensional problem on the complete MTcars data
%here use 0.125 since with exactly 10% of data -> 3 observation, we can incur in singularity
[mse_ten, mse_ninety, mse_tot] = computeMSE(iteration, carDataset, @multiDimMSE, 0.125, 0.9);
disp('MSE for Multi-dimensional problem on the complete MTcars data');
disp(['The multi dimensional mse, averaged over #',num2str(iteration ),' iterations with a randomized dataset of 10% of the samples is:',num2str(mse_ten)]);
disp(['The multi dimensional mse, averaged over #',num2str(iteration ),' iterations with a randomized dataset of 90% of the samples is:',num2str(mse_ninety)]);
disp(['The multi dimensional mse, averaged over #',num2str(iteration ),' iterations with a randomized dataset of 100% of the samples is:',num2str(mse_tot)]);

