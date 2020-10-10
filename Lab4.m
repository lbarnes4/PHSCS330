% Lab 4
% Lucas Barnes

% P4.1
% (a)
step=.001;
total=0;
f=@(x) x.^2 .* exp(-x).*cos(x);
for n=0:step:2-step
    total = total + step * f(n + step/2);
end
format long
disp(total)
disp(integral(f,0,2))

%% (b)
f=@(x)exp(x);
forward = @(x, h)(f(x+h)-f(x))/h;
center = @(x, h)(f(x+h)-f(x-h))/(2*h);
h=zeros(1,65);
for n=1:65
    h(n) = 1/2^n;
end
% disp(forward(1,.5))
% disp(center(1,.5))
forwardError=zeros(1,65);
centerError=zeros(1,65);
for n=1:65
    forwardError(n)=abs(forward(1,h(n))/exp(1)-1);
    centerError(n)=abs(center(1,h(n))/exp(1)-1);
end
    
loglog(h,forwardError)
xlabel('h')
ylabel('error')
title('Forward error vs. center error')
hold on
loglog(h,centerError)
legend('forward','center')
% Matlab is only precise to 15 digits so anything
% smaller than that will be rounded off to 0

%% P4.2
x=0;
y=1;
vx=1;
vy=0;
tau=.01;
g=9.8;
while (x < 10)
    t1 = tau;
    ynew = y + vy * t1;
    if ynew < 0
        t1 = -y/vy;
    end
    pause(t1)
    xnew = x + vx * t1;
    ynew = y + vy * t1;
    vynew = vy - g * t1;
    x = xnew;
    y = ynew;
    vy = vynew;
    if y <= 0
        vy = 0.95*abs(vy);
    end
    plot(x,y,'.')
    axis([0 10 0 1.5])
    
end












