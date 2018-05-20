function [data] = descramblerV34(data)

sync = zeros(1,23);
size = length(data);

for i = 1:1:size
    x1823 = xor ( sync(18), sync(23) );
    sync = circshift(sync,1);
    sync(1) = data(i);
    data(i) = xor(x1823, data(i));
end
end