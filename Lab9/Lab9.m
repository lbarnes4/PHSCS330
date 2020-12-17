% Lab 9

%% P9.2
clear
close all

f = audioread('beethoven.wav');
fs=44100;
f1=f(1:75000);
f2=f(80000:end);
% soundsc(f2,fs)
tau=1/fs;
N=length(f);
t=0:tau:(N-1)*tau;
plot(t,f)
title('Beethoven Time Series')
xlabel('t')
ylabel('amplitude')


[v,P]=vPSpectrum(f,fs);
figure
plot(v, P)
xlabel('v')
ylabel('P(v)')
title('Power Spectrum linear')
xlim([0 1000])

figure
semilogy(v, P)
xlabel('v')
ylabel('P(v)')
title('Power Spectrum log')
xlim([0 1000])
ylim([1E4 1E7])

figure
[v,P]=vPSpectrum(f1,fs);
semilogy(v, P)
xlabel('v')
ylabel('P(v)')
title('Power Spectrum first three notes')
xlim([0 1000])
ylim([1E4 1E7])

figure
[v,P]=vPSpectrum(f2,fs);
semilogy(v, P)
xlabel('v')
ylabel('P(v)')
title('Power Spectrum last note')
xlim([0 1000])
ylim([1E4 1E7])


%% P9.3
close all
w0=200;
W=.1;
t0=0;
tau=.015;
N=2100;
t=-tau*N:tau:tau*N;
f=cos(w0*t).*exp(-(t-t0).^2./W^2);
plot(t,f)
figure
[w,P]=wPSpectrum(f,1/tau);
plot(w,P)


%   W  |  dt  |  dw  |  dtdw
%   ------------------------
%   10 | 16.6 | .24  |  3.98
%   1  |  1.5 | 2.4  |  3.6
%   .1 |  .12 |  31  |  3.72

%% P9.4

clear; close all;
% Build a time series made up of 5 different frequencies
% then use fft to display the spectrum
N=2^14;
tau=6000/N;
t=0:tau:(N-1)*tau;
% Make a signal consisting of angular frequencies
% w=1, 3, 3.5, 4, and 6
f=sin(t)+.5*sin(3*t)+.4*sin(3.01*t)+.7*sin(4*t)+.2*sin(6*t);
alpha=15;
win = window(@gausswin,length(f),alpha)';
% plot(t,win)
% title('window vs time')
% figure
% plot(t,f);
f = f .* win;
% figure
% plot(t,f);
% % the time plot is very busy and not very helpful
% plot(t,f)
% title('Time Series')
% now take the fft and display the power spectrum
g=fft(f);
P=abs(g).^2;
dw=2*pi/(N*tau);
w=0:dw:2*pi/tau-dw;
P=P/max(P);
figure
plot(w,P)
xlabel('\omega')
ylabel('P(\omega)')
title('Power Spectrum, including aliased points')

%% P9.5

clear; close all;
N=2^10;
tau=100/N;
t=0:tau:(N-1)*tau;
f=cos(t).^4;
% f=3/8+1/2*cos(2*t)+1/8*cos(4*t);
alpha=10;
% plot(t,f);
win = window(@gausswin,length(f),alpha)';
f = f .* win;
% plot(t,f);
g=fft(f);
P=abs(g).^2;
dw=2*pi/(N*tau);
w=0:dw:2*pi/tau-dw;
P=P/max(P);
figure
plot(w,P)
xlabel('\omega')
ylabel('P(\omega)')
title('Power Spectrum, including aliased points')


