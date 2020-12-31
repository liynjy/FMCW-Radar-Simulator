%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                FMCW Radar Simulator               %
%                                                   %
% Author: Lin Junyang                               %
% Email : liynjy@163.com                             %
% Wechat: liynjy
% Date  : 2020-12-13                                %
%                                                   %
% All Rights Reserved.                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;clear

%%
[I1,Q1,I2,Q2] = radar_simulation_wrapper;
close all

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           Develop your Radar Data Processing Algorithm here:           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('Radar data processing...');
radar_data_processing
disp('Radar data processing finished.');

% disp('Handwave direction analysis...');
% radar_data_analysis_handwave
% disp('Handwave direction analysis finished.');

