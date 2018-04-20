function [data] = scrambler(data)

sync = [ 1 0 0 1 0 1 0 1 0 0 0 0 0 0 0 ];
size = length(data);

for i = 1:1:size
    x1415 = xor ( sync(14), sync(15) );
    sync = circshift(sync,1);
    sync(1) = x1415;
    
    data(i) = xor(x1415, data(i));
end
end