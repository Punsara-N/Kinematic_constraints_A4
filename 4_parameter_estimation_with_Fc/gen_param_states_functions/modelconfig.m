function [ config ] = modelconfig( file_name )
% This function will retrieve the model trim configurations for a given test
% number
%
% config:
%   theta_trim (deg)
%   dele_trim (deg)
%   thrust (N)
%   constraint_type

config_thrust_on.theta_trim  = 1.612;
config_thrust_on.dele_trim   = -1.22537;
config_thrust_on.thrust_trim = 2.037;

config_thrust_off.theta_trim  = 1.632;
config_thrust_off.dele_trim   = -1.2402;
config_thrust_off.thrust_trim = 0;

%% Input type
% 1 = short period
% 3 = roll subsidence
% 4 = spiral
% 5 = dutch roll
if isempty(strfind(file_name,'short_period_phugoid')) == 0
    input_type = 1;
    total_time = 10; % 30;
    disp('Input type: short period/phugoid');
    sp_freq1 = 1.673*3; % Hz, used when input is a sin wave (starting frequency)
    sp_freq2 = 1.673*3; % Hz, used when input is a sin wave (ending frequency)
    firstimpulsewidthdoublet = 0.15; % s, the first impulse time width of the doublet input signal
    firstimpulsewidth3211 = 0.3; % s, the first impulse time width of the 3-2-1-1 input signal
elseif isempty(strfind(file_name,'roll_subsidence')) == 0
    input_type = 3;
    total_time = 10;
    disp('Input type: roll subsidence');
elseif isempty(strfind(file_name,'spiral')) == 0
    input_type = 4;
    total_time = 10;
    disp('Input type: spiral');
elseif isempty(strfind(file_name,'dutch_roll')) == 0
    input_type = 5;
    total_time = 10;
    disp('Input type: dutch roll');
else
    disp('Cannot determine input type!');
    disp(' ');
    config = [];
    return;
end

%% Constraint type
% 1 = unconstrained
% 2 = spherical constraint
% 3 = planar constraint
% 5 = position fixed
if isempty(strfind(file_name,'unconstrained')) == 0
    constraint_type = 1;
    disp('Constraint type: unconstrained');
elseif isempty(strfind(file_name,'spherical_constrained')) == 0
    constraint_type = 2;
    disp('Constraint type: spherical constrained');
elseif isempty(strfind(file_name,'planar_constrained')) == 0
    constraint_type = 3;
    disp('Constraint type: planar constrained');
elseif isempty(strfind(file_name,'fixed')) == 0
    constraint_type = 5;
    disp('Constraint type: position fixed');
else
    disp('Cannot determine constraint type!');
    disp(' ');
    config = [];
    return;
end

%% Thrust on/off
if isempty(strfind(file_name,'no_thrust')) == 0
    theta_trim = config_thrust_off.theta_trim;
    dele_trim = config_thrust_off.dele_trim;
    thrust_trim = config_thrust_off.thrust_trim;
    disp('Thrust: off');
elseif isempty(strfind(file_name,'no_thrust')) == 1
    theta_trim = config_thrust_on.theta_trim;
    dele_trim = config_thrust_on.dele_trim;
    thrust_trim = config_thrust_on.thrust_trim;
    disp('Thrust: on');
else
 	disp('Cannot determine thrust!');
    disp(' ');
    config = [];
    return;
end
disp(['Trim pitch = ' num2str(theta_trim) ' deg']);
disp(['Trim elevator = ' num2str(dele_trim) ' deg']);
disp(['Thrust = ' num2str(thrust_trim) ' N']);

%% F_c on/off
if isempty(strfind(file_name,'with_Fc')) == 0
    comp_feedack = 1;
    disp('F_c: on');
else
    comp_feedack = 0;
    disp('F_c: off');
end

%% Spherical constraint radius
if isempty(strfind(file_name,'spherical_constrained_0_6')) == 0
    radius = 0.6;
elseif isempty(strfind(file_name,'spherical_constrained_0_8')) == 0
    radius = 0.8;
elseif isempty(strfind(file_name,'spherical_constrained_1_0')) == 0
    radius = 1.0;
else
    radius = 0;
end
disp(['Radius = ' num2str(radius) ' m (only for spherical constraint)']);

%% Model configuration

if input_type == 1 % Short-period
    config = [ 
        theta_trim
        dele_trim
        thrust_trim
        input_type
        constraint_type
        comp_feedack
        radius
        total_time
        sp_freq1
        sp_freq2
        firstimpulsewidthdoublet
        firstimpulsewidth3211
        ];
else
    config = [ 
        theta_trim
        dele_trim
        thrust_trim
        input_type
        constraint_type
        comp_feedack
        radius
        total_time
        0
        0
        0
        0
        ];
end

end

% % Test number as a string
% if test_number < 10
%     test_number_string = ['0' num2str(test_number)];
% else
%     test_number_string = num2str(test_number);
% end

% filename = [test_number_string '*.mat']; % Eg: 05*.mat
% files = dir(filename);
% if isempty(files) == 1
%     disp(['Skipping test case ' test_number_string]);
%     continue_flag = 1;
% else
%     disp(['Test case: ' test_number_string]);
%     disp(' ');
%     for i = 1:length(files)
%         disp(files(i).name);
%     end
%     disp(' ');
%     continue_flag = 0;
% end