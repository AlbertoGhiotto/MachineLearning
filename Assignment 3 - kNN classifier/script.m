%% Machine Learning Assignment 3
% Alberto Grillo
% Alberto Ghiotto

clear; close all; clc;

%% Task 1: Get The Data

% Load train set
[data, labels]  = loadMNIST(0);
trainSet = [data, labels];

% Load test set
[testSet, testLabels]  = loadMNIST(1);
% testSet = [data, labels];


n = 1;
testSet = testSet(1:end/n,1:end);
trainSet = trainSet(1:end/n,1:end);
testLabels = testLabels(1:end/n,1:end);


%% Task 2 and 3: Classify the data and get results

k = 1;
[prediction ,errorRate] = kNNClassifier(trainSet, testSet, k, testLabels);

[observations,~] = size(testLabels);

if (~isnan(errorRate)) % Error rate has been computed
    % display error rate
    disp(['The error rate computed over #',num2str(observations),' observation, with K = ',num2str(k),' is: ',num2str(errorRate),'%']);
    disp(['The accuracy is: ',string(1-errorRate/100)]);
end


%% Print error rate trend for test 1
% k = 1:201;
% for y = 1:10
%     figure;
%     name = 'result_files/result_k1-201_digit' + string(y) + '.mat';
%     load(name);
% %     bar(result(1:2:end,2),0.8);
%     plot(k,result(1:2:end,2)*100);
%     title(["Error rate trend (%) with digit ", string(y) ," vs the remaining nine"]);
%     xlabel("k values ");
%     ylabel("Error %");
%     xlim([0 201]);
%     ylim([0.2 2.2]);
%
% end
%

%% Print accuracy trend for test 1 - it needs the files made from test_1.m
digits = [ 1 2 3 4 5 6 7 8 9 0];
k = 1:2:201;
for y = 1:10
    figure;
    name = 'result_files/result_k1-201_digit' + string(y) + '.mat';
    load(name);
    bar(k,(1-result(1:2:end,2))*100, 0.7);
    title(["Accuracy trend with digit ", string(digits(y)) ," vs the remaining nine"]);
    xlabel("k values ");
    ylabel("Accuracy %");
    %     xlim([0 201]);
    ylim([97.8 99.75]);
    saveas(gcf,'MultiDigit_'+string(y)+'.jpeg');
end

%% Print accuracy trend for test 2 - it needs the files made from test_2.m
figure;
load('result_files/result_several_k1.mat');
bar(k,(1-result(1:2:end,2))*100);
title(["Accuracy trend (%) for several values of k"]);
xlabel("k values ");
ylabel("Accuracy %");
xlim([0 201]);
ylim([92.5 97.5]);
saveas(gcf,'SeveralK.jpeg');

