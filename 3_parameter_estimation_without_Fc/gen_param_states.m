% This script will run the simulation for each configuration and save all
% the param_states files

clear,clc,close all;
warning off;

press_to_continue = 0; % 1: Press enter after each case to continue

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
        ii = ii + 1;
    end
end
for i = 1:5 %1:length(file_list) % length(file_list)-4:length(file_list)
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
    beep;
    disp('Running simulation...');
    sim('constraints_comparison_A_4D_v2');
    disp('Simulation complete!')
    save_file_name = [file_name(1:end-4) '_param_states.mat'];
    save(save_file_name,'param_states');
    save(file_name,'aircraft_response');
    disp('Files saved:');
    disp(file_name);
    disp(save_file_name);
    disp(' ');
    beep;
    if press_to_continue == 1
        disp('PRESS ENTER TO CONTINUE...')
        pause;
    end
end

clc;
disp('Complete!');
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