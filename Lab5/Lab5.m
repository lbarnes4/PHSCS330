%% Lab 5

%P5.1
% (b/c)
clear;close all;
% Runge-Kutta second order approximate solution
% to the harmonic oscillator
% set the angular frequency
y0=10;
v0=0;
g=9.8;
tau=.2;
% decide how long to follow the motion, 10 periods in this case
tfinal=sqrt(2/g*y0);

% initialize the time array
t(1)=0;
% set the initial values of position and velocity
Yrk(1)=y0;
Vrk(1)=v0;
Ye(1)=y0;
Ve(1)=v0;
% Do Runge-Kutta
for n=1:tfinal/tau
    t(n+1)=n*tau;
    % Predictor step .5*tau into the future
    vhalf=Vrk(n) - g*tau*.5;
    % Corrector step
    Yrk(n+1)=Yrk(n) + vhalf*tau;
    Vrk(n+1)=Vrk(n) - g*tau;
    Ye(n+1)=Ve(n)*tau + Ye(n);
    Ve(n+1)=-g*tau+Ve(n);
end
% plot the result and compare it with the exact solution
% x(t)=cos(w*t) and v(t)=-w*sin(w*t)
plot(t,Ye,'k-',t,Yrk,'-ro',t,y0-g/2*t.^2,'b-')
xlim([0 1.5])
ylim([0 10])
xlabel('time (s)')
ylabel('height (m)')
title('Position vs. Time')
legend('Euler''s method', 'Range Kutta','Analytic')


%% P5.2
clear;
close all;
y0=10;
global g;
g=9.8;
% set the initial and final times
tstart=0;
tfinal=sqrt(2/g*y0);
% set the initial conditions in the u0 column vector
u0=zeros(2,1);
u0(1)=y0; % initial position
u0(2)=0; % initial velocity
% set the solve options
options=odeset('RelTol',1e-8);
% do the solve

% [t,u]=ode45(@rhs5_2a,[tstart,tfinal],u0,options);
rhs = @(t,u) [u(2); -g];
[t,u]=ode45(rhs,[tstart,tfinal],u0,options);

% unload the solution that comes back in u into y and v arrays
y=u(:,1);
v=u(:,2);
% plot the position vs. time
plot(t,y)
xlim([0 1.5])
ylim([0 10])
xlabel('time (s)')
ylabel('height (m)')
title('Position vs. Time')

%% P5.3

clear;
close all;
y0=1;
% set the initial and final times
tstart=0;
tfinal=100;
% set the initial conditions in the u0 column vector
% set the solve options
options=odeset('RelTol',1e-8);
% do the solve

rhs = @(t,y) y*sin(t);
[t,y]=ode45(rhs,[tstart,tfinal],y0,options);

% plot the position vs. time
plot(t,y,'k-','Linewidth',2)
hold on
plot(t,exp(1-cos(t)),'r-','Linewidth',1)
hold off
xlim([0 100])
xlabel('t')
ylabel('y')
title('Position vs. Time')
legend('ode45','analytic')



%% P5.4

% (a)
clear;
close all;
global Cd pAir a m;
Cd=.35;
a=.037;
g=9.8;
pAir=1.2;
m=.145;

theta0=45*pi/180;
v0=60;
u0=zeros(4,1);

u0(1)=0; %initial x
u0(2)=v0*cos(theta0); %initial Vx
u0(3)=0; %initial y
u0(4)=v0*sin(theta0); %initial Vy

options=odeset('RelTol',1e-8);
tstart=0;
tfinal=20;
[t,u]=ode45(@rhs5_4,[tstart,tfinal],u0,options);
x=u(:,1);
y=u(:,3);

% plot the position vs. time
plot(x,y,'k-','Linewidth',2)
ylim([0 60])
xlabel('x')
ylabel('y')
title('Position vs. Time')


%% (b)
plot(x,y,'k-','Linewidth',2)
hold on

[t1,u1]=ode45(@rhs5_4b,[tstart,tfinal],u0,options);
x1=u1(:,1);
y1=u1(:,3);
plot(x1,y1,'r-','Linewidth',2)
hold off
ylim([0 100])
xlabel('x')
ylabel('y')
title('Position vs. Time')
legend('with resistance','without resistance')
%The difference is about 220m

%% (c)

plot(x,y,'k-','Linewidth',2)
hold on
Cd = Cd *.85;
[t2,u2]=ode45(@rhs5_4,[tstart,tfinal],u0,options);
x2=u2(:,1);
y2=u2(:,3);
plot(x2,y2,'r-','Linewidth',2)
hold off
ylim([0 100])
xlabel('x')
ylabel('y')
title('Position vs. Time')
legend('Sea Level','Denver')

