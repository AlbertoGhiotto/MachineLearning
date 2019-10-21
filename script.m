clear; clc;
%% Load dataset and divide in train and test set and class labels
preDataset = load('weather2.data');       %Load the dataset

% preDataset = load('mushroom.csv');

% preDataset = [preDataset(:, 2:end) preDataset(:,1)];

% randomize dataset entries for consistency in division between train and
% test set
 dataset = preDataset(randperm(size(preDataset, 1)), :); 
[data, cols] = size(preDataset);
features = cols -1 ; % take out the class labels from the features
n =10;
%Divide dataset in:
trainSet = dataset(1:n, 1:features+1);          %train set
testSet = dataset(n+1:data, 1:features);        %test set
% testSet = trainSet(1:n, 1:features);
groundTruth = dataset(n+1:data,features+1);        %class labels (ground truth)


[prediction,errorRate] = NaiveBayesClassifier(trainSet, testSet, groundTruth);

% [prediction,errorRate] = NaiveBayesClassifierWithLaplaceSmoothing(trainSet, testSet, groundTruth);

[prediction,errorRate] = NaiveBayesClassifierLaplace(trainSet, testSet, groundTruth);
