%% Machine Learning Assignment 4
% Alberto Grillo
% Alberto Ghiotto

clear; close all; clc;

%% Task 1: Get The Data
% Take only two classes
classes = [2 8];
% Load train set
[trainSet, labels]  = loadMNIST(0, classes);
% trainSet = [data, labels];

% Divide the dataset 
n = 10;
trainSet = trainSet(1:floor(end/n),1:end);
trainSet = trainSet';
% Normalize label vector  (not necessary)
% labels = normalizeLabel(labels);


nh = 10;
% Train autoencoder on the new, reduced training set
myAutoencoder = trainAutoencoder(trainSet,nh);
% Encode the different classes using the encoder obtained
myEncodedData = encode(myAutoencoder,trainSet);

% Denormalize data for plotting
myEncodedData = myEncodedData';

n = size(myEncodedData,1);
t = [1 2]';
plotcl(myEncodedData, t);



