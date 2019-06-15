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
function [RX1_CHIRPS_I,RX1_CHIRPS_Q,RX2_CHIRPS_I,RX2_CHIRPS_Q] = radar_simulation_wrapper()

    disp('Generating simulation data...');
    radar_simulation_core
    disp('Simulation data is successfully generated.');
    
end