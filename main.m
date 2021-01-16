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

clc;clear
close all

%%
[I0,Q0,I1,Q1,I2,Q2,I3,Q3] = radar_simulation_wrapper;
disp("---------------------------------------------------")
disp(" FMCW Radar Simulation Outputs are:                ")
disp("           [I0,Q0,I1,Q1,I2,Q2,I3,Q3]")
disp("---------------------------------------------------")
%%
data_processing_range_dopplor_sample
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           Develop your Radar Data Processing Algorithm here:           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp("================================================================================")
disp("         1T4R 24G Multi-lane Multi-vechile FMCW Traffic Radar Simulator")
disp("Author  : Lin Junyang")
disp("Version : 1.0")
disp("Date    : 2021/1/16")
disp("--------------------------------------------------------------------------------")
disp("Range detection is simply shown by caculationg FFT of a sample chirp.")
disp("AS A CHALLANGE, can you develop your alogrithm to detect the number of vechiles,")
disp("and the [X position,Y position, Lane number, Velocity] of each vechile.")
disp("================================================================================")

