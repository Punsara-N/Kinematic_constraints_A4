function [ time_period ] = analysis_time( filename )
% Retreives the start and end time that will be analysed for parameter
% estimation

% Short period cases
if strcmp(filename(1:2), '01') || ...
        strcmp(filename(1:2), '02') || ...
        strcmp(filename(1:2), '03') || ...
        strcmp(filename(1:2), '04') || ...
        strcmp(filename(1:2), '05') || ...
        strcmp(filename(1:2), '21')
    
    time_period = [2 4];

% Roll subsidence cases
elseif strcmp(filename(1:2), '06') || ...
        strcmp(filename(1:2), '07') || ...
        strcmp(filename(1:2), '08') || ...
        strcmp(filename(1:2), '09') || ...
        strcmp(filename(1:2), '10') || ...
        strcmp(filename(1:2), '22')
    
    time_period = [1 1.75];
    
% Spiral cases
elseif strcmp(filename(1:2), '11') || ...
        strcmp(filename(1:2), '12') || ...
        strcmp(filename(1:2), '13') || ...
        strcmp(filename(1:2), '14') || ...
        strcmp(filename(1:2), '15') || ...
        strcmp(filename(1:2), '23')
    
    time_period = [1 2.75];

% Dutch roll cases
elseif strcmp(filename(1:2), '16') || ...
        strcmp(filename(1:2), '17') || ...
        strcmp(filename(1:2), '18') || ...
        strcmp(filename(1:2), '19') || ...
        strcmp(filename(1:2), '20') || ...
        strcmp(filename(1:2), '24')
    
    time_period = [2 4.5];
end

