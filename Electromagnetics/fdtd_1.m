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
                 n = 300;    % exploratory, just to see boundary.
time = [1:1:n];  % Vector of time.
time_index = 0; % initialised to 0.
k = 200;    % 200 spatial steps (length of 200 specified in pdf).

ex = zeros(1,k);  % Empty electric field
hy = zeros(1,k);  % Empty magnetic field

t_naught = 40;  % t_naught was a parameter in the original. 
p_l = 100;  % place of pulse

ex_max = 0;     % max ex value initialised to 0
hy_max = 0;     % max hy value initialised to 0

ex_max_vector = zeros(1, length(time));
hy_max_vector = zeros(1, length(time));
pulse_vector = zeros(1, length(time));


%% Magnetic and electric field calculations

for time_index = time

    % Calculating electric field
    ex(2:1:k) = ex(2:1:k) + 0.5*(hy(1:1:(k-1)) - hy(2:1:k));  
    ex_max = max(ex);
    ex_max_vector(time_index) = max(ex);

    pulse = exp(-0.5*((t_naught - time_index)/12)^2);  % Calculating pulse
    ex(p_l) = pulse;    % assigning pulse to middle of distance (100th element)
    pulse_vector(time_index) = pulse;

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
    xlim([0, 150]);
    ylim([-1, 1]);


    % Max H through time plot
    subplot(3,2,4); 
    scatter(time, hy_max_vector);     % Plotting the signal against time.
    xlabel('Time'); ylabel('max hy field');   % labelling.
    title('max hy plotted against time', ...
    'Brian Wang a1798086');    % Title 
    xlim([0, 150]);
    ylim([-1, 1]);

    

    % Signal plot
    subplot(3,2,5); 
    scatter(time, pulse_vector);     % Plotting the signal against time.
    xlabel('Time'); ylabel('pulse amplitude');   % labelling.
    grid on;    % grid
    title('Eletric field at every point across time', ...
    'Brian Wang a1798086');    % Title 

    pause(0.00001);

end


    %% Answers to Questions

%   Q1 Propagation direction and direction of the electric and magnetic fields?

%   A1 The propagation direction is in the z axis. Electric field is along the x direction. The magnetic field is along the y direction.
    


%   Q2 What happens at the end of the boundary?

%   A2 Both the electric and magnetic field gets reflected at the left and
%   right boundaries while signs are inversed. The signs are inversed
%   because when you start stepping backwards, the order of addition is
%   wrong way around. It makes sense propagating outwards but when going
%   the other direction, you should swap the k and k-1s around. If you
%   don't then you will get the negative of the actual reflection. Even
%   though there isn't supposed to be a reflection!! Thus, we need boundary
%   conditions.