function F=rhs6_1(t,u)
global w0;
F=zeros(length(u),1);
F(1)=u(2); % x
F(2)=-w0^2*u(1); % Vx