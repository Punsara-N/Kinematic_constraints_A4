% This script will run the simulation for each configuration and save all
% the param_states files

clear,clc,close all;
warning off;

addpath('gen_param_states_functions');

%% Files to be processed
disp('Files list:');
disp(' ');
file_list_all = dir('*.mat');
% Exclude files with 'param_states' and 'no_X_check' in their name
file_list = [];
ii = 1;
for i = 1:length(file_list_all)
    file_name = file_list_all(i).name;
    if isempty(strfind(file_name,'param_states')) == 1 && isempty(strfind(file_name,'no_X_check')) == 1
        file_list(ii).name = file_name;
        disp([num2str(ii) ' ' file_name])
        ii = ii + 1;
    end
end

% return % To stop script here

% i:
% [29 35 31 33] for short-period parameter tests
% [36 42 38 40] for Dutch roll parameter tests
% 43:49 for investigating effects of delay (short-period)
% 50:53 for investigating effects of delay (Dutch-roll)

for i = 48 % 54 % 43:49 % 50:53 % [29 35 31 33] % [36 42 38 40] % 29:35 % 1:7 % 1:length(file_list) % length(file_list)-4:length(file_list) % 1:7
    clc;
    file_name = file_list(i).name;
    disp(file_name);
    [config] = modelconfig( file_name );
    if isempty(config) == 1
        continue;
    end
    theta_trim = config(1);
    dele_trim = config(2);
    thrust_trim = config(3);
    input_type = config(4);
    constraint_type = config(5);
    comp_feedback = config(6);
    radius = config(7);
    total_time = config(8);
    sp_freq1 = config(9);
    sp_freq2 = config(10);
    firstimpulsewidthdoublet = config(11);
    firstimpulsewidth3211 = config(12);
    FCdelay = config(13);
    beep;
    disp('Running simulation...');
    
%     pause;
%     continue;
    
    if comp_feedback == 1 % if simulating with feedback
    	sim('constraints_comparison_A_4D_v2_Fc_connected');
    else % if simulating without feedback
     	sim('constraints_comparison_A_4D_v2_Fc_disconnected');
    end
    %sim('constraints_comparison_A_4D_v2');
    
    disp('Simulation complete!')
    
    save_file_name = [file_name(1:end-4) '_param_states.mat'];
    save(save_file_name,'param_states');
    save(file_name,'aircraft_response');
    disp('Files saved:');
    disp(file_name);
    disp(save_file_name);
    disp(' ');
    
    beep;
    %disp('PRESS ENTER TO CONTINUE...')
    %pause;
end

% clc;
disp('Parameter generation complete!');
disp(' ');

rmpath('gen_param_states_functions');

% for test_number = 1:3
%     [config,continue_flag] = modelconfig( test_number );
%     
%     % Skip if test case is not valid
%     if continue_flag == 1
%         continue;
%     end
%     
%     disp('Processing...')
% end