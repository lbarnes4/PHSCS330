% Lab 10
% Lucas Barnes

%% P10.2
clear
close all
global gamma w0 wp a;
gamma=.1;
g=9.8;
l1=2;
m1=10;
m2=10;
m3=10;
l2=.5;
l3=.5;
A=.5;
M=m1+m2+m3;
I1=M*l1^2;
I2=m2*l2^2+m3*l3^2;
w0=sqrt(M*g*l1/(I1+I2));
wp=w0;
a=I2*A*wp^2/(I1+I2);
[te,u]=ode45(@rhs10_2,[0,800],[0; 0],odeset('RelTol',1e-8));
xe=u(:,1);
% plot(t,u(:,1))

% Put the code solving the equation above. The code below assumes
% that you have evenly spaced time steps with the following variables
% te -> time array
% xe -> angle theta
% wp -> the pumping frequency
% A -> the pumping amplitude
% l1 -> the main swing length
% l2 -> the head-to-middle and middle-to-foot length
tau=te(2)-te(1); L = l1+l2;
for istep=1:length(te)
    % Position of swing relative to the pivot
    theta = xe(istep);
    xswing=l1*sin(theta);
    yswing=-l1*cos(theta);
    % position of head/legs with respect to swing
    phi=A + A*cos(wp*te(istep));
    xpers=l2*sin(phi + theta);
    ypers=l2*cos(phi + theta);
    % Plot the swing and the swinger
    plot([0, xswing],[L,L+yswing],...
    [xswing+xpers,xswing-xpers],[L+yswing-ypers,L+yswing+ypers])
    % Make the x and y dimensions scale equally
    axis([-L/2 L/2 0 L])
    axis square
    % We'd like the plots frames to show at intervals of tau so the movie
    % matches the physical time scale. However, the calculations
    % and plotting take some time, so we decrease the pause a bit.
    % Depending on the speed of your computer, you may need to adjust
    % this offset some.
    pause(tau-0.01)
end

%% P10.3

clear
close all;
global gamma w0 e wp;
u0=[0;1];
w0=1;
gamma=.03;
e=.0605;
wp=2;
[t,u]=ode45(@rhs10_3,[0,5000],u0,odeset('RelTol',1e-8));
x=u(:,1);
v=u(:,2);

plot(t,x)
% e=.1007 for wp=2.05
% e=.0995 for wp=1.95
% e=.6 for wp=2
% wp is 2w0 when you use the standing pump method

%% P10.4

format long e
x=1;
for n=1:14
    x=(1+0.1*exp(x))^(1/3);
end
x

%% P10.5

clear
close all;
global gamma w0 e wp;
u0=[0;1];
w0=1;
gamma=0;
e=.3;
wp=1.3;
[t,u]=ode45(@rhs10_3,[0,500],u0,odeset('RelTol',1e-8));

N=2^14;
tau=t(end)/N;
te=0:tau:(N-1)*tau;
x=interp1(t,u(:,1),te,'spline');
% v=u(:,2);
g=ft(x,tau);
P=abs(g).^2;

dw=2*pi/(N*tau);
w = -(N/2)*dw:dw:dw*(N/2-1);

semilogy(w,P)
xlim([-10 10])
ylim([1 1e4])




% x0=A*cos(w0*t);
% ddx+gamma*dx+w0^2=-e*cos(wp*t)*x0;


%% P10.6
% P10_6.nb mathematica notebook

%% P10.7
% wp=2w0 causes the sidebands to be w0 and 3w0. w0 is resonant.
% wp=w0 causes the sidebands to be 0 and 2w0. neither is resonant but the
% second-order sidebands are resonant.

%% P10.8
clear
close all;
global gamma g dl wp L0;
g=9.8;
L0=2;
dl=0.07;
gamma=.1;
w0=sqrt(g/L0);
wp=2*w0;
u0=[0;5];
[t,u]=ode45(@rhs10_8,[0,500],u0,odeset('RelTol',1e-8));
theta=u(:,1);
plot(t,theta)











