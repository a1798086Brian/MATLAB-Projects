%% File Description
% Created by: Brian Wang
% Student ID: a1798086
% Date Created: 29/10/2021 (DD/MM/YYYY)
% Date Last Modified: 05/11/2021

% This file contains frequency division multiplexing practice.
% 
% Please contact me for the problems as I cannot release assignment pdf, 
% they are IP of the University of Adelaide.



%% Q3a

% Inputs
fs = 48000; % sampling frequency
load('DSP2021_assignment3_v2.mat');
Pxx = pwelch(x3); % dont really get it
fd = linspace(0,0.5,65537); % 65537 is size of pwelch, so that's why fd is like this

figure(10);
plot(fd,20*log(Pxx'));
xlabel('f_d');
ylabel('estimated power spectral density (log scale in dB)');
title('estimated power spectral density plotted against fd', ...
    'vertical axis is logarithmic scale');
grid on;
grid minor;


%% Q3b - channels input and calculation

% generating a sinusoid at carrier frequency
n = 1:1:384000;
carrier_1 = sin(((2*pi*4000)/48000)*(n))';
carrier_2 = sin(((2*pi*12000)/48000)*(n))';
fd = linspace(0,0.5,65537); % 65537 is size of pwelch, so that's why fd is like this

mixed_signal_1 = x3.*carrier_1;
Pxx1 = pwelch(mixed_signal_1);

mixed_signal_2 = x3.*carrier_2;
Pxx2 = pwelch(mixed_signal_2);

figure(11);
plot(fd,20*log(Pxx1'));
grid on;
grid minor;


%% Q3b - filtering - P-M - Channel 1
% mixing the 2 signals of first channel

% THE FILTER
fp = 2000/48000;
fs = 3000/48000;
N = 512;
h = firpm(N, [0 fp fs 0.5]*2, [1 1 0 0]);

% FILTERING
filtered_signal_1 = filter(h, 1, mixed_signal_1);
sound(filtered_signal_1, 48000);

%% Q3b - filtering - P-M - Channel 2
% mixing the 2 signals of first channel

% THE FILTER
fp = 2000/48000;
fs = 3000/48000;
N = 512;
h = firpm(N, [0 fp fs 0.5]*2, [1 1 0 0]);

% FILTERING
filtered_signal_2 = filter(h, 1, mixed_signal_2);
sound(filtered_signal_2, 48000);



%% Q3b - OTHER Filtering - Elliptic DO NOT SCREENSHOT
% mixing the 2 signals of first channel

% THE FILTER
N = 512;
Ap = 1; % passband ripple = 1dB as per question
As = 60; % stopband attenuation  =60dB
fp = 2000/48000;
fs = 3000/48000;
[N,Wn] = ellipord(2*fp, 2*fs, Ap, As);
[num,den] = ellip(N,Ap,As,Wn);
figure(16);
[H,ff] = freqz(num,den,length(384000),1);

% FILTERING
filtered_signal_1 = filter(num, den, mixed_signal_1);

sound(filtered_signal_1, 48000);



%% Q3b - OTHER Filtering - Kaiser DO NOT SCREENSHOT
% mixing the 2 signals of first channel

% THE FILTER
fc = 0.052083; % set ideal filter cut-off, adjust if necessary
M = 512;     % set half filter length, adjust if necessary
beta = 6.20426;   % kaiser window parameter; adjust if necessary
n = -M:M;
N = 2*M+1;  % N = 2M+1
hd = 2*fc*sinc(2*fc*n); % ideal impulse response
win_kaiser = window(@kaiser, N, beta); % This is the window
h = hd.*win_kaiser'; % designed filter time domain
[H,ff] = freqz(h,1,1024,1); % designed filter in freq domain

% FILTERING
filtered_signal_1 = filter(h, 1, mixed_signal_1);
sound(filtered_signal_1, 48000);



