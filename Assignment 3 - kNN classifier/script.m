%% Machine Learning Assignment 3
% Alberto Grillo
% Alberto Ghiotto

clear; %close all; clc;

%% Task 1: Get The Data

% Load train set
[data, labels]  = loadMNIST(0);
trainSet = [data, labels];

% Load test set
[testSet, testLabels]  = loadMNIST(1);
% testSet = [data, labels];

% Randomize dataset entries 
%  dataset = preDataset(randperm(size(preDataset, 1)), :); 

n = 1;
testSet = testSet(1:end/n,1:end);
trainSet = trainSet(1:end/n,1:end);
testLabels = testLabels(1:end/n,1:end);


%% Task 2 and 3: Classify the data and get results

% k = 5;
% [prediction ,errorRate] = kNNClassifier(trainSet, testSet, k, testLabels);
% 
% [observations,~] = size(testLabels);
% 
% if (~isnan(errorRate)) % Error rate has been computed
%    % display error rate
%    disp(['The error rate computed over #',num2str(observations),' observation, with K = ',num2str(k),' is: ',num2str(errorRate),'%']);
% end

h = 4 ;
 errors= zeros(h,1);

for kappa = 1:h
    [prediction ,errorRate] = kNNClassifier(trainSet, testSet, kappa, testLabels);
    errors(kappa) = errorRate ;
    [observations,~] = size(testLabels);
    
    if (~isnan(errorRate)) % Error rate has been computed
        % display error rate
        disp(['The error rate computed over #',num2str(observations),' observation, with K = ',num2str(kappa),' is: ',num2str(errorRate),'%']);
    end
    
end


