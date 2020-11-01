function F=rhs5_4b(t, u)
global g;
F=zeros(length(u),1);
F(1)=u(2);
F(2)=0;
F(3)=u(4);
F(4)=-g;