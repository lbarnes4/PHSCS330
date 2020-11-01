function F=rhs5_2a(t,u)
F=zeros(length(u),1);
F(1)=u(2);
global g;
F(2)=-g;