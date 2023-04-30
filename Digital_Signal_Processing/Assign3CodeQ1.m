%% File Description
% Created by: Brian Wang
% Student ID: a1798086
% Date Created: 29/10/2021 (DD/MM/YYYY)
% Date Last Modified: 30/10/2021

% This file contains instantiation of a kaiser window filder, an FIR 
% filter using the Parks-McClellan method, and an elliptic filter. Filter
% comparisons are made in section e.
% 
% Please contact me for the problems as I cannot release assignment pdf, 
% they are IP of the University of Adelaide.


%% Q1a - Kaiser filter
fc = 0.052083; % set ideal filter cut-off, adjust if necessary
M = 512;     % set half filter length, adjust if necessary
beta = 6.20426;   % kaiser window parameter; adjust if necessary
n = -M:M;
N = 2*M+1;  % N = 2M+1
hd = 2*fc*sinc(2*fc*n); % ideal impulse response
win_kaiser = window(@kaiser, N, beta); % This is the window
h = hd.*win_kaiser'; % designed filter time domain
[H,ff] = freqz(h,1,1024,1); % designed filter in freq domain

figure(5);
plot(ff, 20*log10(abs(H))); 
grid on;
xlabel('f_d');
ylabel('|H| (log scale in dB)');
title('Magnitude response - kaiser');

figure(10);
plot(n, h);
xlabel('n');
ylabel('h[n] (impulse response)');
title('Impulse response plotted against time index "n"');


%% Q1b - Parks-McClellan method
% impulse response

fp = 2000/48000;
fs = 3000/48000;
N = 512;
h = firpm(N, [0 fp fs 0.5]*2, [1 1 0 0]);

figure(7);
stem(0:N,h); 
grid on;
xlabel('n');
ylabel('h[n] (impulse response)');
title('Impulse response plotted against time index "n"');

% frequency response

figure(14);
[H, ff] = freqz(h,1,2048,1);
plot(ff, 20*log10(abs(H)));
grid on;
xlabel('f_d');
ylabel('|H| (log scale in dB)');
title('Magnitude response - PM');


%% Q1c - Elliptic Filters
N = 512;
Ap = 1; % passband ripple = 1dB as per question
As = 60; % stopband attenuation  =60dB
fp = 2000/48000;
fs = 3000/48000;

[N,Wn] = ellipord(2*fp, 2*fs, Ap, As);
[num,den] = ellip(N,Ap,As,Wn);

figure(16);
[H,ff] = freqz(num,den,512,1);
plot(ff, 20*log10(abs(H)));
grid on;
xlabel('f_d');
ylabel('|H| (log scale in dB');
title('Magnitude response - Elliptic IIR Filter');

figure(8);
[H,T] = impz(num,den);
plot(T,H);
grid on;
xlabel('n');
ylabel('h[n] (impulse response)');
title('Impulse response plotted against time index "n"');


%% Q1e - filter comparisons
fc = 0.052083; % set ideal filter cut-off, adjust if necessary
M = 512;     % set half filter length, adjust if necessary
beta = 6.20426;   % kaiser window parameter; adjust if necessary
n = -M:M;
N = 2*M+1;  % N = 2M+1
hd = 2*fc*sinc(2*fc*n); % ideal impulse response
win_kaiser = window(@kaiser, N, beta); % This is the window
h = hd.*win_kaiser'; % designed filter time domain
[H,ff] = freqz(h,1,1024,1); % designed filter in freq domain

h_hp = h.*((-1).^(linspace(1,2*M+1,2*M+1)));
[H_hp,ff] = freqz(h_hp,1,1024,1);

figure(5);
plot(ff, 20*log10(abs(H_hp)));
xlabel('f_d');
ylabel('|H| (log scale in dB)');
title('Magnitude response - kaiser', 'This is now high-pass as per question');

figure(10);
plot(n, h_hp);
xlabel('n');
ylabel('h[n] (impulse response)');
title('Impulse response plotted against time index "n"');