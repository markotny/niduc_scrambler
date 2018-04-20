size = 1000000;

Data = zeros(1,size);
Data = scrambler(Data);
subplot(3,2,1)
monitor(Data,0)
subplot(3,2,2)
monitor(Data,1)

Data = ones(1,size);
Data = scrambler(Data);
subplot(3,2,3)
monitor(Data,0)
subplot(3,2,4)
monitor(Data,1)

Data = randbits(size,0.5);
Data = scrambler(Data);
subplot(3,2,5)
monitor(Data,0)
subplot(3,2,6)
monitor(Data,1)