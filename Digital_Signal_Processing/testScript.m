%% Q1a

% Time domain Hamming

f_sampling = 48000;
fc = 2500;
N = 192;
n = (-N/2):1:(N/2); % has to be shifted to the centre, hence N/2 is M

hd = 2*fc*sinc(2*fc*n); % ideal impulse response
win_hamm = window(@hamming, N+1)'; % creating window
h = hd.*win_hamm; % convolving to find actual impulse response


figure(1);
stem((0:N),h);
grid on;
xlabel('n');
ylabel('h[n] (impulse response)');
title('Impulse response plotted against time index "n"');

%%

% Freq domain Hamming

figure(2);
[H, ff] = freqz(h,1,2048,1);
%H = H./max(abs(H));
%plot(ff, abs(H)/max(abs(H)));
plot(ff, abs(H));
grid on;
hold on;

