% Project 1 for Calc 3
% Authors are Swag, Kiro, and Manuel

% Defining points
t=0:10/601:10;

% Defining curve that the spacethingy takes
x_t=10.*sin(t)+5.*sin(5.*t)+2.5.*sin(2.3.*t);
y_t=10.*cos(t)+5.*cos(5.*t)+2.5.*cos(2.3.*t);
z_t=(0.001.*(t.^4)).*(1+(cos(2*pi.*t)).^2);

% Defining the plot
r = plot3(x_t,y_t,z_t,'b','LineWidth',2);
hold on; % Ensuring the 3d line stays and the markers below fall on said line
r0 = plot3(x_t, y_t, z_t, 'o', 'MarkerFaceColor', 'green', 'MarkerEdgeColor', 'green', 'MarkerIndices', 1); % First Point
r601 = plot3(x_t, y_t, z_t, 'o', 'MarkerFaceColor', 'red', 'MarkerEdgeColor', 'red', 'MarkerIndices', 602); % Last Point
hold off; % Done adding points