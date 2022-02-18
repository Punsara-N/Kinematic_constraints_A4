plot_time = 20;

% Variables
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
z       = aircraft_response.Data(:,15); % m
V       = aircraft_response.Data(:,16); % m

figure;
subplot(4,1,1); plot(t,q); grid on; ylabel('q (deg/s)'); xlim([0 plot_time]); hold on;
subplot(4,1,2); plot(t,alpha); grid on; ylabel('\alpha (deg)'); xlim([0 plot_time]); hold on;
subplot(4,1,3); plot(t,z); grid on; ylabel('z (m)'); xlim([0 plot_time]); ylim([-2 2]); hold on;
subplot(4,1,4); plot(t,dele); grid on; xlabel('Time (s)'); ylabel('\delta_e (deg)'); xlim([0 plot_time]); hold on;