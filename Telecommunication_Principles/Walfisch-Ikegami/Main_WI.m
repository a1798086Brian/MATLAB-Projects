%% File Description
% Created by: Brian Wang
% Student ID: a1798086
% Date Created: 04/11/2022 (DD/MM/YYYY)
% Date Last Modified: 04/11/2022

% This file is dedicated to the plotting and testing of the WI
% functions.

%% Test cases
% dist = zeros(1, 5);
dist = [0.02 : 0.01 : 5];


%% Distance to Path loss
% L_los
result_PL_1 = Q1_WI_Dist2PL(dist, 950, 0);

% N_los
result_PL_2 = Q1_WI_Dist2PL(dist, 950, 1);


% Plotting
figure(1);
hold on;
plot(dist, result_PL_1);
plot(dist, result_PL_2);
legend('PL__los (rural)', 'PL__nlos (urban)');
xlabel("Distance between Tx and Rx (km)");
ylabel("Path Loss (dB)");
title("Path Loss vs Distance");
hold off; 

%% Path loss to distance

PL = [40 : 0.1 : 150];

% L_los
result_Dist_1 = Q1_WI_PL2Dist(PL, 950, 0);

% N_los
result_Dist_2 = Q1_WI_PL2Dist(PL, 950, 1);


% Plotting
figure(4);
hold on;
plot(PL, result_Dist_1);
plot(PL, result_Dist_2);
legend('PL__los (rural)', 'PL__nlos (urban)');
xlabel("Path Loss (dB)");
ylabel("Distance between Tx and Rx (km)");
title("Distance vs Path loss");
hold off; 


%% Different frequency LOS

% L_los
result_PL_LOS_Freq1 = Q1_WI_Dist2PL(dist, 850, 0);
result_PL_LOS_Freq2 = Q1_WI_Dist2PL(dist, 890, 0);
result_PL_LOS_Freq3 = Q1_WI_Dist2PL(dist, 950, 0);
result_PL_LOS_Freq4 = Q1_WI_Dist2PL(dist, 1700, 0);
result_PL_LOS_Freq5 = Q1_WI_Dist2PL(dist, 1800, 0);
result_PL_LOS_Freq6 = Q1_WI_Dist2PL(dist, 1900, 0);

% Plotting
figure(2);
hold on;
plot(dist, result_PL_LOS_Freq1);
plot(dist, result_PL_LOS_Freq2);
plot(dist, result_PL_LOS_Freq3);
plot(dist, result_PL_LOS_Freq4);
plot(dist, result_PL_LOS_Freq5);
plot(dist, result_PL_LOS_Freq6);
legend('850MHz', '890MHz', '950MHz', '1700MHz', '1800MHz', '1900MHz');
xlabel("Distance between Tx and Rx (km)");
ylabel("Path Loss (dB)");
title("Path Loss vs Distance (LOS)");
hold off; 


%% Different frequency NLOS


% L_nlos
result_PL_LOS_Freq1 = Q1_WI_Dist2PL(dist, 850, 1);
result_PL_LOS_Freq2 = Q1_WI_Dist2PL(dist, 890, 1);
result_PL_LOS_Freq3 = Q1_WI_Dist2PL(dist, 950, 1);
result_PL_LOS_Freq4 = Q1_WI_Dist2PL(dist, 1700, 1);
result_PL_LOS_Freq5 = Q1_WI_Dist2PL(dist, 1800, 1);
result_PL_LOS_Freq6 = Q1_WI_Dist2PL(dist, 1900, 1);

% Plotting
figure(3);
hold on;
plot(dist, result_PL_LOS_Freq1);
plot(dist, result_PL_LOS_Freq2);
plot(dist, result_PL_LOS_Freq3);
plot(dist, result_PL_LOS_Freq4);
plot(dist, result_PL_LOS_Freq5);
plot(dist, result_PL_LOS_Freq6);
legend('850MHz', '890MHz', '950MHz', '1700MHz', '1800MHz', '1900MHz');
xlabel("Distance between Tx and Rx (km)");
ylabel("Path Loss (dB)");
title("Path Loss vs Distance (NLOS)");
hold off; 

