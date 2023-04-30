    tiledlayout(2,1);   % setting the axis stuff

    % E field plot at every point through time
    subplot(3,2,1); 
    ax1 = nexttile;
    plot(ax1,[1:1:200],ex);     % Plotting the signal against time.
    xlabel('distance'); ylabel('ex');   % labelling.
    title('Electric field at every point across time', ...
    'Brian Wang a1798086');    % Title 


    % H field plot at every point through time
    subplot(3,2,2); 
    ax2 = nexttile;
    plot(ax2,[1:1:200],hy);     % Plotting the signal against time.
    xlabel('distance'); ylabel('hy');   % labelling.
    title('Magnetic field at every point across time', ...
    'Brian Wang a1798086');    % Title

    axis([ax1 ax2],[0 200 -1 1]);
