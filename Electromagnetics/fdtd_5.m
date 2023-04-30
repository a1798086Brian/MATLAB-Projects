%% Code Introduction
% 
% This MATLAB Script simulates a 1D electromagnetic field in the time 
% domain.
% 
% Created by Brian Wang
% ID: a1798086
% Date: 07/May/2022
% Last updated: 27/May/2022


%% Basic Initialisation
% Part 1 and part 2
clear;

figure('units','normalized','outerposition',[0 0 1 1]);

n = 150;   % Number of time steps.
                 n = 600;    % exploratory, just to see boundary.
time = [1:1:n];  % Vector of time.
time_index = 0; % initialised to 0.
k = 200;    % 200 spatial steps (length of 200 specified in pdf).

ex = zeros(1,k);  % Empty electric field
hy = zeros(1,k);  % Empty magnetic field

t_naught = 40;  % t_naught was a parameter in the original
p_l = 10;  % place of pulse, changed from 100 to 10 from part 3 onwards

ex_max = 0;     % max ex value initialised to 0
hy_max = 0;     % max hy value initialised to 0


% These vectors are only for plotting. Because Harry recommended to plot
% the vectors at every time step for live action.
ex_max_vector = zeros(1, length(time));
hy_max_vector = zeros(1, length(time));
pulse_vector = zeros(1, length(time));


% holding cells for clearing the boundaries
exholding_cell_left_1 = 0;
exholding_cell_left_2 = 0;
exholding_cell_right_1 = 0;
exholding_cell_right_2 = 0;


THS_freq = 400e6;   % time harmonic sinusoid frequency

c_o = 3e8;  % speed of light in m/s

% PART 5 INITIALISATION
place_holder = 10e7;   % vary this from 0 to 10e7
sigma = zeros(1, k);
sigma(100:1:150) = place_holder;
epsilon_relative_ALL = ones(1, k); % relative permittivity is different 
                                    % inside and outside the dieletric.
epsilon_relative_ALL(100:1:150) = 5;    % inside the dieletric

%% Dieletric Initialisation

epsilon_naught = 8.854e-12;     % free space permittivity
mu_naught = (4*pi)*1e-7;        % free space permeability

% Below is self explanatory I think
permeability_freespace = mu_naught;
permittivity_freespace = epsilon_naught;
permeability_dielectric = mu_naught;
permittivity_dielectric = 5*epsilon_naught;

epsilon_relative_dieletric = 5;

die_coeff = ones(1, k);     % dieletric coefficients, empty vector
die_coeff(100:1:150) = 1/epsilon_relative_dieletric;     % dieletric coefficients, empty vector
% The way I do this is slightly different to the textbook. Textbook
% includes the 0.5 inside this coeff, I do not.

%% Magnetic and electric field calculations

