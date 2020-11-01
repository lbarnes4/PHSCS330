function F=rhs6_3(t,u)
global w0 gamma F0 m w;
F=zeros(length(u),1);
F(1)=u(2); % x
F(2)=-w0^2*u(1)-2*gamma*u(2)+F0/m*cos(w*t); % Vx