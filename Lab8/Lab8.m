% Lab 8
% Lucas Barnes

%% P8.1 and P8.3
% (a) written
% (b)
clear
close all
global G m1 m2;
G=1;
m1=1;
m2=2;
u0=[1; .5; -.3; .65; .2; .1; -1; -.3; .6; -.45; .3; -.3];
options = odeset('RelTol',1e-8);
[t, u] = ode45(@rhs8_1,[0, 50],u0,options);

plot3(u(:,1),u(:,2),u(:,3))
hold on
plot3(u(:,7),u(:,8),u(:,9))
title('Two Masses Orbiting');
xlabel('x')
ylabel('y')
zlabel('z')
hold off

N=5*length(t);
dt=t(end)/N;
te=00:dt:t(end);
x1e=interp1(t,u(:,1),te,'spline');
y1e=interp1(t,u(:,2),te,'spline');
z1e=interp1(t,u(:,3),te,'spline');
x2e=interp1(t,u(:,7),te,'spline');
y2e=interp1(t,u(:,8),te,'spline');
z2e=interp1(t,u(:,9),te,'spline');
figure
for n=5:4:N
    plot3(x1e(n-4:n),y1e(n-4:n),z1e(n-4:n),'b-');
    hold on
    plot3(x2e(n-4:n),y2e(n-4:n),z2e(n-4:n),'r-');
    axis equal;
    pause(.001)
end
hold off



%% P8.2
clear
close all
x=0:2*pi;
y=sin(x);
xfine=-2*pi:0.1:2*pi;
yfine=sin(xfine);
hold on
plot(x,y,'*')
domain=xfine(1,floor(20*pi):floor(20*pi)+50);
plot(domain,interp1(x,y,domain,'linear'))
plot(domain,interp1(x,y,domain,'pchip'))
plot(domain,interp1(x,y,domain,'spline'))
plot(xfine, yfine)
title('Interpolations of sin(x)')
xlabel('x')
ylabel('sin(x)')
legend('coarse','linear','pchip','spline','fine')
hold off
% linear and cubic interpolations give simple fits that fit the data
% but don't reflect the actual function well


%% P8.4

% (a)
a=[1,2,3];
b=[-3,2,1];
theta=acos(dot(a,b)/(norm(a)*norm(b)))

%% (b)

r=[1,2,3];
v=[6,3,1];
m=2.3;
m*cross(r,v)

%% P8.5

% (a)
clear
close all
global G m1 m2;
G=1;
m1=1;
m2=2;
u0=[1; .5; -.3; .65; .2; .1; -1; -.3; .6; -.45; .3; -.3];
options = odeset('RelTol',1e-8);
[t, u] = ode45(@rhs8_1,[0, 50],u0,options);

N=5*length(t);
dt=t(end)/N;
te=00:dt:t(end);

x1=interp1(t,u(:,1),te,'spline')';
y1=interp1(t,u(:,2),te,'spline')';
z1=interp1(t,u(:,3),te,'spline')';
x1dot=interp1(t,u(:,4),te,'spline')';
y1dot=interp1(t,u(:,5),te,'spline')';
z1dot=interp1(t,u(:,6),te,'spline')';
x2=interp1(t,u(:,7),te,'spline')';
y2=interp1(t,u(:,8),te,'spline')';
z2=interp1(t,u(:,9),te,'spline')';
x2dot=interp1(t,u(:,10),te,'spline')';
y2dot=interp1(t,u(:,11),te,'spline')';
z2dot=interp1(t,u(:,12),te,'spline')';

r1=[x1,y1,z1];
r2=[x2,y2,z2];
r1dot=[x1dot, y1dot, z1dot];
r2dot=[x2dot, y2dot, z2dot];

R=(m1*r1+m2*r2)/(m1+m2);
Rdot=(m1*r1dot+m2*r2dot)/(m1+m2);
r=r1-r2;
rdot=r1dot-r2dot;

plot3(R(:,1),R(:,2),R(:,3))
title('R')
xlabel('x')
ylabel('y')
zlabel('z')

figure
plot3(Rdot(:,1),Rdot(:,2),Rdot(:,3),'*')
title('V')
xlabel('x')
ylabel('y')
zlabel('z')

%% (b)

close all
plot3(r(:,1),r(:,2),r(:,3))
title('r')
xlabel('x')
ylabel('y')
zlabel('z')
%%
figure
for n=5:4:N/2
    plot3(r(n-4:n,1),r(n-4:n,2),r(n-4:n,3),'b-');
    title('r')
    xlabel('x')
    ylabel('y')
    zlabel('z')
    xlim([-1.5 4.5])
    ylim([-1.5 1])
    zlim([-1.5 2.5])
    view(-45,45)
    hold on
    pause(.001)
end
hold off


%% (c)
L=m1*cross(r1-R,r1dot-Rdot)+m2*cross(r2-R,r2dot-Rdot);
subplot 131
plot(te,L(:,1))
ylim([0 .5])
title('Lx vs t')
xlabel('t')

ylabel('Lx')

subplot 132
plot(te,L(:,2))
title('Ly vs t')
ylim([-1.5 -1])
xlabel('t')
ylabel('Ly')

subplot 133
plot(te,L(:,3))
title('Lz vs t')
ylim([-1 -.5])
xlabel('t')
ylabel('Lz')

%% (d)

dot1=dot(r1-R,L,2);
dot2=dot(r2-R,L,2);
plot(te,dot1)
ylim([-.5,.5])
title('r1-R dot L')
xlabel('t')

figure
plot(te,dot2)
ylim([-.5,.5])
title('r2-R dot L')
xlabel('t')










