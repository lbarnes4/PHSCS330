function F=rhs12_3(t, u)
global m;
F=zeros(length(u),1);
F(1)=u(2);
F(2)=(u(1)-u(1).^3)/m;