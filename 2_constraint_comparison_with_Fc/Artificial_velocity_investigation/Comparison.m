% This script will compare the short period response (q and alpha) of an
% aircraft that is constrained on a plane with that of aircraft constrained
% on a sphere with radius 0.8m. 
% 
% Then the velocity vector of the sphere constrained aircraft will be 
% artificially corrected to match that of the planar aircraft, and the 
% responses compared again.

clear,clc,close all;

%% Planar constrained aircraft response
load('1_short_period_phugoid_planar');
t1      = aircraft_response.Time;
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

%% Sphere constrained aircraft response
load('2_short_period_phugoid_spherical_0_8');
t2      = aircraft_response.Time;
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

%% Sphere constrained aircraft response with artificial velocity correction
load('3_short_period_phugoid_spherical_0_8_with_artificial_velocity_from_planar_aircraft');
t3      = aircraft_response.Time;
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

%% Plotting
subplot(4,1,1); plot(t1,[q1 q2 q3]); grid; ylabel('q (deg/s)');
subplot(4,1,2); plot(t1,[alpha1 alpha2 alpha3]); grid; ylabel('\alpha (deg)');
subplot(4,1,3); plot(t1,[z1 z2 z3]); grid; ylabel('z (m)');
subplot(4,1,4); plot(t1,dele1); grid; ylabel('\delta_{e} (deg)');
xlabel('Time (s)')
subplot(4,1,1); legend('Planar','Spherical 0.8m','Spherical with artificial planar velocity');
title({'Comparing planar aircraft response with spherical constrained';'aircraft response and including artificial planar velocity'});

%% Probing
time = 3.0;
time_index = (t1 == time);
q1(time_index),q2(time_index),q3(time_index) % Shows that q1 = q3, i.e. using the artificial velocity gives the same pitch rate response
% Alpha is the same because the velocities are the same (artificially)

RMS_error = sqrt(sum((q1-q3).^2)/length(q1)) % RMS error between q1 and q3 is zero, confirming that they are exactly the same
