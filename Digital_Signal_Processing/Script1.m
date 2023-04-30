%% File Description
% Created by: Brian Wang
% Student ID: a1798086
% Date Created: 27/09/2021 (DD/MM/YYYY)
% Date Last Modified: 28/09/2021

% This file uses MATLAB function/objects such as "audioplayer" and "play"
% to transform signals to audio information.
% 
% Please contact me for the problems as I cannot release assignment pdf, 
% they are IP of the University of Adelaide.


%% Q1a
load('DSP2021_assignment1.mat');
fs = 44100;
s1 = audioplayer(x1,fs);
play(s1);

%% Q1b
n = 0:1:59999;
%x2 = cos(((2*pi*44100)/10000)*(n)');
x2 = cos(((2*pi*10000)/44100)*(n)');
figure(1);
stem(n,x2);

xlabel('n');
ylabel('x1');
set(gca, 'YLim', [-1.2 1.2], 'XLim', [0 50]);

%% Q1c
x3=x1.*x2;
s3 = audioplayer(x3,fs);
play(s3);


%% Q2b

D = [ 1, 1, 1, 0, 1, 0, 0, 0;
      1, 1, 1, 0, -1, 0, 0, 0;
      1, 1, -1, 0, 0, 1, 0, 0;
      1, 1, -1, 0, 0, -1, 0, 0;
      1, -1, 0, 1, 0, 0, 1, 0;
      1, -1, 0, 1, 0, 0, -1, 0;
      1, -1, 0, -1, 0, 0, 0, 1;
      1, -1, 0, -1, 0, 0, 0, -1;];
      
D_transpose = transpose(D);

diagonal_matrix = D_transpose * D


x = [6 8 -7 8 3 -8 -4 1];

coefficients = x * D;

normalised_coefficients = (1/8).*coefficients;


%% Q6

x = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0];
y = [100, 100, 100, 100, 100, 100, 100, 100, 100, 100];

y(1) = 1;
y(2) = 0.8;

for i = 3:1:10
    y(i) = x(i) + 0.8*x(i-1) + 0.5*x(i-2);
end       


y = [100, 100, 100, 100, 100, 100, 100, 100, 100, 100];
x = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0];