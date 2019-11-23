clear;

%% Get The Data
% Loading training and data sets
[training_set, training_labels] = loadMNIST(0);
[test_set, test_labels] = loadMNIST(1);
training = [training_set training_labels];


[n, d] = size(training);
[m, c] = size(test_set);

%% Classify the data and get results
k = [1:201];

distance = pdist2(test_set, training(:, 1:(end-1)), 'euclidean');

t = zeros(n, 10);
for i=1:10
    t(:,i) = [training(:, end) == i];
end
classification = zeros(m, max(size(k)));

for y=1:10
    
    for i=1:max(size(k))
        
        k_sorted = zeros(m, k(i));
        index = zeros(m, k(i));
        
        for j=1:m
            [k_sorted(j, :), index(j, :)] = mink(distance(j,:), k(i));
        end
        
        class = zeros(m, k(i));
        for l=1:k(i)
            for j=1:m
                class(j, l) = t(index(j, l), y);
            end
        end
        
        for l=1:m
            classification(l,i) = mode(class(l, :));
        end
        
        
        % Computing the error rate
        error_rate(i) = (sum(classification(:,i) ~= (test_labels==y)))/m;
    end
    result = [k' error_rate'];
    name = 'result_k' + string(k(1)) + '-' + string(k(end)) + '_digit' + string(y) + '.mat';
    save(name, 'result'); % Saving the results
end


