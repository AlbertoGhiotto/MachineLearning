clear

%% OBTAIN A DATA SET
% Loading training and data sets
[training_set, training_labels] = loadMNIST(0);
[test_set, test_labels] = loadMNIST(1);
training = [training_set training_labels];


[n, d] = size(training);
[m, c] = size(test_set);

%% kNN CLASSIFIER
% k = [1, 5, 9, 11, 17, 21, 26, 37, 45];
k = [21:10:201];

distance = pdist2(test_set, training(:, 1:(end-1)), 'euclidean');

error_rate = zeros(max(size(k)), 1);
classification = zeros(m, max(size(k)));

for i=1:max(size(k))
    
    k_sorted = zeros(m, k(i));
    index = zeros(m, k(i));
    for j=1:m
        [k_sorted(j, :), index(j, :)] = mink(distance(j,:), k(i));
    end
    class = zeros(m, k(i));
    for l=1:k(i)
        for j=1:m
            class(j, l) = training(index(j, l), end);
        end
    end
    
    for l=1:m
        classification(l,i) = mode(class(l, :));
    end
    
    % Computing the error rate
    error_rate(i) = (sum(classification(:,i) ~= test_labels))/m;
end





