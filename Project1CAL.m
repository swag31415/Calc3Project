clear;
t=0:10/601:10;
x_t=10.*sin(t)+5.*sin(5.*t)+2.5.*sin(2.3.*t);
y_t=10.*cos(t)+5.*cos(5.*t)+2.5.*cos(2.3.*t);
z_t=(0.001.*(t.^4)).*(1+(cos(2*pi.*t)).^2);
plot3(x_t,y_t,z_t,'b','LineWidth',2);