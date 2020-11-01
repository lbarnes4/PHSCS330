% Lab 7
% Lucas Barnes

theta=-2*pi:pi/2:2*pi;
w=-2*pi:pi/2:2*pi;
[THETA,W]=meshgrid(theta,w);

Vtheta=W;
w0=1;
Vw=-w0^2*sin(THETA);
quiver(THETA,W,Vtheta,Vw);
[starttheta,startw]=meshgrid(-2*pi:2*pi:2*pi, -3.5*pi:pi:3.5*pi);
streamline(theta,w,Vtheta,Vw,starttheta,startw,[0.001,26000]);


%% P7.4
clear
close all
theta0=0:pi/200:pi;
w0=1;
w=pi*w0./(2*ellipke(sin(theta0/2).^2));
plot(theta0,w)
% At a high angle, the velocity will drop
% at a low angle, the pendulum will be at its top speed
% If you start from theta0=pi, you will have 0 velocity when you
% get back to theta=pi

%% P7.5
clear
close all
thetas=[.1, .5, 1, pi/2, .9*pi];
for n=1:length(thetas)
    plot7_5(thetas(n));
end


%% P7.6
% (a)
clear
close all

tstart=0;
tfinal=200;
w0=1;
w=1;
F0=1;
rhs = @(t,u) [u(2); -w0^2*u(1)+F0*sin(w*t)];
[t,u]=ode45(rhs,[tstart,tfinal],[0;0],odeset('RelTol',1e-8));
plot(t,u(:,1))

%% (b)
clear
close all

tstart=0;
tfinal=200;
w0=1;
wt=1;
a=.1;
rhs = @(t,u) [u(2); -w0^2*sin(u(1))+a*sin(wt*t)];
[t,u]=ode45(rhs,[tstart,tfinal],[0;0],odeset('RelTol',1e-8));
plot(t,u(:,1))
% The amplitude doesn't go to infinity because frequency is amplitude
% dependent. When the amplitude increases, the frequency changes,
% and the driving frequency no longer matches the natural frequency,
% so the oscillations die off

%% (c)

clear
close all

tstart=0;
tfinal=200;
w0=1;
wt=.94;
a=.1;
gamma=.1;
rhs = @(t,u) [u(2); -w0^2*sin(u(1))+a*sin(wt*t)-gamma*u(2)];
[t,u]=ode45(rhs,[tstart,tfinal],[0;0],odeset('RelTol',1e-8));
plot(t,u(:,1))

