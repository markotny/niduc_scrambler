function [ bits ] = randbits(size,treshold)

bits = rand(1,size);
for i = 1:size
    if bits(i) > treshold
        bits(i)=1;
    else
        bits(i)=0;
    end
end
end