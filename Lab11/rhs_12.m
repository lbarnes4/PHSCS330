function F=rhs_12(t, u)
global w0 b w L;
F=zeros(length(u),1);
F(1)=u(2);
F(2)=-w0^2*sin(u(1))-b*w^2/L*sin(u(1))*sin(w*t);