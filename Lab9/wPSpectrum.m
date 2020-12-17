function [w,P]=wPSpectrum(f, fs)
tau=1/fs;
N=length(f);
g=fft(f);
P=abs(g).^2;
dw=2*pi/(N*tau);
w=0:dw:2*pi/tau-dw;
