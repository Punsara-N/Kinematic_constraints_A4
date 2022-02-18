clear,clc,close all

%% Planar response
load('15_2_spiral_planar_constrained_no_thrust');
% load('11_spiral_unconstrained');
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
load('13_1_2_spiral_spherical_constrained_0_8_no_Fc_no_thrust');
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
load('13_2_2_spiral_spherical_constrained_0_8_with_Fc_no_thrust');
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

% phi RMS
index = (t1>=2 & t1<=3.5); % Index for response between 2s and 3s
RMS_phi_no_Fc = sqrt(sum((phi1(index)-phi2(index)).^2)/(length(phi1(index)))) % Comparing planar response with spherical constraint (no F_c)
RMS_phi_with_Fc = sqrt(sum((phi1(index)-phi3(index)).^2)/(length(phi1(index)))) % Comparing planar response with spherical constraint (with F_c)

% beta RMS
index = (t1>=2 & t1<=3.5); % Index for response between 2s and 3s
RMS_beta_no_Fc = sqrt(sum((beta1(index)-beta2(index)).^2)/(length(beta1(index)))) % Comparing planar response with spherical constraint (no F_c)
RMS_beta_with_Fc = sqrt(sum((beta1(index)-beta3(index)).^2)/(length(beta1(index)))) % Comparing planar response with spherical constraint (with F_c)

% V RMS
index = (t1>=2 & t1<=3.5); % Index for response between 2s and 3s
RMS_V_no_Fc = sqrt(sum((V1(index)-V2(index)).^2)/(length(V1(index)))) % Comparing planar response with spherical constraint (no F_c)
RMS_V_with_Fc = sqrt(sum((V1(index)-V3(index)).^2)/(length(V1(index)))) % Comparing planar response with spherical constraint (with F_c)

% z RMS
index = (t1>=2 & t1<=3.5); % Index for response between 2s and 3s
RMS_z_no_Fc = sqrt(sum((z1(index)-z2(index)).^2)/(length(z1(index)))) % Comparing planar response with spherical constraint (no F_c)
RMS_z_with_Fc = sqrt(sum((z1(index)-z3(index)).^2)/(length(z1(index)))) % Comparing planar response with spherical constraint (with F_c)


% % Between 4.5s and 7s
% disp('Between 4.5s and 7s');
% 
% % q RMS
% index = (t1>=4.5 & t1<=7); % Index for response between 2s and 4.5s
% RMS_r_no_Fc = sqrt(sum((r1(index)-r2(index)).^2)/(length(r1(index)))) % Comparing planar response with spherical constraint (no F_c)
% RMS_r_with_Fc = sqrt(sum((r1(index)-r3(index)).^2)/(length(r1(index)))) % Comparing planar response with spherical constraint (with F_c)
% 
% % alpha RMS
% index = (t1>=4.5 & t1<=7); % Index for response between 2s and 4.5s
% RMS_p_no_Fc = sqrt(sum((p1(index)-p2(index)).^2)/(length(p1(index)))) % Comparing planar response with spherical constraint (no F_c)
% RMS_p_with_Fc = sqrt(sum((p1(index)-p3(index)).^2)/(length(p1(index)))) % Comparing planar response with spherical constraint (with F_c)
% 
% % z RMS
% index = (t1>=4.5 & t1<=7); % Index for response between 2s and 4.5s
% RMS_beta_no_Fc = sqrt(sum((beta1(index)-beta2(index)).^2)/(length(beta1(index)))) % Comparing planar response with spherical constraint (no F_c)
% RMS_beta_with_Fc = sqrt(sum((beta1(index)-beta3(index)).^2)/(length(beta1(index)))) % Comparing planar response with spherical constraint (with F_c)















