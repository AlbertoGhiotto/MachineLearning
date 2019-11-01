function graphicCompare(dataSet)

dimension = size(dataSet, 1);
randomDataset = dataSet(randperm(dimension), :);

no_subset = 9;
dim_subset = floor(dimension / no_subset);  % Floor the dimension in order to avoid out of range indexing

figure;
sgtitle(['Comparison of ', int2str(no_subset ) ,' subset of the dataset']);
for i = 1:no_subset
    dataSet = randomDataset((dim_subset*i+1-dim_subset) : dim_subset*i,:);
    
    slope = linearRegression(dataSet,0);
    subplot(3,3,i);
    
    plot (dataSet(:,1), dataSet(:,2), 'rx');         % plot points of dataset
    hold on;
    plot (dataSet(:,1), slope * dataSet(:,1), 'b-' , 'Linewidth', 2);   % plot line with computed slope y = slope * x
    hold on;
    title(['Subset #',num2str(i),' - Slope =', num2str(slope) ]);
    
end

end