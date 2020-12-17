function F=rhs10_3(t, u)
global gamma w0 e wp;
F=zeros(length(u),1);
F(1)=u(2);
F(2)=-gamma*u(2)-w0^2*(1+e*cos(wp*t))*u(1);