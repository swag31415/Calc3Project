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
d = sqrt(((diff(x_set).^2) + (diff(y_set).^2) + (diff(z_set).^2))./(h^2));

% Computing the arclength integral using a Riemann Sum
dist = 0;
for i = 1:length(d)
    dist = dist + (d(i) * h);
end

% The amount of household garbage burned in tons
tons_of_garbage = (dist * 150) / 2000;

% Plots speed where the x-axis is time in seconds and the y-axis is speed
% in feet/sec
plot(1:601, d.*(5280/60));

% Finds the maximum speed in feet/sec in the journey as well as the second
% in which it occurs
[maximum_value, time_of_maximum_value] = max(d.*(5280/60));

