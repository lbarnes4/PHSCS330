function F=rhs10_8(t, u)
global gamma g dl wp L0;
dldt=-dl*wp*sin(wp*t);
l=L0+dl*cos(wp*t);
F=zeros(length(u),1);
F(1)=u(2);
F(2)=-2*dldt*u(2)/l-gamma*u(2)-g/l*sin(u(1));