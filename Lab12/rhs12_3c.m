function F=rhs12_3c(t, u)
global m A gamma;
F=zeros(length(u),1);
F(1)=u(2);
F(2)=(u(1)-u(1).^3 +A*cos(2*t)-m*gamma*u(2))/m;