function [prediction ,errorRate] = kNNClassifier(trainSet, testSet, k, groundTruth)

if nargin<3
    error('Not enough input arguments')
end
%% Preprocessing

% Get dataset dimensions
[testSetRows, testSetCols] = size(testSet);
[trainSetRows, trSetCols] = size(trainSet);

% Check dataset dimensions
if( (trSetCols -1) ~= testSetCols)
    disp("Error! The train and test set are not correctly dimensioned");
end

% Check k's cardinality
cardinality = trainSetRows;
if ( k <= 0 || k > cardinality )
    disp("Error! k is not correctly dimensioned!");
end

%% Classify the test accordingly to the kNN rule
labels = zeros(k, testSetRows);

[~, labelIndex] = pdist2(trainSet(:,1:testSetCols), testSet, 'euclidean', 'Smallest', k);

% Assign relative label
for column = 1:testSetRows
    for label = 1:k
        labels(label,column) = trainSet(labelIndex(label,column),end);
    end
end
prediction = zeros(1,testSetRows);
% Compute prediction with mode
for column = 1:testSetRows
    prediction(column) = mode(labels(:,column));
end

errorRate = 0 ;
if ( nargin == 4)
    % Compute error rate
    errorRate = (sum(prediction' ~= groundTruth)) / testSetRows;
    errorRate = errorRate * 100 ;
end


end