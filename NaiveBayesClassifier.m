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
%  the number d of columns of the first matrix – 1

[trSetRow, trSetCols] = size(trainSet);
[testSetRow, testSetCols] = size(testSet);

if( (trSetCols -1) ~= testSetCols)
    disp("Error! The train and test set are not correctly dimensioned");

%% Check that no entry in any of the two data sets is <1
for row = 1:trSetRow
    for col = 1:trSetCols
        if (trainSet(row,col) < 1)
            disp("Error! The values in the train test are incosistent");
        end
    end
end

for row = 1:testSetRow
    for col = 1:testSetRow
        if (testSetRow(row,col) < 1)
            disp("Error! The values in the test test are incosistent");
        end
    end
end




