%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                FMCW Radar Simulator               %
%                                                   %
% Author: Lin Junyang                               %
% Email : linjy@163.com                             %
% Date  : 2019-6-16                                 %
%                                                   %
% All Rights Reserved.                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
figure;
subplot(3,2,5)
hold on
axis off

x = -4:0.1:4;
y = zeros(size(x));
plot(x,y,'k')
plot(4.2,0,'k>');
text(3.4,1.5,'X');

y = 0:0.1:10;
x = zeros(size(y));
plot(x,y,'k')
plot(0,10.3,'k^');
text(0.5,9.7,'Y');

plot(-1,0,'bx');text(-1.9,-1,'rx1')
plot(1,0,'bx');text(1,-1,'rx2')
plot(0,0,'b*');text(-0.3,-1,'tx')

plot(0,8,'rx');plot(-5,8,'r<');plot(5,8,'r>');
plot(3,8,'ro');
x = -5:0.1:5;
y = ones(size(x))*8;
plot(x,y,'r:')
text(3.2,8.3,'\rightarrow');

x = -1:0.1:3;
y = 2*x+2;
plot(x,y,'r:')

x = 0:0.1:3;
y = 8/3*x;
plot(x,y,'r:')

x = 1:0.1:3;
y = 4*x-4;
plot(x,y,'r:')

xlim([-6 6]);ylim([-1 11])
hold off

%%
subplot(3,2,6)
hold on
axis off
ylim([-1 6])

x = -10:0.1:10;
y = zeros(size(x));
plot(x,y,'k')
plot(10.5,0,'k>');
text(11.5,0.1,'Time');

y = 0:0.1:4;
x = zeros(size(y))-10;
plot(x,y,'k')
plot(-10,4.2,'k^');
text(-8.8,4.5,'TX Frequency');

x = -10:0.1:10;
y = mod(0.6*(x),2)+1;
plot(x,y,'k')

%%
if ~exist('I1','var') || ~exist('Q1','var') || ~exist('I2','var') || ~exist('Q2','var')
    [I1,Q1,I2,Q2] = radar_simulation_wrapper;
    close all
end

[TotalChirpNum,ChirpLen] = size(I1);

rx1_c = I1 + Q1*1j;
rx2_c = I2 + Q2*1j;

%%
% Range FFT

RANGE_MIN = 0;
RANGE_MAX = 16;

rx1_range_fft = zeros(TotalChirpNum,1024);
rx2_range_fft = zeros(TotalChirpNum,1024);
tmp = zeros(1,ChirpLen);
for k=1:TotalChirpNum
    for m=1:ChirpLen
        tmp(m)=rx1_c(k,m)/((m+1)/ChirpLen)^0.3;
    end
    rx1_range_fft(k,:) = fft((tmp(301:1324)-mean(tmp(301:1324))).*hamming(1024)');
    
    for m=1:ChirpLen
        tmp(m)=rx2_c(k,m)/((m+1)/ChirpLen)^0.3;
    end
    rx2_range_fft(k,:) = fft((tmp(301:1324)-mean(tmp(301:1324))).*hamming(1024)');
end
rx1_range_fft(:,1:RANGE_MIN) = 0;
rx2_range_fft(:,1:RANGE_MIN) = 0;

eng_rx1_rfft = abs(rx1_range_fft(:,1:RANGE_MAX));
eng_rx2_rfft = abs(rx2_range_fft(:,1:RANGE_MAX));

% figure
% subplot(2,1,1)
% mesh(eng_rx1_rfft);
% subplot(2,1,2)
% mesh(eng_rx2_rfft);

%%
% Dopplor FFT

DLP_FFT_SIZE = 32;
DLP_FFT_INTVERAL = 32;

rx1_dpl_fft = zeros(DLP_FFT_SIZE,RANGE_MAX);
rx2_dpl_fft = zeros(DLP_FFT_SIZE,RANGE_MAX);
for chirp_idx=1:DLP_FFT_INTVERAL:TotalChirpNum-DLP_FFT_SIZE-DLP_FFT_INTVERAL
    rx1_rfft_clip = rx1_range_fft(chirp_idx:chirp_idx+DLP_FFT_SIZE-1,1:RANGE_MAX);
    rx2_rfft_clip = rx2_range_fft(chirp_idx:chirp_idx+DLP_FFT_SIZE-1,1:RANGE_MAX);
    
    for k=1:RANGE_MAX
        rx1_dpl_fft(:,k) = fftshift(fft(rx1_rfft_clip(:,k)));
        rx2_dpl_fft(:,k) = fftshift(fft(rx2_rfft_clip(:,k)));
        
        rx1_dpl_fft(DLP_FFT_SIZE/2+1,k) = 0;
        rx2_dpl_fft(DLP_FFT_SIZE/2+1,k) = 0;
    end
    
    eng_rx1_df = abs(rx1_dpl_fft);
    eng_rx2_df = abs(rx2_dpl_fft);
    eng_rx_df = eng_rx1_df.*eng_rx2_df;
    
    subplot(3,3,[1 2 4 5]);surfc(eng_rx_df);view(0,90);axis off
    title('mix: Range - Speed')
    subplot(3,3,3);surfc(eng_rx1_df);view(0,90);axis off
    title('rx1: Range - Speed')
    subplot(3,3,6);surfc(eng_rx2_df);view(0,90);axis off
    title('rx2: Range - Speed')
    
    
    pause(0.03)
end









