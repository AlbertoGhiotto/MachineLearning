%% Machine Learning Assignment 4
% Alberto Grillo
% Alberto Ghiotto

clear; close all; clc;

%% Task 1: Get The Data
% Take only two classes
classes = [10 1 5 ];
% Load train set
[trainSet, labels]  = loadMNIST(0, classes);
% trainSet = [data, labels];

% Divide the dataset
n = 10;
trainSet = trainSet(1:floor(end/n),1:end);
labels = labels(1:floor(end/n),1);
trainSet = trainSet';
%%
nh = 3;
% Train autoencoder on the new, reduced training set
myAutoencoder = trainAutoencoder(trainSet,nh);
% Encode the different classes using the encoder obtained
myEncodedData = encode(myAutoencoder,trainSet);

% Denormalize data for plotting
myEncodedData = myEncodedData';

t = labels;
plotcl(myEncodedData, t);