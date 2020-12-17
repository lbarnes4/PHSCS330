function F=rhs_14(t, u)
global w0 b w L;
F=zeros(length(u),1);
F(1)=u(2);
F(2)=-w0^2*sin(u(1))-b^2*w^2/(2*L^2)*sin(u(1))*cos(u(1));