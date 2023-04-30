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
                 n = 300;    % exploratory, just to see boundary.
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

epsilon_naught = 8.854e-12;
epsilon = 5;

die_coeff = ones(1, k);     % dieletric coefficients, empty vector
die_coeff(100:1:150) = 1/epsilon;     % dieletric coefficients, empty vector
% The way I do this is slightly different to the textbook. Textbook
% includes the 0.5 inside this coeff, I do not.

%% Axes Creation


    axis manual
    ax1 = subplot(3,2,1); 
    %axis(ax1, [0, 200, -1, 1]);
    axis(ax1, [0, 200, -1, 1]);
    xlabel(ax1,'distance');
    ylabel(ax1, 'ex');   % labelling.
    title(ax1, 'Electric field at every point across time', ...
    'Brian Wang a1798086');    % Title 
 axis manual
%% Magnetic and electric field calculations

for time_index = time
    

    % Calculating electric field
    ex(2:1:k) = ex(2:1:k) + 0.5*die_coeff(2:1:k).*(hy(1:1:(k-1)) - hy(2:1:k));  
    ex_max = max(ex);
    ex_max_vector(time_index) = max(ex);


    % generating pulse signal
    pulse = exp(-0.5*((t_naught - time_index)/12)^2);  % Calculating pulse
    ex(p_l) = pulse;    % assigning pulse to middle of distance (100th element)
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
     axis manual
    plot(ax1, [1:1:200], ex);     % Plotting the signal against time.
   axis manual

    % H field plot at every point through time
    subplot(3,2,2); 
    plot([1:1:200],hy);     % Plotting the signal against time.
    xlabel('distance'); ylabel('hy');   % labelling.
    xlim([0, 200]);
    ylim([-1, 1]);
    title('Magnetic field at every point across time', ...
    'Brian Wang a1798086');    % Title


    % Max E through time plot
    subplot(3,2,3);
    plot(time, ex_max_vector);     % Plotting the signal against time.
    xlabel('Time'); ylabel('max ex field');   % labelling.
    title('max ex plotted against time', ...
    'Brian Wang a1798086');    % Title
    xlim([0, 150]);
    ylim([-1, 1]);


    % Max H through time plot
    subplot(3,2,4); 
    plot(time, hy_max_vector);     % Plotting the signal against time.
    xlabel('Time'); ylabel('max hy field');   % labelling.
    title('max hy plotted against time', ...
    'Brian Wang a1798086');    % Title 
    xlim([0, 150]);
    ylim([-1, 1]);

    
    % Signal plot
    subplot(3,2,5); 
    plot(time, pulse_vector);     % Plotting the signal against time.
    xlabel('Time'); ylabel('pulse amplitude');   % labelling.
    grid on;    % grid
    title('Eletric field at every point across time', ...
    'Brian Wang a1798086');    % Title 

    pause(0.000001);

end
% axis(ax1, [0, 200, -1, 1])
%% Fresnel coefficients calculation




%% QnA    %% Answers to Questions

