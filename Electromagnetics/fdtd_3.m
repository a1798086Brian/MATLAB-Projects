%% Code Introduction
% 
% This MATLAB Script simulates a 1D electromagnetic field in the time 
% domain.
% 
% Created by Brian Wang
% ID: a1798086
% Date: 07/May/2022
% Last updated: 13/May/2022


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

%% Dieletric Initialisation

epsilon_naught = 8.854e-12;     % free space permittivity
mu_naught = (4*pi)*1e-7;        % free space permeability

% Below is self explanatory I think
permeability_freespace = mu_naught;
permittivity_freespace = epsilon_naught;
permeability_dielectric = mu_naught;
permittivity_dielectric = 5*epsilon_naught;

epsilon_relative_dieletric = 20;

die_coeff = ones(1, k);     % dieletric coefficients, empty vector
die_coeff(100:1:150) = 1/epsilon_relative_dieletric;     % dieletric coefficients, empty vector
% The way I do this is slightly different to the textbook. Textbook
% includes the 0.5 inside this coeff, I do not.

%% Magnetic and electric field calculations

for time_index = time

    % Calculating electric field
    ex(2:1:k) = ex(2:1:k) + 0.5*die_coeff(2:1:k).*(hy(1:1:(k-1)) - hy(2:1:k));  
    ex_max = max(ex);
    ex_max_vector(time_index) = max(ex);


    % generating pulse signal
    pulse = exp(-0.5*((t_naught - time_index)/12)^2);  % Calculating pulse
    ex(p_l) = ex(p_l) + pulse;    % assigning pulse to middle of distance (100th element)
    pulse_vector(time_index) = pulse;

    
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






    % E field plot at every point through time
    subplot(3,2,1); 
    plot([1:1:200],ex);     % Plotting the signal against time.
    r_e = rectangle('Position',[100 0 50 1],'Curvature',1);
    r_e.EdgeColor = 'g';
    r_e.LineWidth = 3;
    xlabel('distance'); ylabel('ex');   % labelling.
    xlim([0, k]);
    ylim([-1, 1]);
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
    ylim([-1, 1]);
    title('Magnetic field at every point across time', ...
    'Brian Wang a1798086');    % Title


    % Max E through time plot
    subplot(3,2,3);
    scatter(time, ex_max_vector);     % Plotting the signal against time.
    xlabel('Time'); ylabel('max ex field');   % labelling.
    title('max ex plotted against time', ...
    'Brian Wang a1798086');    % Title
    xlim([0, n]);
    ylim([-1, 1.5]);


    % Max H through time plot
    subplot(3,2,4); 
    scatter(time, hy_max_vector);     % Plotting the signal against time.
    xlabel('Time'); ylabel('max hy field');   % labelling.
    title('max hy plotted against time', ...
    'Brian Wang a1798086');    % Title 
    xlim([0, n]);
    ylim([-1, 2.5]);

    
    % Signal plot
    subplot(3,2,5); 
    scatter(time, pulse_vector);     % Plotting the signal against time.
    xlabel('Time'); ylabel('pulse amplitude');   % labelling.
    grid on;    % grid
    title('signal pulse vs time', ...
    'Brian Wang a1798086');    % Title 

    pause(0.00001);

end

%% Fresnel coefficients calculation

% This is when the wave enters the dieletric
eta_1 = sqrt(mu_naught/epsilon_naught);
eta_2 = sqrt(mu_naught/(5*epsilon_naught));
fprintf('for entering dielectric:');
reflection_coefficient = (eta_2 - eta_1)/(eta_2 + eta_1)
transmission_coefficient = 2*eta_2/(eta_2 + eta_1)
fprintf('\n');

% This is when the wave enters the dieletric
eta_1 = sqrt(mu_naught/(5*epsilon_naught));
eta_2 = sqrt(mu_naught/epsilon_naught);
disp("for leaving dielectric:")
reflection_coefficient = (eta_2 - eta_1)/(eta_2 + eta_1)
transmission_coefficient = 2*eta_2/(eta_2 + eta_1)

%% QnA    %% Answers to Questions

% A1, when the plane wave hits the material, a part of it gets reflected
% while another part transmits inside the wave. It's like a glasses. When
% you look through it, you see a reflection but you also see through it. If
% you go deep enough it's about how the photons interact with material of
% different composition, once again, boiled down to their permittivity and
% permeability.

% A2, the transmitted wave for the electric field is attenuated while for
% the magnetic field is magnified. Why? It's due to the fresnel
% coefficients. Please refer to images to explain. What are they? From 
% previous calculations they are: 
% reflection coefficient = -0.3820
% transmission coefficient = 0.6180

% NOTE fresnel coefficients are for electric fields. For magnetic fields,
% you need to modify it slightly again.
% Compared to the simulation makes sense. The electric field does indeed
% have its sign inverted and attenuated. The transmitted electric field
% also gets attenuated but remains positive.
% The magnetic field also makes sense.

% A3, when the wave leaves the dieletric the same thing happens, where the 
% wave that is currently travelling in the dielectric splits into 2 parts.
% One part reflected, another transmitted back into the free space. This is
% because the phenomenon happens whenever the EM wave travels from one
% dieletric medium to another. In this case, the permittivity and
% permeability is reversed and hence the fresnel coefficients will be
% different. What are they? From previous calculations they are: 
% reflection coefficient = 0.3820
% transmission coefficient = 1.3820
% Once again, compared to the fresnel coefficients, the behaviour is
% expected.




