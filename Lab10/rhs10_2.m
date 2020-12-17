function F = rhs10_2(t, u)
global gamma w0 wp a;

F=zeros(length(u),1);
F(1)=u(2);
F(2)=-w0^2*sin(u(1))+a*cos(wp*t)-gamma*u(2);