for time_index = time

    % Had to move this bit to the beginning because...
    lambda_naught = c_o/THS_freq;
    cell_size = lambda_naught/10;
    time_step = cell_size/(2*c_o);
    THS = sin(2*pi*THS_freq*time_step*time_index); % time harmonic sinusoid

    % THE PART 5 STUFF !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    int_var = time_step*sigma./(2*epsilon_naught*epsilon_relative_ALL);  % intermediate variable
    ca = (1-int_var)./(1+int_var);   % coefficient a
    cb = 0.5./(epsilon_relative_ALL.*(1+int_var));    % coefficient b

    % Calculating electric field
    ex(2:1:k) = ca(2:1:k).*ex(2:1:k) + cb(2:1:k).*(hy(1:1:(k-1)) - hy(2:1:k));  
    ex_max = max(ex);
    ex_max_vector(time_index) = max(ex);


    % generating pulse signal
    %pulse = exp(-0.5*((t_naught - time_index)/12)^2);  % Calculating pulse
    ex(10) = ex(10) + THS;
    
    
    % cancelling the boundary for ex also wipes the hy too. that's why we
    % only do one of them and put it before hy calculations.
    

    % left boundary clearing
    ex(1) = exholding_cell_left_2;
    exholding_cell_left_2 = exholding_cell_left_1;
    exholding_cell_left_1 = ex(2);

    % right boundary clearing
    ex(k-1) = exholding_cell_right_2;
    exholding_cell_right_2 = exholding_cell_right_1;
    exholding_cell_right_1 = ex(k-2);


    % Calculating magnetic field
    hy(1:1:(k-1)) = hy(1:1:(k-1)) + 0.5*(ex(1:1:(k-1)) - ex(2:1:k));
    hy_max_vector(time_index) = max(hy);


    % finding maxima of ex
    maxima_ex = max(abs(ex));

    % finding minima of ex
    minima_ex = min(abs(ex));

    % finding maxima of hy
    maxima_hy = max(abs(hy));

    % finding minima of hy
    minima_hy = min(abs(hy));



    % E field plot at every point through time
    subplot(3,2,1); 
    plot([1:1:200],ex);     % Plotting the signal against time.
    r_e = rectangle('Position',[100 0 50 1],'Curvature',1);
    r_e.EdgeColor = 'g';
    r_e.LineWidth = 3;
    xlabel('distance'); ylabel('ex');   % labelling.
    xlim([0, k]);
    ylim([-2, 2]);
    title('Electric field at every point across time', ...
    'Brian Wang a1798086');    % Title 


    % H field plot at every point through time
    subplot(3,2,2); 
    plot([1:1:200],hy);     % Plotting the signal against time.
    r_m = rectangle('Position',[100 0 50 1],'Curvature',1);
    r_m.EdgeColor = 'g';
    r_m.LineWidth = 3;
    xlabel('distance'); ylabel('hy');   % labelling.
    xlim([0, k]);
    ylim([-2, 2]);
    title('Magnetic field at every point across time', ...
    'Brian Wang a1798086');    % Title


    % Max E through time plot
    subplot(3,2,3);
    scatter(time, ex_max_vector);     % Plotting the signal against time.
    xlabel('Time'); ylabel('max ex field');   % labelling.
    title('max ex plotted against time', ...
    'Brian Wang a1798086');    % Title
    xlim([0, n]);
    ylim([-1, 2]);


    % Max H through time plot
    subplot(3,2,4); 
    scatter(time, hy_max_vector);     % Plotting the signal against time.
    xlabel('Time'); ylabel('max hy field');   % labelling.
    title('max hy plotted against time', ...
    'Brian Wang a1798086');    % Title 
    xlim([0, n]);
    ylim([-1, 2]);

    
    pulse_vector(time_index) = THS;
    
    % Signal plot
    subplot(3,2,5); 
    scatter(time, pulse_vector);     % Plotting the signal against time.
    xlabel('Time'); ylabel('pulse amplitude');   % labelling.
    grid on;    % grid
    title('sinusoid signal vs time', ...
    'Brian Wang a1798086');    % Title 

    pause(0.00001);

end



%% QnA    %% Answers to Questions

% https://en.wikipedia.org/wiki/Electrical_resistivity_and_conductivity#Resistivity_and_conductivity_of_various_material

% A1, for no conductivity (0), well the behaviour is as we have seen,
% partial reflection and partial transmission. The degree to which
% transmission and reflection occurs depends solely on the permittivity and
% permeability hence fresnel coeffs. In this case, the dielectric is like
% vacuum.

% A3, for high conductivity (7e10), well it behaves more like PEC. so more EM wave
% is reflected and hence the standing waves have a higher ratio. There is
% of course always a little bit of waves that get transmitted, but those
% die out really quickly for conductors. In this case, the dielectric is
% like iron.

% A2, for medium conductivity (0.05), the behaviour is a cross between low and
% high. So more reflection and less transmission. And once the waves are
% transmitted, it is noted that the attenuation is also greater than when 
% there is no conductivity. Hence the EM waves actually die out at some 
% point. More like a PEC basically. In this case, the dielectric is like
% tap water.