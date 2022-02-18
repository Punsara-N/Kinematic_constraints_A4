clear,clc,close all

%% Unconstrained
load('33_short_period_phugoid_unconstrained');
t0      = aircraft_response.Time;       % s
alpha0	= aircraft_response.Data(:,1);  % deg
beta0  	= aircraft_response.Data(:,2);  % deg
u0     	= aircraft_response.Data(:,3);  % m/s
v0    	= aircraft_response.Data(:,4);  % m/s
w0     	= aircraft_response.Data(:,5);  % m/s
p0    	= aircraft_response.Data(:,6);  % deg/s
q0    	= aircraft_response.Data(:,7);  % deg/s
r0    	= aircraft_response.Data(:,8);  % deg/s
dail0 	= aircraft_response.Data(:,9);  % deg
dele0 	= aircraft_response.Data(:,10); % deg
drud0  	= aircraft_response.Data(:,11); % deg
phi0   	= aircraft_response.Data(:,12); % deg
theta0 	= aircraft_response.Data(:,13); % deg
psi0  	= aircraft_response.Data(:,14); % deg
x0     	= aircraft_response.Data(:,15); % m
y0     	= aircraft_response.Data(:,16); % m
z0     	= aircraft_response.Data(:,17); % m
V0     	= aircraft_response.Data(:,18); % m

%% 0 ms delay
load('27_short_period_phugoid_spherical_constrained_0_8_with_Fc_no_thrust_00delay');
% load('01_short_period_phugoid_unconstrained');
t1      = aircraft_response.Time;       % s
alpha1	= aircraft_response.Data(:,1);  % deg
beta1  	= aircraft_response.Data(:,2);  % deg
u1     	= aircraft_response.Data(:,3);  % m/s
v1    	= aircraft_response.Data(:,4);  % m/s
w1     	= aircraft_response.Data(:,5);  % m/s
p1    	= aircraft_response.Data(:,6);  % deg/s
q1    	= aircraft_response.Data(:,7);  % deg/s
r1    	= aircraft_response.Data(:,8);  % deg/s
dail1 	= aircraft_response.Data(:,9);  % deg
dele1 	= aircraft_response.Data(:,10); % deg
drud1  	= aircraft_response.Data(:,11); % deg
phi1   	= aircraft_response.Data(:,12); % deg
theta1 	= aircraft_response.Data(:,13); % deg
psi1  	= aircraft_response.Data(:,14); % deg
x1     	= aircraft_response.Data(:,15); % m
y1     	= aircraft_response.Data(:,16); % m
z1     	= aircraft_response.Data(:,17); % m
V1     	= aircraft_response.Data(:,18); % m

%% 50 ms delay
load('28_short_period_phugoid_spherical_constrained_0_8_with_Fc_no_thrust_50delay');
t2      = aircraft_response.Time;       % s
alpha2	= aircraft_response.Data(:,1);  % deg
beta2  	= aircraft_response.Data(:,2);  % deg
u2     	= aircraft_response.Data(:,3);  % m/s
v2    	= aircraft_response.Data(:,4);  % m/s
w2     	= aircraft_response.Data(:,5);  % m/s
p2    	= aircraft_response.Data(:,6);  % deg/s
q2    	= aircraft_response.Data(:,7);  % deg/s
r2    	= aircraft_response.Data(:,8);  % deg/s
dail2 	= aircraft_response.Data(:,9);  % deg
dele2 	= aircraft_response.Data(:,10); % deg
drud2  	= aircraft_response.Data(:,11); % deg
phi2   	= aircraft_response.Data(:,12); % deg
theta2 	= aircraft_response.Data(:,13); % deg
psi2  	= aircraft_response.Data(:,14); % deg
x2     	= aircraft_response.Data(:,15); % m
y2     	= aircraft_response.Data(:,16); % m
z2     	= aircraft_response.Data(:,17); % m
V2     	= aircraft_response.Data(:,18); % m

%% 100 ms delay
load('29_short_period_phugoid_spherical_constrained_0_8_with_Fc_no_thrust_100delay');
t3      = aircraft_response.Time;       % s
alpha3	= aircraft_response.Data(:,1);  % deg
beta3  	= aircraft_response.Data(:,2);  % deg
u3   	= aircraft_response.Data(:,3);  % m/s
v3    	= aircraft_response.Data(:,4);  % m/s
w3    	= aircraft_response.Data(:,5);  % m/s
p3     	= aircraft_response.Data(:,6);  % deg/s
q3    	= aircraft_response.Data(:,7);  % deg/s
r3    	= aircraft_response.Data(:,8);  % deg/s
dail3 	= aircraft_response.Data(:,9);  % deg
dele3 	= aircraft_response.Data(:,10); % deg
drud3 	= aircraft_response.Data(:,11); % deg
phi3   	= aircraft_response.Data(:,12); % deg
theta3 	= aircraft_response.Data(:,13); % deg
psi3   	= aircraft_response.Data(:,14); % deg
x3     	= aircraft_response.Data(:,15); % m
y3     	= aircraft_response.Data(:,16); % m
z3     	= aircraft_response.Data(:,17); % m
V3     	= aircraft_response.Data(:,18); % m

