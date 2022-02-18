clear,clc,close all;

%%
load('1_short_period_phugoid_unconstrained');

% Variables
t1      = aircraft_response.Time;

alpha1	= aircraft_response.Data(:,1);  % deg
beta1  	= aircraft_response.Data(:,2);  % deg
u1    	= aircraft_response.Data(:,3);  % m/s
v1    	= aircraft_response.Data(:,4);  % m/s
w1    	= aircraft_response.Data(:,5);  % m/s
p1     	= aircraft_response.Data(:,6);  % deg/s
q1     	= aircraft_response.Data(:,7);  % deg/s
r1    	= aircraft_response.Data(:,8);  % deg/s
dail1  	= aircraft_response.Data(:,9);  % deg
dele1  	= aircraft_response.Data(:,10); % deg
drud1  	= aircraft_response.Data(:,11); % deg
phi1   	= aircraft_response.Data(:,12); % deg
theta1 	= aircraft_response.Data(:,13); % deg
psi1   	= aircraft_response.Data(:,14); % deg
x1     	= aircraft_response.Data(:,15); % m
y1     	= aircraft_response.Data(:,16); % m
z1     	= aircraft_response.Data(:,17); % m
V1     	= aircraft_response.Data(:,18); % m

scale_factor = 5;
step = 500;

% trajectory2(x1,y1,z1,theta1,phi1,psi1,scale_factor,step,['gripen',SoR])
% M = trajectory3(x1,y1,z1,theta1,phi1,psi1,scale_factor,step,[selector,'gripen'])
M = trajectory3(x1,y1,z1,theta1*pi/180,phi1*pi/180,psi1*pi/180,scale_factor,step,'simple');
view([0,-1,0])
% view(2)