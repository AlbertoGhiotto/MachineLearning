clear; clc;
%% Load dataset and divide in train and test set and class labels
preDataset = load('weather.data');       %Load the dataset

%randomize dataset entries for consistency in division between train and
%test set
dataset = preDataset(randperm(size(preDataset, 1)), :); 

[data, cols] = size(dataset);
features = cols -1 ; % take out the class labels from the features
n = 8;
%Divide dataset in:
trainSet = dataset(1:n, 1:features+1);          %train set
testSet = dataset(n:data, 1:features);        %test set
groundTruth = dataset(n:data,features+1);        %class labels (ground truth)

confusionMatrix = NaiveBayesClassifier(trainSet, testSet, groundTruth);