%% 150 ms delay
load('30_short_period_phugoid_spherical_constrained_0_8_with_Fc_no_thrust_150delay');
t4      = aircraft_response.Time;       % s
alpha4	= aircraft_response.Data(:,1);  % deg
beta4  	= aircraft_response.Data(:,2);  % deg
u4   	= aircraft_response.Data(:,3);  % m/s
v4    	= aircraft_response.Data(:,4);  % m/s
w4    	= aircraft_response.Data(:,5);  % m/s
p4     	= aircraft_response.Data(:,6);  % deg/s
q4    	= aircraft_response.Data(:,7);  % deg/s
r4    	= aircraft_response.Data(:,8);  % deg/s
dail4 	= aircraft_response.Data(:,9);  % deg
dele4 	= aircraft_response.Data(:,10); % deg
drud4 	= aircraft_response.Data(:,11); % deg
phi4   	= aircraft_response.Data(:,12); % deg
theta4 	= aircraft_response.Data(:,13); % deg
psi4   	= aircraft_response.Data(:,14); % deg
x4     	= aircraft_response.Data(:,15); % m
y4     	= aircraft_response.Data(:,16); % m
z4     	= aircraft_response.Data(:,17); % m
V4     	= aircraft_response.Data(:,18); % m

%% 200 ms delay
load('31_short_period_phugoid_spherical_constrained_0_8_with_Fc_no_thrust_200delay');
t5      = aircraft_response.Time;       % s
alpha5	= aircraft_response.Data(:,1);  % deg
beta5  	= aircraft_response.Data(:,2);  % deg
u5   	= aircraft_response.Data(:,3);  % m/s
v5    	= aircraft_response.Data(:,4);  % m/s
w5    	= aircraft_response.Data(:,5);  % m/s
p5     	= aircraft_response.Data(:,6);  % deg/s
q5    	= aircraft_response.Data(:,7);  % deg/s
r5    	= aircraft_response.Data(:,8);  % deg/s
dail5 	= aircraft_response.Data(:,9);  % deg
dele5 	= aircraft_response.Data(:,10); % deg
drud5 	= aircraft_response.Data(:,11); % deg
phi5   	= aircraft_response.Data(:,12); % deg
theta5 	= aircraft_response.Data(:,13); % deg
psi5   	= aircraft_response.Data(:,14); % deg
x5     	= aircraft_response.Data(:,15); % m
y5     	= aircraft_response.Data(:,16); % m
z5     	= aircraft_response.Data(:,17); % m
V5     	= aircraft_response.Data(:,18); % m

%% 250 ms delay
load('32_short_period_phugoid_spherical_constrained_0_8_with_Fc_no_thrust_250delay');
t6      = aircraft_response.Time;       % s
alpha6	= aircraft_response.Data(:,1);  % deg
beta6  	= aircraft_response.Data(:,2);  % deg
u6   	= aircraft_response.Data(:,3);  % m/s
v6    	= aircraft_response.Data(:,4);  % m/s
w6    	= aircraft_response.Data(:,5);  % m/s
p6     	= aircraft_response.Data(:,6);  % deg/s
q6    	= aircraft_response.Data(:,7);  % deg/s
r6    	= aircraft_response.Data(:,8);  % deg/s
dail6 	= aircraft_response.Data(:,9);  % deg
dele6 	= aircraft_response.Data(:,10); % deg
drud6 	= aircraft_response.Data(:,11); % deg
phi6   	= aircraft_response.Data(:,12); % deg
theta6 	= aircraft_response.Data(:,13); % deg
psi6   	= aircraft_response.Data(:,14); % deg
x6     	= aircraft_response.Data(:,15); % m
y6     	= aircraft_response.Data(:,16); % m
z6     	= aircraft_response.Data(:,17); % m
V6     	= aircraft_response.Data(:,18); % m

%% No Fc
load('39_short_period_phugoid_spherical_constrained_0_8_no_Fc_no_thrust');
t7      = aircraft_response.Time;       % s
alpha7	= aircraft_response.Data(:,1);  % deg
beta7  	= aircraft_response.Data(:,2);  % deg
u7   	= aircraft_response.Data(:,3);  % m/s
v7    	= aircraft_response.Data(:,4);  % m/s
w7    	= aircraft_response.Data(:,5);  % m/s
p7     	= aircraft_response.Data(:,6);  % deg/s
q7    	= aircraft_response.Data(:,7);  % deg/s
r7    	= aircraft_response.Data(:,8);  % deg/s
dail7 	= aircraft_response.Data(:,9);  % deg
dele7 	= aircraft_response.Data(:,10); % deg
drud7 	= aircraft_response.Data(:,11); % deg
phi7   	= aircraft_response.Data(:,12); % deg
theta7 	= aircraft_response.Data(:,13); % deg
psi7   	= aircraft_response.Data(:,14); % deg
x7     	= aircraft_response.Data(:,15); % m
y7     	= aircraft_response.Data(:,16); % m
z7     	= aircraft_response.Data(:,17); % m
V7     	= aircraft_response.Data(:,18); % m

