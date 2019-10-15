function [prediction,errorRate] = NaiveBayesClassifier(trainSet, testSet, groundTruth)

[t, features] = size(testSet);
[measurements, column]= size(trainSet);
%% Check that the number of columns of the second matrix equals 
%  the number d of columns of the first matrix – 1

[trSetRows, trSetCols] = size(trainSet);
[testSetRows, testSetCols] = size(testSet);

if( (trSetCols -1) ~= testSetCols)
    disp("Error! The train and test set are not correctly dimensioned");
end
%% Check that no entry in any of the two data sets is <1  

for row = 1:trSetRows
    for col = 1:trSetCols
        if (trainSet(row,col) < 1)
            disp(['Error! The values in the train set in position (', num2str(row),',',num2str(col),') are inconsistent']);
        end
    end
end

for row = 1:testSetRows
    for col = 1:testSetCols
        if (testSet(row,col) < 1)
            disp(['Error! The values in the test set in position (', num2str(row),',',num2str(col),') are inconsistent']);
        end
    end
end

%% Train a Naive Bayes classifier on the training set 
%  (first input argument), using its last column as the target

% First I need to evaluate the class vector, count how many classes 
% there are and compute their probability
% classLabel = [0;1;2;3;4;0;0;1;1;0;2;0;4;3];  %tested with different
% classLabel, works
classLabel = trainSet(:,column);
classes = unique(classLabel);        % Different classes
[no_classes, t] = size(classes);     % #of different classes

% Create matrix of classes and occurencies
classesOccur = horzcat(classes, zeros(no_classes,1));
[data, t] = size(classLabel);

% Count occurencies of each different classes (-> same as probability)
for i = 1:no_classes
    for k = 1:data
        if (classLabel(k) == classes(i))
            classesOccur(i,2) = classesOccur(i,2) +1;
        end
    end
end

% Now compute all the single probabilities from the train set
max_no_attributes= max(max(testSet)); % computer max number of attributes among all the columns          
confusionMatrix = zeros(max_no_attributes,no_classes,features);

for f= 1:features
    attributes = unique(trainSet(:,f));       % Count the attributes for each column of the trainSet
    [no_attributes, t] = size(attributes);    % #of different attributes for each column
    
    for j = 1:measurements  %for each single row of the single column of the train set
        for k = 1:no_attributes  %for each different type of attribute
            for c = 1:no_classes   %for each different classes
                if((trainSet(j, f) == attributes(k)) && (trainSet(j,features +1 ) == classes(c)))
                    % We have an occurence of attributes(k) with the
                    % relative target class with value classes(c) ->
                    % increment occurence
                    confusionMatrix(k,c,f) = confusionMatrix(k,c,f) + 1 ; 
                end
            end
        end
    end
end


%% Now evaluate the test set

results = zeros(testSetRows, no_classes);
classes_prob = zeros(no_classes);
attributes_prob = 1;

for row = 1:testSetRows
    for c = 1:no_classes
        classes_prob(c) = classesOccur(c,2)/ measurements;   % compute single class probability
        %compute single probability, take them from confusion matrix
        for f = 1:features        %iterate along the tridimensional matrix
            attributes_prob = attributes_prob * confusionMatrix(testSet(row,f),c,f) /  classesOccur(c,2);
            %use the actual attribute to index the matrix since they're all numerical and ordered
        end
        results(row,c) = classes_prob(c) * attributes_prob;   % probabilities each classes
        attributes_prob = 1;
    end
end

% Now normalize the values in [0,1] probability

finalProb = zeros(testSetRows,no_classes);
for row = 1:testSetRows
    for c = 1:no_classes
        finalProb(row,c) = results(row,c) / sum(results(row,:));
    end
end
%  finalProb
% Now compute error rate by expoliting the ground truth
t = 0; % temporary variable
prediction = zeros(testSetRows, 1);
errorRate = 0;
for row = 1:testSetRows
   
    [t, prediction(row,1)] = max(finalProb(row,:)); %take the index of the max value of vector = the prediction
    
    if (prediction(row,1) == groundTruth(row))
        % the prediction is correct
    else
        errorRate = errorRate +1 ;% the prediction is incorrect
    end
end

% prediction
errorRate = errorRate / testSetRows * 100;

end

