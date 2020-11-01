% Lab 6
% Lucas Barnes

%% P6.1
% (b)
clear;
close all
global w0;
w0=2;
x=-3:.5:3;
v=x; % define the x and y grids (avoid (0,0))
[X,V]=meshgrid(x,v);

Vx=V;
Vv=-w0^2*X;
quiver(X,V,Vx,Vv)% make the field arrow plot
title('Velocity vs. Position')
xlabel('x')
ylabel('v')
hold on

% (c)
u0=zeros(2,1);
u0(1)=1; %initial x
u0(2)=0; %initial Vx
options=odeset('RelTol',1e-8);

% Solve with v0=0
tstart=0;
tfinal=1;
[t,u]=ode45(@rhs6_1,[tstart,tfinal],u0,options);
x1=u(:,1);
v1=u(:,2);
plot(x1,v1,'LineWidth',2);

% Solve with v0=1.4
u0(2)=1.4;
[t,u]=ode45(@rhs6_1,[tstart,tfinal],u0,options);
x1=u(:,1);
v1=u(:,2);
plot(x1,v1,'LineWidth',2);

% Solve with v0=-1
u0(2)=-1;
[t,u]=ode45(@rhs6_1,[tstart,tfinal],u0,options);
x1=u(:,1);
v1=u(:,2);
plot(x1,v1,'LineWidth',2);
hold off
legend('dV/dx','v0=0','v0=1.4','v0=-1')

%% P6.2

% (a)

clear;
close all
global w0 gamma;
gamma=4; % ********change to 4 for part (c)********
w0=2;
x=-3:.5:3;
v=x; % define the x and y grids (avoid (0,0))
[X,V]=meshgrid(x,v);

Vx=V;
Vv=-w0^2*X-2*gamma*V;
quiver(X,V,Vx,Vv)% make the field arrow plot
title('Velocity vs. Position')
xlabel('x')
ylabel('v')
hold on


% (b)
u0=zeros(2,1);
u0(1)=1; %initial x
u0(2)=0; %initial Vx
options=odeset('RelTol',1e-8);

% Solve with v0=0
tstart=0;
tfinal=20;
[t,u]=ode45(@rhs6_2,[tstart,tfinal],u0,options);
x1=u(:,1);
v1=u(:,2);
plot(x1,v1,'LineWidth',2);

% Solve with v0=1.4
u0(2)=1.4;
[t,u]=ode45(@rhs6_2,[tstart,tfinal],u0,options);
x1=u(:,1);
v1=u(:,2);
plot(x1,v1,'LineWidth',2);

% Solve with v0=-1
u0(2)=-1;
[t,u]=ode45(@rhs6_2,[tstart,tfinal],u0,options);
x1=u(:,1);
v1=u(:,2);
plot(x1,v1,'LineWidth',2);
hold off
legend('dV/dx','v0=0','v0=1.4','v0=-1')


%% (d)

clear;
close all
global w0 gamma;
gamma=.5;
w0=2;
x=-3:.5:3;
v=x; % define the x and y grids (avoid (0,0))
[X,V]=meshgrid(x,v);

Vx=V;
Vv=-w0^2*X-2*gamma*V;
quiver(X,V,Vx,Vv)% make the field arrow plot
title('Velocity vs. Position')
xlabel('x')
ylabel('v')
hold on

u0=zeros(2,1);
u0(1)=1; %initial x
u0(2)=0; %initial Vx
options=odeset('RelTol',1e-8);

% Solve with v0=0
tstart=0;
tfinal=20;
[t,u]=ode45(@rhs6_2d,[tstart,tfinal],u0,options);
x1=u(:,1);
v1=u(:,2);
plot(x1,v1,'LineWidth',2);

% Solve with v0=1.4
u0(2)=1.4;
[t,u]=ode45(@rhs6_2d,[tstart,tfinal],u0,options);
x1=u(:,1);
v1=u(:,2);
plot(x1,v1,'LineWidth',2);

% Solve with v0=-1
u0(2)=-1;
[t,u]=ode45(@rhs6_2d,[tstart,tfinal],u0,options);
x1=u(:,1);
v1=u(:,2);
plot(x1,v1,'LineWidth',2);
hold off
legend('dV/dx','v0=0','v0=1.4','v0=-1')

% this one looks different because the squared term makes the
% initial conditions converge to the same steady state quickly.

%% P6.3


clear;
close all
global w0 F0 m w gamma
w0=1;
F0=1;
m=1;
w=1.1;
gamma=.01;


u0=zeros(2,1);
u0(1)=0; %initial x
u0(2)=0; %initial Vx
options=odeset('RelTol',1e-8);

% Solve with v0=0
tstart=0;
tfinal=300;
[t,u]=ode45(@rhs6_3,[tstart,tfinal],u0,options);
x1=u(:,1);
plot(t,x1);
title('Position vs. Time')
xlabel('t')
ylabel('x(t)')

%% P6.4


clear;
close all


global w0 F0 m w gamma
w0=1;
F0=1;
m=1;
gamma=.1;

u0=zeros(2,1);
u0(1)=0; %initial x
u0(2)=0; %initial Vx
options=odeset('RelTol',1e-8);

% Solve with v0=0
tstart=0;
tfinal=200;
a=[ ];
wArr=.98:.001:1.02;
% wArr=.5:.2:1.5;
for w=wArr
    [t,u]=ode45(@rhs6_3,[tstart,tfinal],u0,options);
    x1=u(:,1);
%     plot(t,x1);
%     title('Position vs. Time')
%     xlabel('t')
%     ylabel('x(t)')
    a(end+1)=max(x1(150:end));
end
plot(wArr,a)
title('Amplitude vs. Angular Frequency')
xlabel('w')
ylabel('A')
% wMax is slightly less than wd.

%% P6.5

% (a)
clear
close all

w0=1;
F0=1;
m=1;
gamma=.1;

w=.5:.001:1.5;
A=F0./(m*sqrt((w0^2-w.^2).^2+4*gamma^2*w.^2));

plot(w,A)
title('Amplitude vs. Angular Frequency')
xlabel('w')
ylabel('A')

figure
phi=2*gamma*w./(w0^2-w.^2);
plot(w,phi)
title('Phase Shift vs. Angular Frequency')
xlabel('w')
ylabel('phi')
% phi represents the phase shift of the steady state solution
% for a given angular frequency

%% (b)

A=@(gamma)F0./(m*sqrt((w0^2-w.^2).^2+4*gamma^2*w.^2));

plot(w,A(.1),w,A(.05),w,A(.02),w,A(.01),'LineWidth',2)
title('Amplitude vs. Angular Frequency')
xlabel('w')
ylabel('A')
legend('gamma=.1','gamma=.05','gamma=.02','gamma=.01')


%% (c)

clear
close all
syms F0 m w0 w gamma w
A=F0./(m*sqrt((w0^2-w.^2).^2+4*gamma^2*w.^2));
dAdw=diff(A,w,1);
w=solve(dAdw,w);
w(3)
