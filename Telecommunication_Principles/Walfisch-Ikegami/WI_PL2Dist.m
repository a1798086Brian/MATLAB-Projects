function Dist = Q1_WI_PL2Dist(PL,f,City)
%% Function Description
% Created by: Brian Wang
% Student ID: a1798086
% Date Created: 04/11/2022 (DD/MM/YYYY)
% Date Last Modified: 04/11/2022

%% Input parameters explanation
% "City" is supposed to be a boolean, that tells us if the environment is
% urban or rural, which affects the line of sight vs nonlight of sight path
% loss.

%% Initialisations
    d_len = length(PL);
    
    Dist_los = zeros(1, d_len);
    L_nlos = zeros(1, d_len);
    L_0 = zeros(1, d_len);
    L_rts = zeros(1, d_len);
    L_msd = zeros(1, d_len);
    L_ori = 0;
    Dist = zeros(1, d_len);

    k_a = zeros(1, d_len);

    h_TX = 30; % AKA h_base
    h_RX = 1.5; % AKA h_mobile
    w = 30; % mean width of streets
    b = 60; % mean separation of building
    h_ROOF = 80; % mean height of buildings
    
    h_TX_Delta = h_TX - h_ROOF;
    h_ROOF_Delta = h_ROOF - h_RX;

    L_bsh = 0;
    k_d = 0;
    k_f = -4 + 0.7*(f/925 - 1); % medium sized city assumed


    %% Calculation of L_msb

    % L_bsk
    if (h_TX > h_ROOF)
        L_bsh = -18*log10(1+h_TX_Delta);
    else
        L_bsh = 0;
    end 

    % k_d
    if (h_TX > h_ROOF)
        k_d = 18;
    else 
        k_d = 18 - (15*(h_TX_Delta/h_ROOF));
    end

    % k_a
    k_a = 54;

    %% Calculation of Distance
    CityVar = City;
    if (CityVar == 0) % LOS
        
        Dist_los = 10.^((PL-42.6-20*log10(f))./(26));
        Dist = Dist_los; % return result

    elseif (CityVar == 1) % NLOS

        Dist_nlos = 10.^(((PL-L_rts)-(32.44 + 20*log10(f) + L_bsh + ...
            k_a + k_f*log10(f) - 9*log10(b)))./(20+k_d));
        Dist = Dist_nlos;
        
    else % If City was given a nonbinary value
        % error
    end

end

