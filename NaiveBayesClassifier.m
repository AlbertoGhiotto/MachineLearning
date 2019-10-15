function confusionMatrix = NaiveBayesClassifier(trainSet, testSet, groundTruth)

[t, features] = size(testSet);
[measurements, column]= size(trainSet);
%% Check that the number of columns of the second matrix equals 
%  the number d of columns of the first matrix � 1

[trSetRows, trSetCols] = size(trainSet);
[testSetRows, testSetCols] = size(testSet);

if( (trSetCols -1) ~= testSetCols)
    disp("Error! The train and test set are not correctly dimensioned");
end
%% Check that no entry in any of the two data sets is <1  (<0 since we have binary attributes with 0/1 values)

for row = 1:trSetRows
    for col = 1:trSetCols
        if (trainSet(row,col) < 0)
            disp(['Error! The values in the train set in position (', num2str(row),',',num2str(col),') are inconsistent']);
        end
    end
end

for row = 1:testSetRows
    for col = 1:testSetCols
        if (testSet(row,col) < 0)
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

for row = 1:testSetRows
    for c = 1:no_classes
        classes_prob(c) = classesOccur(c,2)/ measurements;   % compute single class probability
        %compute single probability, take them from confusion matrix
        
        attributes_prob =  %probably need another for loop to iterate along the tridim matrix
        
        results(row,c) = classes_prob(c) * 
    end
    
    
end

end

