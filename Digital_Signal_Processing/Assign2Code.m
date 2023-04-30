%% File Description
% Created by: Brian Wang
% Student ID: a1798086
% Date Created: 12/10/2021 (DD/MM/YYYY)
% Date Last Modified: 12/010/2021

% This file experiments with Fast Fourier Transform to solve problems in
% the frequency domain from assignment. 
% 
% Please contact me for the problems as I cannot release assignment pdf, 
% they are IP of the University of Adelaide.

%% Q1b
A = [1, -0.612, 1.113, 0.495, 0.245];
B = [1, 2.588, 3.508, 2.588, 1];
Nfft = 512;
[H,ff] = freqz(B,A,Nfft,'whole', 1); % Nfft is 256, for convenience reasons, to be a 
                                    % power of 2.
plot(ff,abs(H));
xlabel('f_d'); ylabel('Mag');
grid on;

%% Q1c
A = [1, -0.612, 1.113, 0.495, 0.245];
B = [1, 2.588, 3.508, 2.588, 1];
Nfft = 512;
H1 = freqz(B,A,[0.4, 0.43],1); % Nfft is 256, for convenience reasons, to be a 
                                    % power of 2.
% plot(ff,abs(H));
% xlabel('f_d'); ylabel('Mag');
% grid on;

%% Q2
% inputs to the convolution signals

DFT_detour_time = nan(1, 50);
direct_sum_time = nan(1, 50);
N = 10000;
x = randn(1, N); % randn automatically generates normally distributed 
                     % random values.

for M=[100,500,1000,5000,10000]

    MFFTL = M+N-1; % minimum length of fft (this is how many samples we take
                   % samples we take from DFT) (this is based on the number of
                   % convolution outputs).

    %h = zeros(1, (2*M));
    h = zeros(1, M);
    h(1, 1:M) = (1/M);

    for i=1:50
        tic 
        % fft
        X = fft(x, MFFTL);
        H = fft(h, MFFTL);
        Y = H.*X;
        y = ifft(Y, MFFTL);

        DFT_detour_time(i) = toc;
        % using convolution to check

        tic
        check = conv(h, x); % note, length of check is (M+N-1)
        direct_sum_time(i) = toc;
    end 

    DFT_detour_average = mean(DFT_detour_time)
    direct_sum_average = mean(direct_sum_time)
   
end
%% Q3 a and b
load('DSP2021_assignment2.mat');
dft = fft(x3, 4800);
mag_sqr = (abs(dft)).^2;
digital_frequency = linspace(0,1,4800);
plot(digital_frequency, mag_sqr);

% plot(x3)
sound(x3,1000)


%% Q3 c

segment1 = x3(1:500); 
fft_seg1 = fft(segment1);
figure(1);
f = (1:500)*(1000/4800);
plot(f, abs(fft_seg1).^2);

%%
segment2 = x3(601:1100); 
fft_seg2 = fft(segment2);
figure(2);
f = (1:500)*(1000/4800);
plot(f, abs(fft_seg2).^2);
%%
segment3 = x3(1201:1700); 
fft_seg3 = fft(segment3);
figure(3);
f = (1:500)*(1000/4800);
plot(f, abs(fft_seg3).^2);

segment4 = x3(1801:2300); 
fft_seg4 = fft(segment4);
figure(1);
f = (1:500)*(1000/4800);
plot(f, abs(fft_seg4).^2);

segment5 = x3(2401:2900); 
fft_seg5 = fft(segment5);
figure(1);
f = (1:500)*(1000/4800);
plot(f, abs(fft_seg5).^2);

segment6 = x3(3001:3500); 
fft_seg6 = fft(segment6);
figure(1);
f = (1:500)*(1000/4800);
plot(f, abs(fft_seg6).^2);

segment7 = x3(3601:4100); 
fft_seg7 = fft(segment7);
figure(1);
f = (1:500)*(1000/4800);
plot(f, abs(fft_seg7).^2);

segment8 = x3(4201:4700); 
fft_seg8 = fft(segment8);
figure(1);
f = (1:500)*(1000/4800);
plot(f, abs(fft_seg8).^2);
%% Q5

% part a

[R_a, P_a, K_a] = residuez([1, -1], [1, 4/3, 1/3]);

[R_b, P_b, K_b] = residuez([1, -2], [1, 0.2, -0.08]);

[R_c, P_c, K_c] = residuez([4, -3, 3], [1, -4, -3, 18]);

[R_d, P_d, K_d] = residuez([2], [1, -6, 9])

%% Q6

B = [1, -(5*sqrt(2)+8)/40, sqrt(2)/40];

A = [1, (1/2 - 1/(2*sqrt(2))), (9/16 - 1/(4*sqrt(2))), ...
    (1/32 - 1/(4*sqrt(2))), 1/32];

[R,P,K] = residuez(B,A);
