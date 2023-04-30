%% File Description
% Created by: Brian Wang
% Student ID: a1798086
% Date Created: 29/10/2021 (DD/MM/YYYY)
% Date Last Modified: 02/11/2021

% This file contains decoding of a bird hum puzzle using filtering to
% filter out noises.
% 
% Please contact me for the problems as I cannot release assignment pdf, 
% they are IP of the University of Adelaide.

%% Q2a
load('DSP2021_assignment3_v2.mat'); % input

% plotting signal against time
x2_length = length(x2); % find length of signal
t = 1:1:x2_length; % create time signal of same length
figure(1);
stem(t, x2); % plotting signal against time. time is supposed to be seconds
xlabel('n (seconds)');
ylabel('x2[n]');
title('signal x2[n] plotted against n');

% plotting spectral density
fs = 500; % sampling frequency
dft_length = x2_length; % sample dft at same number of points as signal!
dft = fft(x2, dft_length); % calculate dft
mag_sqr = (abs(dft)).^2; % calculating spectral density
fd = linspace(0,1,x2_length); % plot dft on 10000 digital frequencies

figure(3);
plot(fd, 20*log(mag_sqr)); % doesn't contain mirror image due to editted xlim
xlim([0,0.5]);
xlabel('f_d');
ylabel('spectral density (|H|^2) (log scale in dB)');
title('Spectral density plotted against fd', 'vertical axis is logarithmic scale');


%% Q2b
B = [1,-1.6180, 1];
A = 1;
% freqz(B, A, 10000, 'whole', 1); % this generates the plot
[H, W] = freqz(B, A, 10000, 'whole', 1); % plotting magnitude response of digital filter!
% indeed we see a dip at when digital frequency = 0.1Hz!

%% Q2c
dftx2 = H.*dft;
x2_filtered = ifft(dftx2, 10000);

% plotting signal against time
figure(4);
stem(t, x2_filtered); % plotting signal against time. time is supposed to be seconds
xlabel('n (seconds)');
ylabel('x2[n]');
title('filtered signal x2[n] plotted against n');

% plotting spectral density
x2_filtered_length = length(x2_filtered);
fs = 500; % sampling frequency
dft_length = x2_filtered_length; % sample dft at same number of points as signal!
dft_filtered = fft(x2_filtered, dft_length); % calculate dft
mag_sqr_filtered = (abs(dft_filtered)).^2; % calculating spectral density
fd = linspace(0,1,x2_length); % plot dft on 10000 digital frequencies

figure(5);
plot(fd, 20*log(mag_sqr_filtered)); % doesn't contain mirror image due to editted xlim
xlim([0,0.5]);
xlabel('f_d');
ylabel('spectral density after filtering(|H|^2) (log scale in dB)');
title('Spectral density plotted against fd for filtered signal', 'vertical axis is logarithmic scale');

%% Q2d r=0.8
B = [1,-1.6180, 1];
A = [1,-1.2944, 0.64];
%freqz(B, A, 10000, 'whole', 1); % this generates the plot
[H, W] = freqz(B, A, 10000, 'whole', 1); % plotting magnitude response of digital filter!

dftx2 = H.*dft;
x2_filtered = ifft(dftx2, 10000);

% plotting signal against time
figure(9);
stem(t, x2_filtered); % plotting signal against time. time is supposed to be seconds
xlabel('n (seconds)');
ylabel('x2[n]');
title('filtered signal x2[n] plotted against n');

% plotting spectral density
x2_filtered_length = length(x2_filtered);
fs = 500; % sampling frequency
dft_length = x2_filtered_length; % sample dft at same number of points as signal!
dft_filtered = fft(x2_filtered, dft_length); % calculate dft
mag_sqr_filtered = (abs(dft_filtered)).^2; % calculating spectral density
fd = linspace(0,1,x2_length); % plot dft on 10000 digital frequencies

figure(18);
plot(fd, 20*log(mag_sqr_filtered)); % doesn't contain mirror image due to editted xlim
xlim([0,0.5]);
xlabel('f_d');
ylabel('spectral density after filtering(|H|^2) (log scale in dB)');
title('Spectral density plotted against fd for filtered signal', 'vertical axis is logarithmic scale');


%% Q2d r=0.9
B = [1,-1.6180, 1];
A = [1,-1.4526, 0.81];
%freqz(B, A, 10000, 'whole', 1); % this generates the plot
[H, W] = freqz(B, A, 10000, 'whole', 1); % plotting magnitude response of digital filter!
% indeed we see a dip at when digital frequency = 0.1Hz!

dftx2 = H.*dft;
x2_filtered = ifft(dftx2, 10000);

% plotting signal against time
figure(11);
stem(t, x2_filtered); % plotting signal against time. time is supposed to be seconds
xlabel('n (seconds)');
ylabel('x2[n]');
title('filtered signal x2[n] plotted against n');

% plotting spectral density
x2_filtered_length = length(x2_filtered);
fs = 500; % sampling frequency
dft_length = x2_filtered_length; % sample dft at same number of points as signal!
dft_filtered = fft(x2_filtered, dft_length); % calculate dft
mag_sqr_filtered = (abs(dft_filtered)).^2; % calculating spectral density
fd = linspace(0,1,x2_length); % plot dft on 10000 digital frequencies

figure(22);
plot(fd, 20*log(mag_sqr_filtered)); % doesn't contain mirror image due to editted xlim
xlim([0,0.5]);
xlabel('f_d');
ylabel('spectral density after filtering(|H|^2) (log scale in dB)');
title('Spectral density plotted against fd for filtered signal', 'vertical axis is logarithmic scale');


