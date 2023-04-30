%% Code Introduction
% 
% This MATLAB Script simulates a 1D electromagnetic field in the time 
% domain.
% 
% Created by Brian Wang
% ID: a1798086
% Date: 07/May/2022
% Last updated: 13/May/2022


%% Initialisation
clear;

figure('units','normalized','outerposition',[0 0 1 1]);

n = 150;   % Number of time steps.
                 n = 400;    % exploratory, just to see boundary.
time = [1:1:n];  % Vector of time.
time_index = 0; % initialised to 0.
k = 200;    % 200 spatial steps (length of 200 specified in pdf).

ex = zeros(1,k);  % Empty electric field
hy = zeros(1,k);  % Empty magnetic field

t_naught = 40;  % t_naught was a parameter in the original. 
p_l = 100;  % place of pulse

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



%% Magnetic and electric field calculations

for time_index = time

    % Calculating electric field
    ex(2:1:k) = ex(2:1:k) + 0.5*(hy(1:1:(k-1)) - hy(2:1:k));  
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
    subplot(3,2,1); 
    plot([1:1:200],ex);     % Plotting the signal against time.
    xlabel('distance'); ylabel('ex');   % labelling.
    xlim([0, 200]);
    ylim([-1, 1]);
    title('Electric field at every point across time', ...
    'Brian Wang a1798086');    % Title 


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
    scatter(time, ex_max_vector);     % Plotting the signal against time.
    xlabel('Time'); ylabel('max ex field');   % labelling.
    title('max ex plotted against time', ...
    'Brian Wang a1798086');    % Title
    xlim([0, 400]);
    ylim([-1, 1]);


    % Max H through time plot
    subplot(3,2,4); 
    scatter(time, hy_max_vector);     % Plotting the signal against time.
    xlabel('Time'); ylabel('max hy field');   % labelling.
    title('max hy plotted against time', ...
    'Brian Wang a1798086');    % Title 
    xlim([0, 400]);
    ylim([-1, 1]);

    
    % Signal plot
    subplot(3,2,5); 
    scatter(time, pulse_vector);     % Plotting the signal against time.
    xlabel('Time'); ylabel('pulse amplitude');   % labelling.
    grid on;    % grid
    title('signal pulse between 0 and 400 seconds',...
    'Brian Wang a1798086');    % Title 

    pause(0.00001);

end



%% QnA    %% Answers to Questions

% A1, at the boundary, the electric and magnetic fields are completely
% absorbed, it's as if there was no boundary and the field just continues
% beyond the screen. There are small reverbs if you zoom in. That is
% because of the fixed step size. The calculations always can be more
% accurate the more steps you consider.


% A2, an analogy would be like if we swung a rope and the oscillation ran
% down the rope. However, we can only see a part of the rope and everything
% else is not in our field of vision. It makes however that the rope will
% keep swinging down forever as nothing stops it.
