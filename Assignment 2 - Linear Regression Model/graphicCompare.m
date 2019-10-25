function graphicCompare(dataset)

dimension = size(dataset, 1);
randomDataset = dataset(randperm(dimension), :);

no_subset = 10;

figure;
for i = 1:no_subset
    for j = 1:dimension
        
    
    plot (randomDataset(j:j*i,1), randomDataset(j:j*i,2), 'rx');        % plot points of dataset
    hold on;
    plot (randomDataset(j:j*i,1), slope * randomDataset(j:j*i,1), 'b-' , 'Linewidth', 2);    % plot line with computed slope y = slope * x
    
    end
    
    
end

title(['Comparation of ',N',' subset of the dataset']);

end