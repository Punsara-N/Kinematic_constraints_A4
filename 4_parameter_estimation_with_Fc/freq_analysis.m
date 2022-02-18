%% This script analyses the frequency content of the aircraft response. This can be used to calculate the frequency of each mode.

clear,clc,close all

%% Short-period

response_files = {  '01_short_period_phugoid_unconstrained'
                    '05_2_short_period_phugoid_planar_constrained_no_thrust'
                    '03_1_2_short_period_phugoid_spherical_constrained_0_8_no_Fc_no_thrust'
                    '03_2_2_short_period_phugoid_spherical_constrained_0_8_with_Fc_no_thrust'
                    '03_3_short_period_phugoid_spherical_constrained_0_8_no_Fc_no_thrust_no_X_check'
                 };

load(response_files{1});

% Variables
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

deltaT = t1(2)-t1(1); % Time step (s)
alpha_dot = diff(alpha1)/deltaT; % (deg/s)
alpha_dot(end+1) = alpha_dot(end); % So that matrix dimensions are consistent

%% Performing Fast Fourier Transform

start_time  = 2.5;
end_time    = 30;
start_index = find(t1 == start_time);
end_index	= find(t1 == end_time);

fig = figure;
subplot(2,1,1);
plot(t1(start_index:end_index),alpha1(start_index:end_index),'b-');hold on; title('Alpha vs time'); xlabel('t (s)'); ylabel('deg'); grid on;
response = alpha1(start_index:end_index);
title_label = 'Alpha FFT';
leg = ['Alpha FFT'];
X = response - mean(response); % Signal to be decomposed
sampling_freq = 1/deltaT; % Hz
len = length(X);
fast_fourier = fft(X);
P2 = abs(fast_fourier/len); % Two-sided spectrum P2
P1 = P2(1:len/2+1); % Single-sided spectrum P1
P1(2:end-1) = 2*P1(2:end-1);
f = sampling_freq*(0:(len/2))/len;
subplot(2,1,2);
plot(f,P1,'r'); hold on; title(title_label); xlabel('f (Hz)'); ylabel('Amplitude'); grid on; xlim([0 50]);
legend(leg)

% Results: short period frequency is 1.673 Hz

fig = figure;
subplot(2,1,1);
plot(t1(start_index:end_index),alpha_dot(start_index:end_index),'b-');hold on; title('Alpha_dot vs time'); xlabel('t (s)'); ylabel('deg'); grid on;
response = alpha_dot(start_index:end_index);
title_label = 'Alpha_dot FFT';
leg = ['Alpha_dot FFT'];
X = response - mean(response); % Signal to be decomposed
sampling_freq = 1/deltaT; % Hz
len = length(X);
fast_fourier = fft(X);
P2 = abs(fast_fourier/len); % Two-sided spectrum P2
P1 = P2(1:len/2+1); % Single-sided spectrum P1
P1(2:end-1) = 2*P1(2:end-1);
f = sampling_freq*(0:(len/2))/len;
subplot(2,1,2);
plot(f,P1,'r'); hold on; title(title_label); xlabel('f (Hz)'); ylabel('Amplitude'); grid on; xlim([0 50]);
legend(leg)

% Results: short period frequency is 1.673 Hz

%% Dutch roll

response_files = {  '16_dutch_roll_unconstrained'
                    '20_2_dutch_roll_planar_constrained_no_thrust'
                    '18_1_2_dutch_roll_spherical_constrained_0_8_no_Fc_no_thrust'
                    '18_2_2_dutch_roll_spherical_constrained_0_8_with_Fc_no_thrust'
                    '18_3_dutch_roll_spherical_constrained_0_8_no_Fc_no_thrust_no_X_check'
                 };

load(response_files{1});

% Variables
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

deltaT = t1(2)-t1(1); % Time step (s)
alpha_dot = diff(alpha1)/deltaT; % (deg/s)
alpha_dot(end+1) = alpha_dot(end); % So that matrix dimensions are consistent

%% Performing Fast Fourier Transform

start_time  = 2.5;
end_time    = 5;
start_index = find(t1 == start_time);
end_index	= find(t1 == end_time);

fig = figure;
subplot(2,1,1);
plot(t1(start_index:end_index),beta1(start_index:end_index),'b-');hold on; title('Beta vs time'); xlabel('t (s)'); ylabel('deg'); grid on;
response = beta1(start_index:end_index);
title_label = 'Beta FFT';
leg = ['Beta FFT'];
X = response - mean(response); % Signal to be decomposed
sampling_freq = 1/deltaT; % Hz
len = length(X);
fast_fourier = fft(X);
P2 = abs(fast_fourier/len); % Two-sided spectrum P2
P1 = P2(1:len/2+1); % Single-sided spectrum P1
P1(2:end-1) = 2*P1(2:end-1);
f = sampling_freq*(0:(len/2))/len;
subplot(2,1,2);
plot(f,P1,'r'); hold on; title(title_label); xlabel('f (Hz)'); ylabel('Amplitude'); grid on; xlim([0 50]);
legend(leg)

% Results: Dutch roll frequency is 1.999 Hz

fig = figure;
subplot(2,1,1);
plot(t1(start_index:end_index),r1(start_index:end_index),'b-');hold on; title('r vs time'); xlabel('t (s)'); ylabel('deg/s'); grid on;
response = r1(start_index:end_index);
title_label = 'r FFT';
leg = ['r FFT'];
X = response - mean(response); % Signal to be decomposed
sampling_freq = 1/deltaT; % Hz
len = length(X);
fast_fourier = fft(X);
P2 = abs(fast_fourier/len); % Two-sided spectrum P2
P1 = P2(1:len/2+1); % Single-sided spectrum P1
P1(2:end-1) = 2*P1(2:end-1);
f = sampling_freq*(0:(len/2))/len;
subplot(2,1,2);
plot(f,P1,'r'); hold on; title(title_label); xlabel('f (Hz)'); ylabel('Amplitude'); grid on; xlim([0 50]);
legend(leg)

% Results: Dutch roll frequency is 1.999 Hz