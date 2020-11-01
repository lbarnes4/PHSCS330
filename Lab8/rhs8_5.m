function [u1,u2]=rhs8_5(t, u)
global G m1 m2;
denom=sqrt((u(1)-u(7))^2+(u(2)-u(8))^2+(u(3)-u(9))^2)^3;
u1=zeros(length(u)/2,1);
u2=zeros(length(u)/2,1);
u1(1)=u(4);%x1dot
u1(2)=u(5);%y1dot
u1(3)=u(6);%z1dot
u1(4)=-G*m2*(u(1)-u(7))/denom;
u1(5)=-G*m2*(u(2)-u(8))/denom;
u1(6)=-G*m2*(u(3)-u(9))/denom;
u2(1)=u(10);%x2dot
u2(2)=u(11);%y2dot
u2(3)=u(12);%z2dot
u2(4)=G*m1*(u(1)-u(7))/denom;
u2(5)=G*m1*(u(2)-u(8))/denom;
u2(6)=G*m1*(u(3)-u(9))/denom;