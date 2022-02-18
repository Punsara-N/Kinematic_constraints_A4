clear,clc,close all

%% Planar response
% load('20_2_dutch_roll_planar_constrained_no_thrust');
load('16_dutch_roll_unconstrained');
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

%% 0 ms delay
load('35_dutch_roll_spherical_constrained_0_8_with_Fc_no_thrust_00delay');
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
load('36_dutch_roll_spherical_constrained_0_8_with_Fc_no_thrust_100delay');
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

%% 200 ms delay
load('37_dutch_roll_spherical_constrained_0_8_with_Fc_no_thrust_200delay');
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

%% Calculating RMS

% Between 2s and 4.5s
disp('Between 2s and 4.5s');

% q RMS
index = (t1>=2 & t1<=4.5); % Index for response between 2s and 4.5s
%RMS_r_no_Fc = sqrt(sum((r1(index)-r2(index)).^2)/(length(r1(index)))) % Comparing planar response with spherical constraint (no F_c)
RMS_r_with_Fc_0delay = sqrt(sum((r1(index)-r2(index)).^2)/(length(r1(index)))) % Comparing planar response with spherical constraint (with F_c)
RMS_r_with_Fc_100delay = sqrt(sum((r1(index)-r3(index)).^2)/(length(r1(index)))) % Comparing planar response with spherical constraint (with F_c)
RMS_r_with_Fc_200delay = sqrt(sum((r1(index)-r4(index)).^2)/(length(r1(index)))) % Comparing planar response with spherical constraint (with F_c)

% alpha RMS
index = (t1>=2 & t1<=4.5); % Index for response between 2s and 4.5s
%RMS_p_no_Fc = sqrt(sum((p1(index)-p2(index)).^2)/(length(p1(index)))) % Comparing planar response with spherical constraint (no F_c)
RMS_p_with_Fc_0delay = sqrt(sum((p1(index)-p2(index)).^2)/(length(p1(index)))) % Comparing planar response with spherical constraint (with F_c)
RMS_p_with_Fc_100delay = sqrt(sum((p1(index)-p3(index)).^2)/(length(p1(index)))) % Comparing planar response with spherical constraint (with F_c)
RMS_p_with_Fc_200delay = sqrt(sum((p1(index)-p4(index)).^2)/(length(p1(index)))) % Comparing planar response with spherical constraint (with F_c)

% z RMS
index = (t1>=2 & t1<=4.5); % Index for response between 2s and 4.5s
% RMS_beta_no_Fc = sqrt(sum((beta1(index)-beta2(index)).^2)/(length(beta1(index)))) % Comparing planar response with spherical constraint (no F_c)
RMS_beta_with_Fc_0delay = sqrt(sum((beta1(index)-beta2(index)).^2)/(length(beta1(index)))) % Comparing planar response with spherical constraint (with F_c)
RMS_beta_with_Fc_100delay = sqrt(sum((beta1(index)-beta3(index)).^2)/(length(beta1(index)))) % Comparing planar response with spherical constraint (with F_c)
RMS_beta_with_Fc_200delay = sqrt(sum((beta1(index)-beta4(index)).^2)/(length(beta1(index)))) % Comparing planar response with spherical constraint (with F_c)













