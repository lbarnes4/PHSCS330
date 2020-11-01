% Lab 2
% Lucas Barnes

clear

%% P2.1
A=[14,42,91,79,95,65,3,84,93,67,75,74,39,65,17];

% bubble sort
done = false;
% keep sorting until done
while ~done
    done = true;
    % for every element in A except the last element
    for i = 1:length(A) - 1
        % if the element is greater than the next element
        if A(i) > A(i + 1)
            % switch the elements
            temp = A(i);
            A(i) = A(i + 1);
            A(i + 1) = temp;
            A
            % set done to false so the loop will continue sorting
            done = false;
        end
    end
end
disp(A)

%% P2.2
% (a)
close all;
x=0:.01:4*pi;
f=x.*sin(x);
plot(x,f)
xlabel('x')
ylabel('y')
title('xsin(x) and cos(x)')
hold on
plot(x,cos(x))
legend('xsin(x)','cos(x)')

%% (b)
clear;
N = 20;
% preallocate the array
a = zeros(1,N);
% initialize a(1)
a(1) = 1;
for n = 1:N-1
    % populate a with the recursion relation
    a(n+1) = (n/((n-1/2)*(n+1/2)))*a(n);
end
% define domain
x=1:N;
close all
% make the plots appear on the same figure

semilogy(x,a)
hold on
semilogy(x,exp(-x))
semilogy(x,1./factorial(x))
hold off
legend('a','exp(-n)','1/!n')
% 1/!n matches the recursion relation the best

%% (c)
x=0:.01:5;
f=zeros(1,length(x));
for n=1:length(x)
    if x(n)<1
        f(n)=exp(x(n));
    else
        f(n)=exp(1)*cos(x(n)-1);
    end
end
close all;
plot(x,f)
xlabel('x')
ylabel('f(x)')
title('f(x) vs. x')

%% P2.3
% (a)
close all
t=-1:.01:1;
y=-1./(t+1);
plot(t,y)
ylim([-4 0])

%% (b)
close all
t=-5:.01:5;
y=(exp(t)+exp(-t))/2;
plot(t,y)
ylim([0 4])

