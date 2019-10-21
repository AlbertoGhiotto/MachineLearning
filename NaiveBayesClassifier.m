function [prediction,errorRate] = NaiveBayesClassifier(trainSet, testSet, groundTruth)

if nargin<3
    error('Not enough input arguments')
end

[t, features] = size(testSet);
[measurements, column]= size(trainSet);
%% Check that the number of columns of the second matrix equals 
%  the number d of columns of the first matrix – 1

[trSetRows, trSetCols] = size(trainSet);
[testSetRows, testSetCols] = size(testSet);
%-------------Rename dimensional variable to suit their content

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

no_attributes = ones(1,features);

for f= 1:features
    attributes = unique(trainSet(:,f));       % List of the attributes for each column of the trainSet
    [no_attributes(f), t] = size(attributes);    % #of different attributes for each column
    
    for j = 1:measurements  %for each single row of the single column of the train set
        for k = 1:no_attributes(f)  %for each different type of attribute
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

checkOccurr = sum(confusionMatrix(:,:,:));

%% Evaluation of the test set

aPostProb = zeros(testSetRows, no_classes);
aPrioriProb = zeros(no_classes,1);
likelihood = 1;

for row = 1:testSetRows
    for c = 1:no_classes
        aPrioriProb(c) = classesOccur(c,2)/ measurements;   % compute single class probability
        %compute likelihood, use values of single probability from confusion matrix
        for f = 1:features        %iterate along the tridimensional matrix
            if confusionMatrix(testSet(row,f),c,f) ~= 0
                likelihood = likelihood * confusionMatrix(testSet(row,f),c,f) /  classesOccur(c,2);
                %use the actual attribute to index the matrix since they're all numerical and ordered
            end
        end
        aPostProb(row,c) = aPrioriProb(c) * likelihood;   % probabilities each classes
        likelihood = 1;
    end
end
% aPostProb
% Normalization of the values of posteriori probability between [0,1] 

normalizedProb = zeros(testSetRows,no_classes);
for row = 1:testSetRows
    for c = 1:no_classes
        normalizedProb(row,c) = aPostProb(row,c) / sum(aPostProb(row,:));
    end
end
%  normalizedProb

% Now compute error rate by expoliting the ground truth

prediction = zeros(testSetRows,1);
errorRate = 0;
for row = 1:testSetRows
    [~, prediction(row)] = max(normalizedProb(row,:)); %take the index of the max value of vector = the prediction
end

% prediction
errorRate = sum(prediction ~= groundTruth) / testSetRows * 100

end



