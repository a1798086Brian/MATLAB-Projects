%% h_b = 100, h_m = 0.1. 

% uplink 900MHz
f = 900;
h_b = 100;
h_m = 0.1;
d = [0:1:50];
Pathloss = Hata(f, h_b, h_m, d);
plot(d, Pathloss, 'LineWidth',2);

hold on;

% downlink 950MHz
f = 950;
Pathloss = Hata(f, h_b, h_m, d);
plot(d, Pathloss, 'LineWidth',2);


% uplink 1750MHz
f = 1750;
Pathloss = Hata(f, h_b, h_m, d);
plot(d, Pathloss, 'LineWidth',2);

% downlink 1850MHz
f = 1850;
Pathloss = Hata(f, h_b, h_m, d);
plot(d, Pathloss, 'LineWidth',2);
title("Distance vs Path loss");
subtitle("Mobile height = 0.1m, Base Station height = 100m");
xlabel("distance (km)");
ylabel("path loss (dB)");

legend("uplink 900MHz", "downlink 950MHz", "uplink 1750MHz", "downlink 1850MHz");

%% h_b = 100, h_m = 1.5. 

% uplink 900MHz
f = 900;
h_b = 100;
h_m = 1.5;
Pathloss = Hata(f, h_b, h_m, d);
plot(d, Pathloss, 'LineWidth',2);

hold on;

% downlink 950MHz
f = 950;
Pathloss = Hata(f, h_b, h_m, d);
plot(d, Pathloss, 'LineWidth',2);


% uplink 1750MHz
f = 1750;
Pathloss = Hata(f, h_b, h_m, d);
plot(d, Pathloss, 'LineWidth',2);

% downlink 1850MHz
f = 1850;
Pathloss = Hata(f, h_b, h_m, d);
plot(d, Pathloss, 'LineWidth',2);
title("Distance vs Path loss");
subtitle("Mobile height = 1.5m, Base Station height = 100m");
xlabel("distance (km)");
ylabel("path loss (dB)");

legend("uplink 900MHz", "downlink 950MHz", "uplink 1750MHz", "downlink 1850MHz");


%% h_b = 100, h_m = 30. 

% uplink 900MHz
f = 900;
h_b = 100;
h_m = 30;
Pathloss = Hata(f, h_b, h_m, d);
plot(d, Pathloss, 'LineWidth',2);

hold on;

% downlink 950MHz
f = 950;
Pathloss = Hata(f, h_b, h_m, d);
plot(d, Pathloss, 'LineWidth',2);


% uplink 1750MHz
f = 1750;
Pathloss = Hata(f, h_b, h_m, d);
plot(d, Pathloss, 'LineWidth',2);

% downlink 1850MHz
f = 1850;
Pathloss = Hata(f, h_b, h_m, d);
plot(d, Pathloss, 'LineWidth',2);
title("Distance vs Path loss");
subtitle("Mobile height = 30m, Base Station height = 100m");
xlabel("distance (km)");
ylabel("path loss (dB)");

legend("uplink 900MHz", "downlink 950MHz", "uplink 1750MHz", "downlink 1850MHz");


%% h_b = 30, h_m = 1. 

% uplink 900MHz
f = 900;
h_b = 20;
h_m = 1;
Pathloss = Hata(f, h_b, h_m, d);
plot(d, Pathloss, 'LineWidth',2);

hold on;

% downlink 950MHz
f = 950;
Pathloss = Hata(f, h_b, h_m, d);
plot(d, Pathloss, 'LineWidth',2);


% uplink 1750MHz
f = 1750;
Pathloss = Hata(f, h_b, h_m, d);
plot(d, Pathloss, 'LineWidth',2);

% downlink 1850MHz
f = 1850;
Pathloss = Hata(f, h_b, h_m, d);
plot(d, Pathloss, 'LineWidth',2);
title("Distance vs Path loss");
subtitle("Mobile height = 1m, Base Station height = 30m");
xlabel("distance (km)");
ylabel("path loss (dB)");

legend("uplink 900MHz", "downlink 950MHz", "uplink 1750MHz", "downlink 1850MHz");



%% h_b = 120, h_m = 1. 

% uplink 900MHz
f = 900;
h_b = 120;
h_m = 1;
Pathloss = Hata(f, h_b, h_m, d);
plot(d, Pathloss, 'LineWidth',2);

hold on;

% downlink 950MHz
f = 950;
Pathloss = Hata(f, h_b, h_m, d);
plot(d, Pathloss, 'LineWidth',2);


% uplink 1750MHz
f = 1750;
Pathloss = Hata(f, h_b, h_m, d);
plot(d, Pathloss, 'LineWidth',2);

% downlink 1850MHz
f = 1850;
Pathloss = Hata(f, h_b, h_m, d);
plot(d, Pathloss, 'LineWidth',2);
title("Distance vs Path loss");
subtitle("Mobile height = 1m, Base Station height = 120m");
xlabel("distance (km)");
ylabel("path loss (dB)");

legend("uplink 900MHz", "downlink 950MHz", "uplink 1750MHz", "downlink 1850MHz");



%% h_b = 200, h_m = 1. 

% uplink 900MHz
f = 900;
h_b = 200;
h_m = 1;
Pathloss = Hata(f, h_b, h_m, d);
plot(d, Pathloss, 'LineWidth',2);

hold on;

% downlink 950MHz
f = 950;
Pathloss = Hata(f, h_b, h_m, d);
plot(d, Pathloss, 'LineWidth',2);


% uplink 1750MHz
f = 1750;
Pathloss = Hata(f, h_b, h_m, d);
plot(d, Pathloss, 'LineWidth',2);

% downlink 1850MHz
f = 1850;
Pathloss = Hata(f, h_b, h_m, d);
plot(d, Pathloss, 'LineWidth',2);
title("Distance vs Path loss");
subtitle("Mobile height = 1m, Base Station height = 200m");
xlabel("distance (km)");
ylabel("path loss (dB)");

legend("uplink 900MHz", "downlink 950MHz", "uplink 1750MHz", "downlink 1850MHz");

