% Generate a wavelet signal using the Wavelet Toolbox

%clear,clc,close all

%% For short-period excitation

reqfreq = 1.673; % Hz, required frequency of wavelet
centfreqmorl = 0.8125; % Morlet wavelet central frequency
centfreqmeyer = 0.6902; % Hz, Meyer wavelet central frequency

scalemorl = reqfreq/centfreqmorl;
scalemeyer = reqfreq/centfreqmeyer;

% Morlet wavelet
[psi1,xval1] = wavefun('morl');
xval1 = xval1./scalemorl;

% Meyer wavelet
[phi2,psi2,xval2] = meyer(-8,8,1024); % phi is the scaling function, psi is the wavelet function
xval2 = xval2./scalemeyer;

% Signal sent to Simulink (Morlet)
waveletSP.time = (xval1 - xval1(1))';
waveletSP.signals.values = psi1';
 
% Performing Fast Fourier Transform

% FFT of Morlet wavelet
start_time  = xval1(1);
end_time    = xval1(end);
start_index = find(xval1 == start_time);
end_index	= find(xval1 == end_time);

fig = figure;
subplot(2,1,1);
plot(xval1(start_index:end_index),psi1(start_index:end_index),'r-'); hold on; title('$\psi$ vs $x$','Interpreter','latex'); xlabel('$x$','Interpreter','latex'); ylabel('$\psi$','Interpreter','latex'); grid on;
response = psi1(start_index:end_index);
title_label = 'FFT';
X = response - mean(response); % Signal to be decomposed
sampling_freq = 1/(xval1(2)-xval1(1)); % Hz
len = length(X);
fast_fourier = fft(X);
P2 = abs(fast_fourier/len); % Two-sided spectrum P2
P1 = P2(1:len/2+1); % Single-sided spectrum P1
P1(2:end-1) = 2*P1(2:end-1);
f = sampling_freq*(0:(len/2))/len;
subplot(2,1,2);
plot(f,P1,'r-'); hold on; title(title_label); xlabel('f (Hz)'); ylabel('Amplitude'); grid on;

% FFT of Meyer wavelet
start_time  = xval2(1);
end_time    = xval2(end);
start_index = find(xval2 == start_time);
end_index	= find(xval2 == end_time);


subplot(2,1,1);
plot(xval2(start_index:end_index),psi2(start_index:end_index),'b-'); hold on; title('$\psi$ vs $x$','Interpreter','latex'); xlabel('$x$','Interpreter','latex'); ylabel('$\psi$','Interpreter','latex'); grid on;
response = psi2(start_index:end_index);
legend('Morlet', 'Mayer');
title_label = 'FFT';
X = response - mean(response); % Signal to be decomposed
sampling_freq = 1/(xval2(2)-xval2(1)); % Hz
len = length(X);
fast_fourier = fft(X);
P2 = abs(fast_fourier/len); % Two-sided spectrum P2
P1 = P2(1:len/2+1); % Single-sided spectrum P1
P1(2:end-1) = 2*P1(2:end-1);
f = sampling_freq*(0:(len/2))/len;
subplot(2,1,2);
plot(f,P1,'b-'); hold on; title(title_label); xlabel('f (Hz)'); ylabel('Amplitude'); grid on;
legend('Morlet', 'Mayer');

%% For Dutch roll excitation

reqfreq = 1.999; % Hz, required frequency of wavelet
centfreqmorl = 0.8125; % Morlet wavelet central frequency
centfreqmeyer = 0.6902; % Hz, Meyer wavelet central frequency

scalemorl = reqfreq/centfreqmorl;
scalemeyer = reqfreq/centfreqmeyer;

% Morlet wavelet
[psi1,xval1] = wavefun('morl');
xval1 = xval1./scalemorl;

% Meyer wavelet
[phi2,psi2,xval2] = meyer(-8,8,1024); % phi is the scaling function, psi is the wavelet function
xval2 = xval2./scalemeyer;

% Signal sent to Simulink (Morlet)
waveletDR.time = (xval1 - xval1(1))';
waveletDR.signals.values = psi1';

% Performing Fast Fourier Transform

% FFT of Morlet wavelet
start_time  = xval1(1);
end_time    = xval1(end);
start_index = find(xval1 == start_time);
end_index	= find(xval1 == end_time);

