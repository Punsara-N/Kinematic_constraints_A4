clear,clc,close all

%% Planar response
% load('05_2_short_period_phugoid_planar_constrained_no_thrust');
load('01_short_period_phugoid_unconstrained');
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

%% Spherical constraint, r=0.8m (no F_c)
load('03_1_2_short_period_phugoid_spherical_constrained_0_8_no_Fc_no_thrust');
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

%% Spherical constraint, r=0.8m (with F_c)
load('03_2_2_short_period_phugoid_spherical_constrained_0_8_with_Fc_no_thrust');
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

%% Calculating RMS

% q RMS
index = (t1>=2 & t1<=4); % Index for response between 2s and 4s
RMS_q_no_Fc = sqrt(sum((q1(index)-q2(index)).^2)/(length(q1(index)))) % Comparing planar response with spherical constraint (no F_c)
RMS_q_with_Fc = sqrt(sum((q1(index)-q3(index)).^2)/(length(q1(index)))) % Comparing planar response with spherical constraint (with F_c)

% alpha RMS
index = (t1>=2 & t1<=4); % Index for response between 2s and 4s
RMS_alpha_no_Fc = sqrt(sum((alpha1(index)-alpha2(index)).^2)/(length(alpha1(index)))) % Comparing planar response with spherical constraint (no F_c)
RMS_alpha_with_Fc = sqrt(sum((alpha1(index)-alpha3(index)).^2)/(length(alpha1(index)))) % Comparing planar response with spherical constraint (with F_c)

% z RMS
index = (t1>=2 & t1<=4); % Index for response between 2s and 4s
RMS_z_no_Fc = sqrt(sum((z1(index)-z2(index)).^2)/(length(z1(index)))) % Comparing planar response with spherical constraint (no F_c)
RMS_z_with_Fc = sqrt(sum((z1(index)-z3(index)).^2)/(length(z1(index)))) % Comparing planar response with spherical constraint (with F_c)


























