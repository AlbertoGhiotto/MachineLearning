function normTarget = deNormalizeLabel(target)

normTarget = zeros(max(target),size(target,1));

for i = 1:size(target,1)
    for j = 1:max(target)
        if target(i,1) == j
            normTarget(j,i) = 1;
        end
    end
end

end