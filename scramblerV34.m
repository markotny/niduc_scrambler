function [data] = scramblerV34(data)

sync = zeros(1,23);
size = length(data);

for i = 1:1:size
    x1823 = xor ( sync(18), sync(23) );
    sync = circshift(sync,1);
    xin = xor(x1823, data(i));
    sync(1) = xin;
    data(i) = xin;
end
end