%% Q2d r=0.95
B = [1,-1.6180, 1];
A = [1,-1.5317, 0.9025];
% freqz(B, A, 10000, 'whole', 1); % this generates the plot
[H, W] = freqz(B, A, 10000, 'whole', 1); % plotting magnitude response of digital filter!

dftx2 = H.*dft;
x2_filtered = ifft(dftx2, 10000);

% plotting signal against time
figure(11);
stem(t, x2_filtered); % plotting signal against time. time is supposed to be seconds
xlabel('n (seconds)');
ylabel('x2[n]');
title('filtered signal x2[n] plotted against n');

% plotting spectral density
x2_filtered_length = length(x2_filtered);
fs = 500; % sampling frequency
dft_length = x2_filtered_length; % sample dft at same number of points as signal!
dft_filtered = fft(x2_filtered, dft_length); % calculate dft
mag_sqr_filtered = (abs(dft_filtered)).^2; % calculating spectral density
fd = linspace(0,1,x2_length); % plot dft on 10000 digital frequencies

figure(22);
plot(fd, 20*log(mag_sqr_filtered)); % doesn't contain mirror image due to editted xlim
xlim([0,0.5]);
xlabel('f_d');
ylabel('spectral density after filtering(|H|^2) (log scale in dB)');
title('Spectral density plotted against fd for filtered signal', 'vertical axis is logarithmic scale');

%% Q2d - magnitude responses on the same plot
B = [1,-1.6180, 1];
A = [1,-1.2944, 0.64];
freqz(B, A, 10000, 'whole', 1); % this generates the plot
hold on

B = [1,-1.6180, 1];
A = [1,-1.4526, 0.81];
freqz(B, A, 10000, 'whole', 1); % this generates the plot

B = [1,-1.6180, 1];
A = [1,-1.5317, 0.9025];
freqz(B, A, 10000, 'whole', 1); % this generates the plot

lines = findall(gcf,'type','line');
lines(1).Color = 'red';
lines(2).Color = 'green';
lines(3).Color = 'blue';

legend('blue is filter with r=0.8', 'green is filter with r=0.9', ...
    'red is filter with r=0.95');
xlabel('f_d');
title('Magnitude response of 3 filters with varying r-values', ...
    'vertical axis is logarithmic dB scale');
hold off


%% %% Q2d all time-domain signals
%r =0.8
B = [1,-1.6180, 1];
A = [1,-1.2944, 0.64];
%freqz(B, A, 10000, 'whole', 1); % this generates the plot
[H, W] = freqz(B, A, 10000, 'whole', 1); % plotting magnitude response of digital filter!

dftx2 = H.*dft;
x2_filtered = ifft(dftx2, 10000);


figure(19);
x2_filtered_length = length(x2_filtered);
fs = 500; % sampling frequency
dft_length = x2_filtered_length; % sample dft at same number of points as signal!
dft_filtered = fft(x2_filtered, dft_length); % calculate dft
mag_sqr_filtered = (abs(dft_filtered)).^2; % calculating spectral density
fd = linspace(0,1,x2_length); % plot dft on 10000 digital frequencies
plot(fd, 20*log(mag_sqr_filtered), 'r'); % doesn't contain mirror image due to editted xlim
xlim([0,0.5]);
hold on; 

%r =0.9
B = [1,-1.6180, 1];
A = [1,-1.4526, 0.81];
%freqz(B, A, 10000, 'whole', 1); % this generates the plot
[H, W] = freqz(B, A, 10000, 'whole', 1); % plotting magnitude response of digital filter!
% indeed we see a dip at when digital frequency = 0.1Hz!

dftx2 = H.*dft;
x2_filtered = ifft(dftx2, 10000);

x2_filtered_length = length(x2_filtered);
fs = 500; % sampling frequency
dft_length = x2_filtered_length; % sample dft at same number of points as signal!
dft_filtered = fft(x2_filtered, dft_length); % calculate dft
mag_sqr_filtered = (abs(dft_filtered)).^2; % calculating spectral density
fd = linspace(0,1,x2_length); % plot dft on 10000 digital frequencies
plot(fd, 20*log(mag_sqr_filtered), 'g'); % doesn't contain mirror image due to editted xlim
xlim([0,0.5]);


% r= 0.95
B = [1,-1.6180, 1];
A = [1,-1.5317, 0.9025];
% freqz(B, A, 10000, 'whole', 1); % this generates the plot
[H, W] = freqz(B, A, 10000, 'whole', 1); % plotting magnitude response of digital filter!

dftx2 = H.*dft;
x2_filtered = ifft(dftx2, 10000);

x2_filtered_length = length(x2_filtered);
fs = 500; % sampling frequency
dft_length = x2_filtered_length; % sample dft at same number of points as signal!
dft_filtered = fft(x2_filtered, dft_length); % calculate dft
mag_sqr_filtered = (abs(dft_filtered)).^2; % calculating spectral density
fd = linspace(0,1,x2_length); % plot dft on 10000 digital frequencies
plot(fd, 20*log(mag_sqr_filtered),'b'); % doesn't contain mirror image due to editted xlim
xlim([0,0.5]);
xlabel('f_d');
ylabel('spectral density after filtering (|H|^2) (log scale in dB)');
title('Spectral density for all three filtered signals plotted against fd', 'vertical axis is logarithmic scale');
legend('red is filter with r=0.8', 'green is filter with r=0.9', ...
    'blue is filter with r=0.95');

%%