function [ time_period ] = analysis_time( filename )
% Retreives the start and end time that will be analysed for parameter
% estimation

% Short period cases
if isempty(strfind(filename,'short_period_phugoid')) == 0
    
    time_period = [0 6]; %[2 4]; [0 6];
    %time_period = [2 3.75]; % For checking the effect of evaluation time on estimated parameters
    %time_period = [2 3.5]; % For checking the effect of evaluation time on estimated parameters
    % 2s to 3.5s gave the best accuracy for CL_alpha_dot
    
% Roll subsidence cases
elseif isempty(strfind(filename,'roll_subsidence')) == 0
    
    time_period = [1 1.75];
    
% Spiral cases
elseif isempty(strfind(filename,'spiral')) == 0
    
    time_period = [1 2.75];

% Dutch roll cases
elseif isempty(strfind(filename,'dutch_roll')) == 0
    
    time_period = [0 6]; %[2 4.5];
end

