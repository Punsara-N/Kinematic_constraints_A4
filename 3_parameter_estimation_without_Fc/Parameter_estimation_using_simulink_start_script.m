clear,clc,close all

% filename = '01_short_period_phugoid_unconstrained_param_states';
% filename = '02_short_period_phugoid_spherical_constrained_0_6_param_states';
% filename = '03_short_period_phugoid_spherical_constrained_0_8_param_states';
% filename = '04_short_period_phugoid_spherical_constrained_1_0_param_states';
% filename = '05_short_period_phugoid_planar_constrained_param_states';
% filename = '21_short_period_phugoid_fixed_param_states';

param_file_list = dir('*param_states.mat');
i = 1; % i = 3 for file: '03_short_period_phugoid_spherical_constrained_0_8_param_states'
filename = param_file_list(i).name;
load(filename);

for ii = 1:size(param_states.Data,1)
    loads(ii,:) = estimated_loads(param_states.Data(ii,:)');
end

time = param_states.Time;

L_estimated = loads(:,1); % (N) (wind axes)
D_estimated = loads(:,2); % (N) (wind axes)
Y_estimated = loads(:,3); % (N) (wind axes)
l_estimated = loads(:,4); % (N.m) (body axes)
m_estimated = loads(:,5); % (N.m) (body axes)
n_estimated = loads(:,6); % (N.m) (body axes)
dail = loads(:,7); % Aileron (rad)
dele = loads(:,8); % Elevator (rad)
drud = loads(:,9); % Rudder (rad)

b_a = loads(end,10); % Wing span (m)f
c_a = loads(end,11); % Reference cord, MAC (m)
S_a = loads(end,12); % Wing area (m^2)
rho = loads(end,13); % Density (kg/m^3)];

V = loads(:,14); % Aircraft total speed (m/s)
p = loads(:,15); % (rad/sec) (body axes)
q = loads(:,16); % (rad/sec) (body axes)
r = loads(:,17); % (rad/sec) (body axes)

alpha_rad = loads(:,18); % (rad)
beta_rad = loads(:,19); % (rad)
deltaT = param_states.Time(2)-param_states.Time(1); % Time step (s)
alpha_dot_temp = diff(alpha_rad)/deltaT; % (rad/s)
%alpha_dot(end+1) = alpha_dot(end); % So that matrix dimensions are consistent
alpha_dot= [alpha_dot_temp; alpha_dot_temp(end)]; % So that matrix dimensions are consistent

% Total coefficients
CL = L_estimated./(0.5*rho*V.^2*S_a);
CD = D_estimated./(0.5*rho*V.^2*S_a);
CY = Y_estimated./(0.5*rho*V.^2*S_a);
Cl = l_estimated./(0.5*rho*V.^2*S_a*b_a);
Cm = m_estimated./(0.5*rho*V.^2*S_a*c_a);
Cn = n_estimated./(0.5*rho*V.^2*S_a*b_a);

time_period = analysis_time(filename);
disp('Analysis start and end times:');
disp(time_period);
startIdx = find(time==time_period(1));
endIdx = find(time==time_period(2));

% -> CL = CL_0 + CL_alpha*alpha + CL_alpha_dot*(c_a/(2*V))*alpha_dot + CL_dele*dele
% CL0             = 0.28;
% CL_alpha        = 3.45;
% CL_alpha_dot    = 0.72;
% CL_q            = 0.0;
% CL_dele         = 0.36;

% Using equation error method to estimate coefficients
X_CL = [ ones(length(alpha_rad(startIdx:endIdx)),1) alpha_rad(startIdx:endIdx) c_a./(2.*V(startIdx:endIdx)).*alpha_dot(startIdx:endIdx) dele(startIdx:endIdx) ];
estimated_CL_coeffs = ((X_CL'*X_CL)\X_CL')*CL(startIdx:endIdx);
disp('Estimated CL coefficients: CL0 CL_alpha CL_alpha_dot CL_dele');
disp(estimated_CL_coeffs);
CL_0            = estimated_CL_coeffs(1)*0;
CL_alpha        = estimated_CL_coeffs(2)*0;
CL_alpha_dot    = estimated_CL_coeffs(3)*0;
CL_dele         = estimated_CL_coeffs(4)*0;

% Data for simulink
t0 = time(startIdx);
V_sim = [time(startIdx:endIdx)-t0 V(startIdx:endIdx)];
alpha_rad_sim = [time(startIdx:endIdx)-t0 alpha_rad(startIdx:endIdx)];
alpha_dot_sim = [time(startIdx:endIdx)-t0 alpha_dot(startIdx:endIdx)];
dele_sim = [time(startIdx:endIdx)-t0 dele(startIdx:endIdx)];

% "Measured" coefficents for comparison with simulated
CL_mesured = CL(startIdx:endIdx);
time_measured = time(startIdx:endIdx) - t0;