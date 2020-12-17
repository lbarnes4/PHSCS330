function F=rhs2(t,u)
global w0 a tmax
F=zeros(length(u),1);

% decide what the driving frequency should be
if t < tmax
    wd=w0*(1-t/tmax);
else
    wd=0;
end

F(1)=u(2); % d(theta)/dt
F(2)=a*sin(wd*t)-w0^2*sin(u(1)); % d^2(theta)/dt^2