%% Calculating RMS

% q RMS
index = (t1>=0 & t1<=6); % Index for response between 2s and 4s
RMS_q_0msDelay      = sqrt(sum((q0(index)-q1(index)).^2)/(length(q0(index)))) % Comparing unconstrained response with spherical constraint
RMS_q_50msDelay     = sqrt(sum((q0(index)-q2(index)).^2)/(length(q0(index)))) % Comparing unconstrained response with spherical constraint
RMS_q_100msDelay    = sqrt(sum((q0(index)-q3(index)).^2)/(length(q0(index)))) % Comparing unconstrained response with spherical constraint
RMS_q_150msDelay    = sqrt(sum((q0(index)-q4(index)).^2)/(length(q0(index)))) % Comparing unconstrained response with spherical constraint
RMS_q_200msDelay    = sqrt(sum((q0(index)-q5(index)).^2)/(length(q0(index)))) % Comparing unconstrained response with spherical constraint
RMS_q_250msDelay    = sqrt(sum((q0(index)-q6(index)).^2)/(length(q0(index)))) % Comparing unconstrained response with spherical constraint
RMS_q_noFc          = sqrt(sum((q0(index)-q7(index)).^2)/(length(q0(index)))) % Comparing unconstrained response with spherical constraint

% alpha RMS
index = (t1>=0 & t1<=6); % Index for response between 2s and 4s
RMS_alpha_0msDelay      = sqrt(sum((alpha0(index)-alpha1(index)).^2)/(length(alpha0(index)))) % Comparing unconstrained response with spherical constraint
RMS_alpha_50msDelay     = sqrt(sum((alpha0(index)-alpha2(index)).^2)/(length(alpha0(index)))) % Comparing unconstrained response with spherical constraint
RMS_alpha_100msDelay    = sqrt(sum((alpha0(index)-alpha3(index)).^2)/(length(alpha0(index)))) % Comparing unconstrained response with spherical constraint
RMS_alpha_150msDelay    = sqrt(sum((alpha0(index)-alpha4(index)).^2)/(length(alpha0(index)))) % Comparing unconstrained response with spherical constraint
RMS_alpha_200msDelay    = sqrt(sum((alpha0(index)-alpha5(index)).^2)/(length(alpha0(index)))) % Comparing unconstrained response with spherical constraint
RMS_alpha_250msDelay    = sqrt(sum((alpha0(index)-alpha6(index)).^2)/(length(alpha0(index)))) % Comparing unconstrained response with spherical constraint
RMS_alpha_noFc          = sqrt(sum((alpha0(index)-alpha7(index)).^2)/(length(alpha0(index)))) % Comparing unconstrained response with spherical constraint

% z RMS
index = (t1>=0 & t1<=6); % Index for response between 2s and 4s
RMS_z_0msDelay      = sqrt(sum((z0(index)-z1(index)).^2)/(length(z0(index)))) % Comparing unconstrained response with spherical constraint
RMS_z_50msDelay     = sqrt(sum((z0(index)-z2(index)).^2)/(length(z0(index)))) % Comparing unconstrained response with spherical constraint
RMS_z_100msDelay    = sqrt(sum((z0(index)-z3(index)).^2)/(length(z0(index)))) % Comparing unconstrained response with spherical constraint
RMS_z_150msDelay    = sqrt(sum((z0(index)-z4(index)).^2)/(length(z0(index)))) % Comparing unconstrained response with spherical constraint
RMS_z_200msDelay    = sqrt(sum((z0(index)-z5(index)).^2)/(length(z0(index)))) % Comparing unconstrained response with spherical constraint
RMS_z_250msDelay    = sqrt(sum((z0(index)-z6(index)).^2)/(length(z0(index)))) % Comparing unconstrained response with spherical constraint
RMS_z_noFc          = sqrt(sum((z0(index)-z7(index)).^2)/(length(z0(index)))) % Comparing unconstrained response with spherical constraint

A = [   RMS_q_0msDelay      RMS_q_50msDelay         RMS_q_100msDelay        RMS_q_150msDelay       	RMS_q_200msDelay        RMS_q_250msDelay        RMS_q_noFc
        RMS_alpha_0msDelay  RMS_alpha_50msDelay     RMS_alpha_100msDelay    RMS_alpha_150msDelay    RMS_alpha_200msDelay    RMS_alpha_250msDelay    RMS_alpha_noFc
        RMS_z_0msDelay      RMS_z_50msDelay         RMS_z_100msDelay        RMS_z_150msDelay        RMS_z_200msDelay        RMS_z_250msDelay        RMS_z_noFc        ];
 
A = sigfig(A,3);

disp(' ');
xlRange = 'B3:H5';
filename = 'RMS_error_with_delay_comparison.ods';
disp('Saving resuts...');
xlswrite(filename,A,'Sheet1',xlRange);
disp('Done!');

