% Lab 3
% Lucas Barnes

% P3.1
% (a)
x=-5:.1:5;
y=-6:.1:6;

[X,Y]=meshgrid(x,y);

F=exp(-abs(X-sin(Y))).*(1+1/5 .* cos(X./2)).*(1 + 4./(3 + 10 * Y.^2));

% Plot the function
surf(X,Y,F);
xlabel('x');
ylabel('y');

%% (b)
clear;
close all
x=-10:1:10;
y=x; % define the x and y grids (avoid (0,0))
[X,Y]=meshgrid(x,y);

Vx=.2*X.^2+.5*Y.^2+20;
Vy=-.1*Y.^3+.5*X.^2-10;
quiver(X,Y,Vx,Vy) % make the field arrow plot

starty = -10:1:10;
startx = -10*ones(size(starty));
streamline(x,y,Vx,Vy,startx,starty);

%% P3.2
clear;
close all
x=-10:1:10;
v=x; % define the x and y grids (avoid (0,0))
[X,V]=meshgrid(x,v);
g=9.8;
Vx=V;
VV=-g*ones(size(Vx));
quiver(X,V,Vx,VV) % make the field arrow plot

startv = 0:1:10;
startx = zeros(size(startv));
streamline(x,v,Vx,VV,startx,startv);


%% P3.3
clear;
close all
x=-10:2:10;
v=x; % define the x and y grids (avoid (0,0))
[X,V]=meshgrid(x,v);

Vx=V;
VV=-X;
quiver(X,V,Vx,VV) % make the field arrow plot

startv = 1:2:10;
startx = zeros(size(startv));
streamline(x,v,Vx,VV,startx,startv,[0.001,26000]);
% When the oscillator is at x=0 with positive velocity it will travel to
% a greater x while losing velocity. Velocity continues to decrease to
% negative values until x becomes negative. Then velocity starts increasing
% and the trajectory continues in a circle.

%% P3.4
clear;
close all
theta=-3*pi:pi/2:3*pi;
w=theta; % define the x and y grids (avoid (0,0))
[THETA,W]=meshgrid(theta,w);

Vtheta=W;
Vw=-sin(THETA);
quiver(THETA,W,Vtheta,Vw) % make the field arrow plot

[starttheta,startw]=meshgrid(-2*pi:2*pi:2*pi, -3.5*pi:pi:3.5*pi);

streamline(theta,w,Vtheta,Vw,starttheta,startw,[0.001,26000]);

%% P3.5
clear;
close all
y=-1:.2:1;
v=y; % define the x and y grids (avoid (0,0))
[Y,V]=meshgrid(y,v);

Vy=V;
Vv=-Y.^2;
quiver(Y,V,Vy,Vv) % make the field arrow plot

startv = 0;
starty = 1;
streamline(y,v,Vy,Vv,starty,startv);


%% P3.6
% (a)
clear;
close all;
x=1:1000;
y=zeros(size(x));
e=y;
for N=1:1000
    [y(N),e(N)] = EulerSum(N);
end

plot(x,y)
xlabel('number of terms')
ylabel('sum')
title('Euler Sum')
figure
semilogy(x,e)
xlabel('number of terms')
ylabel('error')
title('Euler Sum Error')

%% (b)
clear
f = @(x,n) 4/(n*pi).*sin(n.*pi.*x);
N=100;
x=-5:.001:5;
y=zeros(size(x));
for n=1:2:N
    y = y + f(x,n);
end
plot(x,y);



