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