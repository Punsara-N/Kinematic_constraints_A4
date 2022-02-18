function excel_save(data_file,data1,data2,data3,filename)

% filename = 'Estimated_aerodynamic_parameters_EEM.xlsx';
sheet = 'Sheet1';
% xlRange = 'B3:N6';

% data_file = '01_short_period_phugoid_unconstrained_param_states';

constraint_type = data_file;
mode = data_file;

save_success = 1;

% Adjusting significant figures
sf = 3;
data1 = sigfig(data1,sf);
data2 = sigfig(data2,sf);
data3 = sigfig(data3,sf);

%% Columns
if isempty(strfind(constraint_type,'unconstrained')) == 0
    column = 'C';
elseif isempty(strfind(constraint_type,'planar')) == 0 && isempty(strfind(constraint_type,'no_thrust')) == 0
    column = 'E';
elseif isempty(strfind(constraint_type,'spherical_constrained_0_8_no_Fc')) == 0 && isempty(strfind(constraint_type,'no_thrust')) == 1
    % column = 'G';
    save_success = 0;
elseif isempty(strfind(constraint_type,'spherical_constrained_0_8_no_Fc_no_thrust')) == 0
    column = 'G';
elseif isempty(strfind(constraint_type,'spherical_constrained_0_8_with_Fc_no_thrust')) == 0
    column = 'I';
else
    disp(' ');
    disp('Constraint type could not be identified!');
    disp(' ');
    save_success = 0;
end

%% Rows
if isempty(strfind(mode,'short_period')) == 0
    row = { '3'  '6'
        '8'  '9'
        '11' '14' };
elseif isempty(strfind(mode,'roll_subsidence')) == 0
    row = { '18' '18'
        '20' '23'
        '25' '28' };
elseif isempty(strfind(mode,'spiral')) == 0
    row = { '32' '33'
        '35' '38'
        '40' '43' };
elseif isempty(strfind(mode,'dutch_roll')) == 0
    row = { '47' '48'
        '50' '53'
        '55' '58' };
else
    disp(' ');
    disp('Mode type could not be identified!');
    disp(' ');
    save_success = 0;
end

%% Custom results for position fixed
if isempty(strfind(constraint_type,'fixed')) == 0 && isempty(strfind(mode,'short_period')) == 0
    data1 = {'-'; '-'; '-'; '-'};
    data2 = {'-'; '-'};
    data3 = [data3(1); data3(2); NaN; data3(3)];
elseif isempty(strfind(constraint_type,'fixed')) == 0 && isempty(strfind(mode,'roll_subsidence')) == 0
 	data1 = {'-'};
elseif isempty(strfind(constraint_type,'fixed')) == 0 && isempty(strfind(mode,'spiral')) == 0
    data1 = {'-'; '-'};
elseif isempty(strfind(constraint_type,'fixed')) == 0 && isempty(strfind(mode,'dutch_roll')) == 0
    data1 = {'-'; '-'};
end

%% Excel write
if save_success == 1
    disp(' ');
    disp('Saving resuts...');
    xlRange = [column row{1,1} ':' column row{1,2}];
    xlswrite(filename,data1,sheet,xlRange)
    
    xlRange = [column row{2,1} ':' column row{2,2}];
    xlswrite(filename,data2,sheet,xlRange)
    
    xlRange = [column row{3,1} ':' column row{3,2}];
    xlswrite(filename,data3,sheet,xlRange)
    
    disp('Results saved to excel file!');
else
    disp('Results not saved!');
end
disp(' ');

end