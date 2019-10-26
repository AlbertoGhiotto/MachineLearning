%% Machine Learning Assignment 2

clear; clc; close all;

carDataset = readtable("mtcarsdata-4features.csv");

carList = carDataset {:,1};

carDataset = carDataset {:,2:end};

stDataset = load("turkish-se-SP500vsMSCI.csv");

% One-dimensional problem without intercept on the Turkish stock exchange data
% linearRegression(stDataset,1);

% Compare graphically the solution obtained on different random subsets 
% (10% or less) of the whole data set. To see  clear difference, 
% select data from different ends of the data set (beginning and end) 
% since they are in temporal order

% graphicCompare(stDataset);


% One-dimensional problem with intercept on the Motor Trends car data,
% using columns mpg and weight

linearRegressionWithOffset(carDataset, 1);



