%% Load dataset and divide in train and test set and class labels
dataset = load('weather.data');       %Load the dataset

[data, cols] = size(dataset);
features = cols -1 ; % take out the class labels from the features
n = 8;
%Divide dataset in:
trainSet = dataset(1:n, 1:features+1);          %train set
testSet = dataset(1:data, 1:features);        %test set
classLabel = dataset(1:data,features);        %class labels (ground truth)

%% Check that the number of columns of the second matrix equals 
%  the number d of columns of the first matrix � 1

[trSetRows, trSetCols] = size(trainSet);
[testSetRows, testSetCols] = size(testSet);

if( (trSetCols -1) ~= testSetCols)
    disp("Error! The train and test set are not correctly dimensioned");
end
%% Check that no entry in any of the two data sets is <1
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

[n_classes, t] = size(classLabel);

classes = classLabel(1,1);  % Initially set classes as only the first element of the class vector
for row = 1:n_classes
   if( classLabel(row,1) ~= classes)
        classes = [classes; classLabel(row,1)];  %append each new element to the class vector
   end
end


