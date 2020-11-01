function F=rhs8_1(t, u)
global G m1 m2;
denom=sqrt((u(1)-u(7))^2+(u(2)-u(8))^2+(u(3)-u(9))^2)^3; % change to 3.1 for P8.6
F=zeros(length(u),1);
F(1)=u(4);%x1dot
F(2)=u(5);%y1dot
F(3)=u(6);%z1dot
F(4)=-G*m2*(u(1)-u(7))/denom;
F(5)=-G*m2*(u(2)-u(8))/denom;
F(6)=-G*m2*(u(3)-u(9))/denom;
F(7)=u(10);%x2dot
F(8)=u(11);%y2dot
F(9)=u(12);%z2dot
F(10)=G*m1*(u(1)-u(7))/denom;
F(11)=G*m1*(u(2)-u(8))/denom;
F(12)=G*m1*(u(3)-u(9))/denom;