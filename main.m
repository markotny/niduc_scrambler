size = 1000000;

figure('Name','DVB');
Data_Z = zeros(1,size);
Data_DVB_Z = scramblerDVB(Data_Z);
subplot(3,2,1)
monitor(Data_DVB_Z,0)
subplot(3,2,2)
monitor(Data_DVB_Z,1)

Data_1 = ones(1,size);
Data_DVB_1 = scramblerDVB(Data_1);
subplot(3,2,3)
monitor(Data_DVB_1,0)
subplot(3,2,4)
monitor(Data_DVB_1,1)

Data_R = randbits(size,0.5);
Data_DVB_R = scramblerDVB(Data_R);
subplot(3,2,5)
monitor(Data_DVB_R,0)
subplot(3,2,6)
monitor(Data_DVB_R,1)


figure('Name','V34');
Data_V34_Z = scramblerV34(Data_Z);
subplot(3,2,1)
monitor(Data_V34_Z,0)
subplot(3,2,2)
monitor(Data_V34_Z,1)

Data_V34_1 = scramblerV34(Data_1);
subplot(3,2,3)
monitor(Data_V34_1,0)
subplot(3,2,4)
monitor(Data_V34_1,1)

Data_V34_R = scramblerV34(Data_R);
subplot(3,2,5)
monitor(Data_V34_R,0)
subplot(3,2,6)
monitor(Data_V34_R,1)


% figure('Name','Descrambling DVB');
% Data_dDVB_Z = scramblerDVB(Data_DVB_Z);
% subplot(3,2,1)
% monitor(Data_dDVB_Z,0)
% subplot(3,2,2)
% monitor(Data_dDVB_Z,1)
% 
% Data_dDVB_1 = scramblerDVB(Data_DVB_1);
% subplot(3,2,3)
% monitor(Data_dDVB_1,0)
% subplot(3,2,4)
% monitor(Data_dDVB_1,1)
% 
% Data_dDVB_R = scramblerDVB(Data_DVB_R);
% subplot(3,2,5)
% monitor(Data_dDVB_R,0)
% subplot(3,2,6)
% monitor(Data_dDVB_R,1)
% 
% 
% figure('Name','Descrambling V34');
% Data_dV34_Z = descramblerV34(Data_V34_Z);
% subplot(3,2,1)
% monitor(Data_dV34_Z,0)
% subplot(3,2,2)
% monitor(Data_dV34_Z,1)
% 
% Data_dV34_1 = descramblerV34(Data_V34_1);
% subplot(3,2,3)
% monitor(Data_dV34_1,0)
% subplot(3,2,4)
% monitor(Data_dV34_1,1)
% 
% Data_dV34_R = descramblerV34(Data_V34_R);
% subplot(3,2,5)
% monitor(Data_dV34_R,0)
% subplot(3,2,6)
% monitor(Data_dV34_R,1)


figure('Name', 'BER');
pr = 0.00;

ber_total = zeros(21,6);

for i = 1:21
    Data_DVB_Z_pr = channel(Data_DVB_Z,pr);
    Data_DVB_1_pr = channel(Data_DVB_1,pr);
    Data_DVB_R_pr = channel(Data_DVB_R,pr);
    Data_V34_Z_pr = channel(Data_V34_Z,pr);
    Data_V34_1_pr = channel(Data_V34_1,pr);
    Data_V34_R_pr = channel(Data_V34_R,pr);
    pr = pr + 0.005;
    
    Data_DVB_Z_pr = scramblerDVB(Data_DVB_Z_pr);
    Data_DVB_1_pr = scramblerDVB(Data_DVB_1_pr);
    Data_DVB_R_pr = scramblerDVB(Data_DVB_R_pr);
    Data_V34_Z_pr = descramblerV34(Data_V34_Z_pr);
    Data_V34_1_pr = descramblerV34(Data_V34_1_pr);
    Data_V34_R_pr = descramblerV34(Data_V34_R_pr);
    
    ber = zeros(1,6);
    for j = 1:size
        if Data_DVB_Z_pr(j) ~= Data_Z(j)
            ber(1) = ber(1) + 1;
        end
        if Data_DVB_1_pr(j) ~= Data_1(j)
            ber(2) = ber(2) + 1;
        end
        if Data_DVB_R_pr(j) ~= Data_R(j)
            ber(3) = ber(3) + 1;
        end
        if Data_V34_Z_pr(j) ~= Data_Z(j)
            ber(4) = ber(4) + 1;
        end
        if Data_V34_1_pr(j) ~= Data_1(j)
            ber(5) = ber(5) + 1;
        end
        if Data_V34_R_pr(j) ~= Data_R(j)
            ber(6) = ber(6) + 1;
        end
    end
    for j = 1:6
        ber(j) = ber(j) / size;
        ber_total(i,j) = ber(j);
    end
end
ber_total = ber_total.';
subplot(2,1,1)
x = 0:0.005:0.1;
plot(x,ber_total(1,1:21),x,ber_total(2,1:21),x,ber_total(3,1:21));
subplot(2,1,2)
plot(x,ber_total(4,1:21),x,ber_total(5,1:21),x,ber_total(6,1:21));
