clear,clc,close all;

%%
load('1_short_period_phugoid_unconstrained');

scale_factor = 1;
step = 0;

x1 = 0;
y1 = 0;
z1 = 0;
theta1 = 0;
phi1 = 0;
psi1 = 0;

% trajectory2(x1,y1,z1,theta1,phi1,psi1,scale_factor,step,['gripen',SoR])
% M = trajectory3(x1,y1,z1,theta1,phi1,psi1,scale_factor,step,[selector,'gripen'])
subplot(2,1,1)
M = trajectory3(x1,y1,z1,theta1*pi/180,phi1*pi/180,psi1*pi/180,scale_factor,step,'gripen');
view([-1,1,1])
subplot(2,1,2)
M = trajectory3(x1,y1,z1,theta1*pi/180,phi1*pi/180,psi1*pi/180,scale_factor,step,'simple');
view([-1,1,1])