% Project 1 for Calc 3
% Authors are Swag, Kiro, and Manuel

% Deciding on a step size
h = (10 / 601);

% Defining points
domain = 0:h:10;

% Defining curve that the spacethingy takes
x_t = @(t) 10.*sin(t)+5.*sin(5.*t)+2.5.*sin(2.3.*t);
y_t = @(t) 10.*cos(t)+5.*cos(5.*t)+2.5.*cos(2.3.*t);
z_t = @(t) (0.001.*(t.^4)).*(1+(cos(2*pi.*t)).^2);

% Computing points along that curve
x_set = x_t(domain);
y_set = y_t(domain);
z_set = z_t(domain);

% Showing the points as a line
plot3(x_set, y_set, z_set, 'b', 'LineWidth', 2);
hold on; % Ensuring the 3d line stays and the markers below fall on said line
plot3(x_set, y_set, z_set, 'o', 'MarkerFaceColor', 'green', 'MarkerEdgeColor', 'green', 'MarkerIndices', 1); % First Point
plot3(x_set, y_set, z_set, 'o', 'MarkerFaceColor', 'red', 'MarkerEdgeColor', 'red', 'MarkerIndices', 602); % Last Point
hold off; % Done adding markers

% Starting coords
c_steal = [x_t(0), y_t(0), z_t(0)];

% Ending coords
c_end = [x_t(10), y_t(10), z_t(10)];

% Total displacement
disp = sqrt(((c_steal(1) - c_end(1))^2) + ((c_steal(2) - c_end(2))^2) + ((c_steal(3) - c_end(3))^2));

% Computing the inside of the arc-length integral
s = sqrt(((diff(x_set).^2) + (diff(y_set).^2) + (diff(z_set).^2))./(h^2));
s_FtPerS = s.*(5280/60);

% Computing the arclength integral using a Riemann Sum
dist = 0;
for i = 1:length(s)
    dist = dist + (s(i) * h);
end

% The amount of household garbage burned in tons
tons_of_garbage = (dist * 150) / 2000;

% Plots speed where the x-axis is time in seconds and the y-axis is speed
% in feet/sec
plot(1:601, s_FtPerS);

% Finds the maximum speed in feet/sec in the journey as well as the second
% in which it occurs
[maximum_value, time_of_maximum_value] = max(s_FtPerS);

% Gets an array of points for the accleration graph
a = diff(s_FtPerS);

% Plots accleration
plot(1:600, a);

% The accleration of gravity on planet Docbrown
g = 340;

% Whether we need medicine or not
need_medicine = ((max(a) > 3*g) | (min(a) < -3*g));

% Bumping up accuracy
domain = 0:(1/601):10;
x_set = x_t(domain);
y_set = y_t(domain);
z_set = z_t(domain);

% Calculating T
Ts = sqrt(((diff(x_set).^2) + (diff(y_set).^2) + (diff(z_set).^2)));
Tx_set = diff(x_set)./Ts;
Ty_set = diff(y_set)./Ts;
Tz_set = diff(z_set)./Ts;
plot(Tz_set);

% Calculating N
Ns = sqrt(((diff(Tx_set).^2) + (diff(Ty_set).^2) + (diff(Tz_set).^2)));
Nx_set = diff(Tx_set)./Ns;
Ny_set = diff(Ty_set)./Ns;
Nz_set = diff(Tz_set)./Ns;

% Calculating unit Accleration
As = sqrt(((diff(diff(x_set)).^2) + (diff(diff(y_set)).^2) + (diff(diff(z_set)).^2)));
Ax_set = diff(diff(x_set))./As;
Ay_set = diff(diff(y_set))./As;
Az_set = diff(diff(z_set))./As;

% Finding TNB at 543 seconds
T_905 = [Tx_set(10 * (543 + 1)), Ty_set(10 * (543 + 1)), Tz_set(10 * (543 + 1))];
N_905 = [Nx_set(10 * (543 + 1)), Ny_set(10 * (543 + 1)), Nz_set(10 * (543 + 1))];
B_905 = cross(T_905, N_905);

% The base of the vectors
R_905 = [x_t(9.05), y_t(9.05), z_t(9.05)];

% Plotting it all
plot3(x_t(8.9333:0.001:9.0833), y_t(8.9333:0.001:9.0833), z_t(8.9333:0.001:9.0833), 'b', 'LineWidth', 2);
hold on;
quiver3(R_905(1), R_905(2), R_905(3), T_905(1), T_905(2), T_905(3), 'Color', [1, 0, 0]);
quiver3(R_905(1), R_905(2), R_905(3), N_905(1), N_905(2), N_905(3), 'Color', [0, 1, 0]);
quiver3(R_905(1), R_905(2), R_905(3), B_905(1), B_905(2), B_905(3), 'Color', [0, 0, 1]);
quiver3(R_905(1), R_905(2), R_905(3), Ax_set(10 * (543 + 1)), Ay_set(10 * (543 + 1)), Az_set(10 * (543 + 1)), 'Color', [0, 0, 0]);
hold off;