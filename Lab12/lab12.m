% Lab 12
% Lucas Barnes

clear
close all

%% P12.1
% (a)
global e w0 l;
e=.3;
w0=1.3;
l=1;
options=odeset('RelTol',1e-5);
[t,u]=ode45(@rhs12_1,[0 300],[.0001; 0],options);
plot(t,u(:,1))

figure
plot(u(:,1),u(:,2))

%% (b)
close all
e=1;
[t,u]=ode45(@rhs12_1,[0 300],[.0001; 0],options);
plot(t,u(:,1))

figure
plot(u(:,1),u(:,2))

%% (c)
close all
e=1;
[t,u]=ode45(@rhs12_1,[0 300],[.0001; 0],options);
plot(t,u(:,1))

figure
plot(u(:,1),u(:,2))


N=2^14;
tau=t(end)/N;
te=0:tau:(N-1)*tau;
x=interp1(t,u(:,1),te,'spline');
% v=u(:,2);
g=ft(x,tau);
P=abs(g).^2;

dw=2*pi/(N*tau);
w = -(N/2)*dw:dw:dw*(N/2-1);

figure
semilogy(w,P)
xlim([0 20])
% ylim([1 100000])


%% P12.2
close all
global A w;
l=1;
e=2;
w0=1.3;
w=1.4;
A=1.5;

[t,u]=ode45(@rhs12_2,[0 300],[.0001; 0],options);
plot(t,u(:,1))

figure
plot(u(:,1),u(:,2))


N=2^14;
tau=t(end)/N;
te=0:tau:(N-1)*tau;
x=interp1(t,u(:,1),te,'spline');
% v=u(:,2);
g=ft(x,tau);
P=abs(g).^2;

dw=2*pi/(N*tau);
w = -(N/2)*dw:dw:dw*(N/2-1);

figure
semilogy(w,P)
xlim([0 20])
ylim([1 100000])


%% P12.3

% (a)
close all
x=-1.5:.01:1.5;
U=-x.^2/2+x.^4/4;
plot(x,U)
% stable equilibrium points at -1 and 1

%% (b)
global m;
m=1;

[t,u]=ode45(@rhs12_3,[0 100],[0; .001],odeset('RelTol',1e-6));
plot(t,u(:,1))
plot(u(:,1),u(:,2))

%% (c)
close all
global gamma;
gamma = .4;
A=.9;
[t,u]=ode45(@rhs12_3c,[0 1000],[1.000001; 0],odeset('RelTol',1e-6)); % x(0)=1.000001 for part d
plot(t,u(:,1))

N=2^14;
tau=t(end)/N;
te=0:tau:(N-1)*tau;
x=interp1(t,u(:,1),te,'spline');

g=ft(x,tau);
P=abs(g).^2;

dw=2*pi/(N*tau);
w = -(N/2)*dw:dw:dw*(N/2-1);

figure
semilogy(w,P)
xlim([0 20])
ylim([.1 100000])

%% P12.4

% (a)
close all
A=1.371; %% .96 for part a, 1.3 for part b, 1.36, 1.371, 1.97, 1.99, 2, and 3 for part c
[t,u]=ode45(@rhs12_3c,[0 1000],[1; 0],odeset('RelTol',1e-6));

N=length(u(:,1));
n1=ceil(.6*N); % n1 starts 60% into the array
plot(t,u(:,1))
figure
plot(u(n1:N,1),u(n1:N,2));


%% P12.5
%(a)
Fn=zeros(1,100);
Fn(1)=1;
Fn(2)=1;
for n=3:100
    Fn(n)=Fn(n-1)+Fn(n-2);
end
disp(Fn)
%% (b)
h=4*pi/50000;
x=-2*pi:h:2*pi;


G=zeros(1,length(x));
for n=1:100
    G=G+cos(Fn(n)*x)/Fn(n);
end
plot(x,G)





























