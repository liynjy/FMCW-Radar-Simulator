%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                FMCW Radar Simulator               %
%                                                   %
% Author: Lin Junyang                               %
% Email : linjy@163.com                             %
% Date  : 2019-6-15                                 %
%                                                   %
% All Rights Reserved.                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
clc
clear
%%
[I1,Q1,I2,Q2] = radar_simulation_wrapper;

%%
close all
figure
%%
chirp_sample_idx = randi(size(I1,2));
disp(['Chirp sample index: ',num2str(chirp_sample_idx)])
subplot(2,2,1);plot(I1(chirp_sample_idx,:));ylim([-1,1])
subplot(2,2,2);plot(I2(chirp_sample_idx,:));ylim([-1,1])
subplot(2,2,3);plot(Q1(chirp_sample_idx,:));ylim([-1,1])
subplot(2,2,4);plot(Q2(chirp_sample_idx,:));ylim([-1,1])

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           Develop your Radar Data Processing Algorithm here:           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%