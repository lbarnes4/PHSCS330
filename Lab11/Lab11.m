% Lab 11
% Lucas Barnes


%% P11.1

clear
close all
global w0 b w L;
w0=1;
L=1;
b=.049; % .05 for part b, 0.049 for part c
w=30;
theta0=3.1;
thetadot0=0;
options=odeset('RelTol',1e-8);
[t,u]=ode45(@rhs_12,[0 30],[theta0 thetadot0],options);
[T,U]=ode45(@rhs_14,[0 30],[theta0, thetadot0-b*w/L*sin(theta0)],options);
plot(t,u(:,1))
hold on
plot(T,U(:,1))
legend('un-averaged','averaged')
title('High-frequency Driving Force')
xlabel('t')
ylabel('theta(t)')

%% (c)
close all
V=@(theta)-w0^2*cos(theta)-b^2*w^2*cos(theta).^2/(4*L^2);
theta=0:.1:2*pi;
plot(theta,V(theta))
% b -> 0.0471405
















