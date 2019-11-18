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
% Compute distance between single query point (single test set observation)
% and the training set's examples


%         distanceAndLabel(:,1) = pdist2(trainSet(:,1:testSetCols), testSet(testRow,:), 'euclidean');
%     [distanceAndLabel(:,1), labelIndex] = pdist2(trainSet(:,1:testSetCols), testSet(testRow,:), 'euclidean', 'Smallest', k);

% Compute index of k smallest euclidian distances
[~, labelIndex] = pdist2(trainSet(:,1:testSetCols), testSet, 'euclidean', 'Smallest', k);



% Assign relative label
for row = 1:testSetRows
    for label = 1:k
        labels(label,row) = trainSet(labelIndex(label,row),end);
    end
end

%         distanceAndLabel(:,2) = trainSet(:,end);
%         [distanceAndLabel(:,1), distanceAndLabel(:,2)] = mink

% Compute prediction with mode
prediction = mode(labels)';



errorRate = 0 ;
if ( nargin == 4)
    % Compute error rate
    for index = 1:k
        if(prediction(index) ~= groundTruth(index))
            errorRate = errorRate +1;
        end
    end
    errorRate = errorRate / testSetRows * 100;
end


end