fig = figure;
subplot(2,1,1);
plot(xval1(start_index:end_index),psi1(start_index:end_index),'r-'); hold on; title('$\psi$ vs $x$','Interpreter','latex'); xlabel('$x$','Interpreter','latex'); ylabel('$\psi$','Interpreter','latex'); grid on;
response = psi1(start_index:end_index);
title_label = 'Dutch roll input FFT';
X = response - mean(response); % Signal to be decomposed
sampling_freq = 1/(xval1(2)-xval1(1)); % Hz
len = length(X);
fast_fourier = fft(X);
P2 = abs(fast_fourier/len); % Two-sided spectrum P2
P1 = P2(1:len/2+1); % Single-sided spectrum P1
P1(2:end-1) = 2*P1(2:end-1);
f = sampling_freq*(0:(len/2))/len;
subplot(2,1,2);
plot(f,P1,'r-'); hold on; title(title_label); xlabel('f (Hz)'); ylabel('Amplitude'); grid on;

% FFT of Meyer wavelet
start_time  = xval2(1);
end_time    = xval2(end);
start_index = find(xval2 == start_time);
end_index	= find(xval2 == end_time);


subplot(2,1,1);
plot(xval2(start_index:end_index),psi2(start_index:end_index),'b-'); hold on; title('$\psi$ vs $x$','Interpreter','latex'); xlabel('$x$','Interpreter','latex'); ylabel('$\psi$','Interpreter','latex'); grid on;
response = psi2(start_index:end_index);
legend('Morlet', 'Mayer');
title_label = 'FFT';
X = response - mean(response); % Signal to be decomposed
sampling_freq = 1/(xval2(2)-xval2(1)); % Hz
len = length(X);
fast_fourier = fft(X);
P2 = abs(fast_fourier/len); % Two-sided spectrum P2
P1 = P2(1:len/2+1); % Single-sided spectrum P1
P1(2:end-1) = 2*P1(2:end-1);
f = sampling_freq*(0:(len/2))/len;
subplot(2,1,2);
plot(f,P1,'b-'); hold on; title(title_label); xlabel('f (Hz)'); ylabel('Amplitude'); grid on;
legend('Morlet', 'Mayer');


%% Making Mayer wavelet from equation (for curiosity)

LB = -5;
UB = 5;
N = 2^10;

% Frequency to excite: 1.673 Hz
lowerfreq = 1*2*pi; % 2*pi/3;
midfreq   = 2*2*pi; % 4*pi/3;
upperfreq = 3*2*pi; % 8*pi/3;

lint = (UB-LB)/2/pi;
w    = (-N:2:N-2)/(2*lint);
wa = abs(w);

% w = linspace(-10,10,2^10)';
phi = zeros(length(w),1);
psi = zeros(length(w),1);

for i = 1:length(w)
   
    
	x1 = (3*abs(w(i))/(2*pi))-1;
    x2 = (3*abs(w(i))/(4*pi))-1;
    
    % Auxiliary function, this is the same as the function "meyeraux"
    if x1 < 0
        v1 = 0;
    elseif x1 > 1
        v1 = 1;
    else
        v1 = 35*x1^4 - 84*x1^5 + 70*x1^6 - 20*x1^7;
    end
   
    if x2 < 0
       v2 = 0;
    elseif x2 > 1
       v2 = 1;
    else
       v2 = 35*x2^4 - 84*x2^5 + 70*x2^6 - 20*x2^7;
    end
   
    if wa(i) <= lowerfreq
       phi(i) = 1/(sqrt(2*pi));
    elseif wa(i) <= midfreq && wa(i) >= lowerfreq
       phi(i) = (1/(sqrt(2*pi)))*cos((pi/2)*v1);
    else
       phi(i) = 0;
    end
    
    if wa(i) <= midfreq && wa(i) >= lowerfreq
       %psi(i) = (1/(sqrt(2*pi)))*sin((pi/2)*v1)*exp(1i*w(i)/2);
       psi(i) = sin((pi/2)*v1)*exp(1i*w(i)/2);
    elseif wa(i) <= upperfreq && wa(i) >= midfreq
       %psi(i) = (1/(sqrt(2*pi)))*cos((pi/2)*v2)*exp(1i*w(i)/2);
       psi(i) = cos((pi/2)*v2)*exp(1i*w(i)/2);
    else
       psi(i) = 0;
    end
   
end

% figure;
% subplot(3,1,1); plot(w/(2*pi),phi); grid on; xlabel('$w (Hz)$','Interpreter','latex'); ylabel('$\phi_{mey}(w)$','Interpreter','latex'); title('Meyer wavelet construction')
% subplot(3,1,2); plot(w/(2*pi),abs(psi)); grid on; xlabel('$w (Hz)$','Interpreter','latex'); ylabel('$\psi_{mey}(w)$','Interpreter','latex')

% Compute psi using non standard inverse FFT.
[psi2,t] = instdfft(psi',LB,UB);
% subplot(3,1,3); plot(t,psi2); grid on; xlabel('$t (s)$','Interpreter','latex'); ylabel('$\psi_{mey}(t)$','Interpreter','latex')

close all