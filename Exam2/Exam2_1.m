% Exam 2
% Lucas Barnes
% Problem 1

clear
close all

% initialize variables
N=8192; % number of points
tau=1000/N; % time step
t=0:tau:(N-1)*tau; % array of times
dw=2*pi/(N*tau); % frequency step
w=-(N/2)*dw:dw:dw*(N/2-1); % array of frequencies

% define functions to get the power spectrum of S
S=@(d) 1/d*(cos(t)+3*cos(2*t)+5*cos(3*t)).*exp(-(t-500).^2/d^2);
g=@(d) ft(S(d),tau);
P=@(d)abs(g(d)).^2;

% plot of power spectrums with d=10 and d=100
semilogy(w,P(10))
hold on
semilogy(w,P(100))
title('Power spectrum for d=10 and d=100')
legend('d=10','d=100')
ylim([1e-5 10])
hold off

% The wider the frequency peaks, the thinner the time peaks. Wide frequency
% peaks mean lots of frequencies are involved which makes the time signal
% closer to a perfect impulse which includes all frequencies in theory.

% 8192 is a good number of points because it is a power of 2 and fft is
% faster with powers of 2.

% you could increase N or tau to give better resolution in the spectrum







