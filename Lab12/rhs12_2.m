function F=rhs12_2(t, u)
global e w0 l A w;
F=zeros(length(u),1);
F(1)=u(2);
F(2)=e*(l^2-u(1)^2)*u(2)-w0^2*u(1)+A*cos(w*t);