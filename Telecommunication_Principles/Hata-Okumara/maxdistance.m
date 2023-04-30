%% Function Description
% Created by: Brian Wang
% Student ID: a1798086
% Date Created: 05/09/2022 (DD/MM/YYYY)
% Date Last Modified: 11/09/2022

%% Input parameters explanation
% f is the frequency. h_b is the base height, h_m is the mobile receiver 
% height. Pathloss is the path loss in dB. This function is essentially the
% inverse of the "Hata.m" function.

function max_d = maxdistance(f, h_b, h_m, Pathloss)
    K0 = 0; % db
    % K0 = 10^(K0/10); % linear    
    
    if (f <= 1000)      % 900MHz range
        K1 = 69.55;
        K2 = 26.16;
    else                % 1800MHz range
        K1 = 46.3;
        K2 = 33.9;        
    end
    
    % urban area
    % a_hm = (1.1*log10(f) - 0.7)*h_m - (1.56*log10(f) - 0.8);
    
    % Dense urban area
    a_hm = 3.2*(log10(11.75*h_m)).^2 - 4.97;
    
    a_hm = 0; % only true for Q3 of assignment
    
    max_d = 10.^((Pathloss - (K1 + K2*log10(f) - 13.82*log10(h_b) - ...
        a_hm + K0))./(44.9 - 6.55*log10(h_b)));
end
