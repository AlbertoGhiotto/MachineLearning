function func(a)

    if nargin > 0
        disp('Argument is present');
    else
        disp('Argument is NOT present');
    end
    
    
    a = [1 2; 2 3; 3, 4; 2, 3; 2,1 ; 4,1; 1, 3];
    sum(a(:,1)==2)
    % is true whenever there is 2 in the left column
    
    for val=1:max(a(:,2))
        disp((sum(a(:,2) == val)) / size(a,1))
    end
    
    %error rate between two colums
    c1 = (rand(0,1)>.5  +1 )
    
    sum(c1 ~= c2)
    
    index = randperm(14);
    x = rand(14,3);
    trset = x(index(1:10), :);
    testset = x(index(11:end), :);
    
    
    
    
end