function plot7_5(theta0)
tstart=0;
tfinal=10;
w0=1;

rhs = @(t,u) [u(2); -w0^2*sin(u(1))];
[t,u]=ode45(rhs,[tstart,tfinal],[theta0;0],odeset('RelTol',1e-8));

w=pi*w0./(2*ellipke(sin(theta0/2).^2));

figure
plot(t,u(:,1),t,theta0*cos(w*t))
title('theta vs time')
xlabel('time (s)')
ylabel('theta')
legend('Actual','Cosine')