%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                FMCW Radar Simulator               %
%      Multi-lane, Multi-vehicle Traffic Radar      %
%                                                   %
% Author: Lin Junyang                               %
% Email : linjy@163.com                             %
% Date  : 2021-1-16                                 %
%                                                   %
% All Rights Reserved.                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%
[TotalChirpNum,ChirpLen] = size(I1);
rx0_c = double(I1) + double(Q1)*1j;
rx0_c(:,2048) = 0;
ChirpLen = 2048;

%%
% Range FFT

RANGE_MIN = 50;
RANGE_MAX = 280;
DSize = 128; 

rx0_range_fft = zeros(DSize,ChirpLen);
for k=1:DSize
    rx0_range_fft(k,:) = fft(rx0_c(k,:).*hamming(2048)');
end
rx0_range_fft(:,1:RANGE_MIN) = 0;

rx0_rd = zeros(DSize,RANGE_MAX);
for k=RANGE_MIN:RANGE_MAX
    rx0_rd(:,k) = fftshift(fft(rx0_range_fft(:,k).*hamming(DSize)));
end

figure
subplot(211)
imagesc(log(abs(rx0_range_fft(:,RANGE_MIN:RANGE_MAX))));xlabel('range');ylabel('chirp number')
subplot(212)
imagesc(log(abs(rx0_rd(:,RANGE_MIN:RANGE_MAX))));xlabel('range');ylabel('velocity')

%%
disp(" Range dopplor analysis of a sample frame...")
disp(" ")
pause(1)