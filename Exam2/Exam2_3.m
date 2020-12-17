% Exam 2
% Lucas Barnes
% Problem 3

clear
close all

n=2;
dx=10^-n; % step size
x=0:dx:10; 

% calculate the derivative of besselj(0,x) numerically by using the center
% difference method
derivApprox=zeros(1,length(x));
for i=2:length(x)-1
    derivApprox(i)=(besselj(0,x(i)+dx/2)-besselj(0,x(i)-dx/2))/dx;
end

% use linear extrapolation to determine the first and last values in
% derivApprox
derivApprox(1)=2*derivApprox(2)-derivApprox(3);
derivApprox(end)=2*derivApprox(end-1)-derivApprox(end-2);

% plot the difference betweeen the actual derivative and the numerical
% derivative
plot(x,-besselj(1,x)-derivApprox)

% verify that the max error is less than 10e-5
max(abs(derivApprox+besselj(1,x)))




