% Lab 1
% Lucas Barnes

clear

%% P1.1

A=[1,2,3;4,5,6;7,8,9]
B=[1,4,5;9,6,3;2,3,1]
v1=[1,1,2]
v2=[0.40824829 ; -0.81649658 ; 0.40824829]

% (a)
A*B
A.*B
% * denotes matrix multiplication, while .* denotes element-wise
% multiplication
% (b)
A./B
% Each element in A is divided by the corresponding element in B
%(c)
% A*v1  This produces an error because you cannot perform matrix
% multiplication of a 3x3 matrix and a 1x3 matrix
v1*A
A*v2
% v1*A and A*v2 are just standard matrix multiplications
% (d)
A(2,2)*B(2,2)
% (e)
exp(A+i*B) 
% returns a matrix of complex exponentials created by adding corresponding
% elements of A and B together, with the elements of B being multiplied by
% i.
% (f)
A(:,2).*v2

%% P1.2
% (a)
v=input('Enter a value for v in m/s: ');
theta=input('Enter a value for theta in degress: ');
fprintf('Range: %3.1f meters\n',v^2*sind(2*theta)/9.8)
% a velocity of 750 m/s and an angle of 5.01669 degrees gives a range of
% 10km

%% (b)
format long
v1=[30000,0,0]
v2=[-5000,8000,1000]
m1=6e24
m2=1e19
vf=(m1*v1+m2*v2)/(m1+m2)

%% P1.3

% (a)
% this program finds all factors of N
N=18648;
% for every number from 1 to N
for n=1:N
    % if the remainder of N / n is 0, n is a factor of N
    if (mod(N,n) == 0)
        % n is a factor of N, so display it
        disp(n)
    end
end

%% (b)
% initialize variables
theta=0;
v=750; % velocity m/s
g=9.8; % acceleration due to gravity m/s^2
d=v^2*sind(2*theta)/g; % range
while d<5000 % while range is less than 5000
    theta=theta+.1; % increment theta
    d=v^2*sind(2*theta)/g; % recalculate range
end
disp(theta)

%% (c)
balance=100000;
t=0; % number of months
r=.06; % annual interest rate
p=1000; % monthly payment
while balance>0
    t=t+1; % increment number of months
    balance=balance*(1+r/12)-p; % calculate new balance
end
disp(t)








