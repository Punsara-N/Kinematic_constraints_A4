clear,clc,close all;

load('1_short_period_unconstrained');

%% Variables
t = aircraft_response.Time;

alpha	= aircraft_response.Data(:,1);  % deg
beta    = aircraft_response.Data(:,2);  % deg
u       = aircraft_response.Data(:,3);  % m/s
v       = aircraft_response.Data(:,4);  % m/s
w       = aircraft_response.Data(:,5);  % m/s
p       = aircraft_response.Data(:,6);  % deg/s
q       = aircraft_response.Data(:,7);  % deg/s
r       = aircraft_response.Data(:,8);  % deg/s
dail    = aircraft_response.Data(:,9);  % deg
dele    = aircraft_response.Data(:,10); % deg
drud    = aircraft_response.Data(:,11); % deg
phi   	= aircraft_response.Data(:,12); % deg
theta   = aircraft_response.Data(:,13); % deg
psi     = aircraft_response.Data(:,14); % deg

figure;
subplot(3,1,1); plot(t,q); grid on; ylabel('q (deg/s)'); xlim([0 14]); hold on;
subplot(3,1,2); plot(t,alpha); grid on; ylabel('alpha (deg)'); xlim([0 14]); hold on;
subplot(3,1,3); plot(t,dele); grid on; xlabel('Time (s)'); ylabel('dele (deg)'); xlim([0 14]); hold on;

load('2_short_period_spherical_constrained_0_6');

%% Variables
t = aircraft_response.Time;

alpha	= aircraft_response.Data(:,1);  % deg
beta    = aircraft_response.Data(:,2);  % deg
u       = aircraft_response.Data(:,3);  % m/s
v       = aircraft_response.Data(:,4);  % m/s
w       = aircraft_response.Data(:,5);  % m/s
p       = aircraft_response.Data(:,6);  % deg/s
q       = aircraft_response.Data(:,7);  % deg/s
r       = aircraft_response.Data(:,8);  % deg/s
dail    = aircraft_response.Data(:,9);  % deg
dele    = aircraft_response.Data(:,10); % deg
drud    = aircraft_response.Data(:,11); % deg
phi   	= aircraft_response.Data(:,12); % deg
theta   = aircraft_response.Data(:,13); % deg
psi     = aircraft_response.Data(:,14); % deg

subplot(3,1,1); plot(t,q); grid on; ylabel('q (deg/s)'); xlim([0 14]); hold on;
subplot(3,1,2); plot(t,alpha); grid on; ylabel('alpha (deg)'); xlim([0 14]); hold on;
subplot(3,1,3); plot(t,dele); grid on; xlabel('Time (s)'); ylabel('dele (deg)'); xlim([0 14]); hold on;

load('3_short_period_spherical_constrained_0_8');

%% Variables
t = aircraft_response.Time;

alpha	= aircraft_response.Data(:,1);  % deg
beta    = aircraft_response.Data(:,2);  % deg
u       = aircraft_response.Data(:,3);  % m/s
v       = aircraft_response.Data(:,4);  % m/s
w       = aircraft_response.Data(:,5);  % m/s
p       = aircraft_response.Data(:,6);  % deg/s
q       = aircraft_response.Data(:,7);  % deg/s
r       = aircraft_response.Data(:,8);  % deg/s
dail    = aircraft_response.Data(:,9);  % deg
dele    = aircraft_response.Data(:,10); % deg
drud    = aircraft_response.Data(:,11); % deg
phi   	= aircraft_response.Data(:,12); % deg
theta   = aircraft_response.Data(:,13); % deg
psi     = aircraft_response.Data(:,14); % deg

subplot(3,1,1); plot(t,q); grid on; ylabel('q (deg/s)'); xlim([0 14]); hold on;
subplot(3,1,2); plot(t,alpha); grid on; ylabel('alpha (deg)'); xlim([0 14]); hold on;
subplot(3,1,3); plot(t,dele); grid on; xlabel('Time (s)'); ylabel('dele (deg)'); xlim([0 14]); hold on;

load('4_short_period_spherical_constrained_1_0');

%% Variables
t = aircraft_response.Time;

alpha	= aircraft_response.Data(:,1);  % deg
beta    = aircraft_response.Data(:,2);  % deg
u       = aircraft_response.Data(:,3);  % m/s
v       = aircraft_response.Data(:,4);  % m/s
w       = aircraft_response.Data(:,5);  % m/s
p       = aircraft_response.Data(:,6);  % deg/s
q       = aircraft_response.Data(:,7);  % deg/s
r       = aircraft_response.Data(:,8);  % deg/s
dail    = aircraft_response.Data(:,9);  % deg
dele    = aircraft_response.Data(:,10); % deg
drud    = aircraft_response.Data(:,11); % deg
phi   	= aircraft_response.Data(:,12); % deg
theta   = aircraft_response.Data(:,13); % deg
psi     = aircraft_response.Data(:,14); % deg

subplot(3,1,1); plot(t,q); grid on; ylabel('q (deg/s)'); xlim([0 14]); hold on;
subplot(3,1,2); plot(t,alpha); grid on; ylabel('alpha (deg)'); xlim([0 14]); hold on;
subplot(3,1,3); plot(t,dele); grid on; xlabel('Time (s)'); ylabel('dele (deg)'); xlim([0 14]); hold on;

load('5_short_period_planar_constrained');

%% Variables
t = aircraft_response.Time;

alpha	= aircraft_response.Data(:,1);  % deg
beta    = aircraft_response.Data(:,2);  % deg
u       = aircraft_response.Data(:,3);  % m/s
v       = aircraft_response.Data(:,4);  % m/s
w       = aircraft_response.Data(:,5);  % m/s
p       = aircraft_response.Data(:,6);  % deg/s
q       = aircraft_response.Data(:,7);  % deg/s
r       = aircraft_response.Data(:,8);  % deg/s
dail    = aircraft_response.Data(:,9);  % deg
dele    = aircraft_response.Data(:,10); % deg
drud    = aircraft_response.Data(:,11); % deg
phi   	= aircraft_response.Data(:,12); % deg
theta   = aircraft_response.Data(:,13); % deg
psi     = aircraft_response.Data(:,14); % deg

subplot(3,1,1); plot(t,q); grid on; ylabel('q (deg/s)'); xlim([0 14]); hold on;
subplot(3,1,2); plot(t,alpha); grid on; ylabel('alpha (deg)'); xlim([0 14]); hold on;
subplot(3,1,3); plot(t,dele); grid on; xlabel('Time (s)'); ylabel('dele (deg)'); xlim([0 14]); hold on;

subplot(3,1,1);
legend( 'Unconstrained',...
        'Spherical constrained r=0.6m',...
        'Spherical constrained r=0.8m',...
        'Spherical constrained r=1.0m',...
        'Planar constrained')
