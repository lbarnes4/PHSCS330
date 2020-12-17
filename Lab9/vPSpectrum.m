function [v,P]=vPSpectrum(f, fs)
tau=1/fs;
N=length(f);
g=fft(f);
P=abs(g).^2;
dv=1/(N*tau);
v=0:dv:fs-dv;
