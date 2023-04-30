%% File Description
% Created by: Brian Wang
% Student ID: a1798086
% Date Created: 29/10/2021 (DD/MM/YYYY)
% Date Last Modified: 07/11/2021

% This file contains periodograms and spectral analysis.
% 
% Please contact me for the problems as I cannot release assignment pdf, 
% they are IP of the University of Adelaide.


%% Q5a
load('DSP2021_assignment3_v2.mat');

% respective signal lengths
N1 = 128;
N2 = 512;
N3 = 2048;

% DFTs
dft1 = fft(x5_1, N1);
dft2 = fft(x5_2, N2);
dft3 = fft(x5_3, N3);

% periodograms
P1 = (1/N1)*((abs(dft1)).^2);
P2 = (1/N2)*((abs(dft2)).^2);
P3 = (1/N3)*((abs(dft3)).^2);

% N number of equally spaced points just for plotting periodograms
% N is the number of samples in P1,P2,and P3 respectively.
n1 = linspace(0,1,length(P1)); 
n2 = linspace(0,1,length(P2));
n3 = linspace(0,1,length(P3));

figure(5);
plot(n1, P1);
grid on;
xlabel('f_d');
ylabel('direct estimate of the spectrum of the signal (the periodogram) (NOT dB scale)');
title('Periodogram against fd on a non=log scale', 'N = 128');

figure(10);
plot(n2, P2);
grid on;
xlabel('f_d');
ylabel('direct estimate of the spectrum of the signal (the periodogram) (NOT dB scale)');
title('Periodogram against fd on a non=log scale', 'N = 512');


figure(15);
plot(n3, P3);
grid on;
xlabel('f_d');
ylabel('direct estimate of the spectrum of the signal (the periodogram) (NOT dB scale)');
title('Periodogram against fd on a non=log scale', 'N = 2048');


%% Q5b

window = randn(1,32); % window size of 32, not sure why 32 RANDOM numbers tho
noverlap = []; % default value, which is 50% overlap
nfft = 32; % FFT size
fs = 1; % sampling rate

[pxx3, w3] = pwelch(x5_3, window, noverlap, nfft, fs);
[pxx2, w2] = pwelch(x5_2, window, noverlap, nfft, fs);
[pxx1, w1] = pwelch(x5_1, window, noverlap, nfft, fs);

figure(16);
hold on;
plot(w1, pxx1);
xlabel('f_d');
ylabel('estimated power spectral density^2)');
title('pwelch Power Spectral Density (PSD) estimate plotted against fd for filtered signal',...
    'window length = 32');
plot(w2, pxx2);
plot(w3, pxx3);
hold off;
legend('PSD1, original signal x5_1 (N=128)', ...
    'PSD2, original signal x5_2 (N=512)', 'PSD3, original signal x5_3 (N=2048)');


%% Q5c

window = randn(1,128); % window size of 32, not sure why 32 RANDOM numbers tho
noverlap = []; % default value, which is 50% overlap
nfft = 128; % FFT size
fs = 1; % sampling rate


[pxx3, w3] = pwelch(x5_3, window, noverlap, nfft, fs);
[pxx2, w2] = pwelch(x5_2, window, noverlap, nfft, fs);
[pxx1, w1] = pwelch(x5_1, window, noverlap, nfft, fs);

figure(17);
hold on;
plot(w1, pxx1);
plot(w2, pxx2);
plot(w3, pxx3);
hold off;
xlabel('f_d');
ylabel('estimated power spectral density^2)');
title('pwelch Power Spectral Density (PSD) estimate plotted against fd for filtered signal',...
    'window length = 128');
legend('PSD1, original signal x5_1 (N=128)', ...
    'PSD2, original signal x5_2 (N=512)', 'PSD3, original signal x5_3 (N=2048)');

















