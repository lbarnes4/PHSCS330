% Exam 2
% Lucas Barnes
% Problem 2

% the pendulum goes all the way over when theta exceeds pi at t=138

% the period of oscillation isn't constant for large angles so you need a
% time varying driving force that will match the changing period
clear
close all

% initialize variables
global w0 a tmax
w0=1;
a=.1; 
tmax=900;
u0=[.2; 0]; % initial conditions [theta(0); thetadot(0)]
tstart=0;
tend=200;

% solve the differential equation with rhs2.m
[t,u]=ode45(@rhs2,[tstart, tend], u0, odeset('RelTol',1e-8));

% plot theta vs t
theta=u(:,1);
plot(t,theta)
title('theta vs t for driven pendulum')
xlabel('theta')
ylabel('t')

% animation to confirm reasonable behavior
% figure
% for n=1:length(theta)/4
%     plot(sin(theta(n*4)),-cos(theta(n*4)),'*')
%     xlim([-1 1])
%     ylim([-1 1])
%     pause(.1)
% end







