function [data] = channel(data, pr)

size = length(data);
for i = 1:size
    err = rand(1,1);
    if err < pr
        data(i)=not(data(i));
    end
end
end