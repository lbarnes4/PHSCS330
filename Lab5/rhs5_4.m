function F=rhs5_4(t, u)
global Cd pAir a m g;
F=zeros(length(u),1);
F(1)=u(2); % Vx
F(2)=-Cd*pAir*pi*a^2*u(2)*sqrt(u(2)^2+u(4)^2)/(2*m);
F(3)=u(4);
F(4)=-Cd*pAir*pi*a^2*u(4)*sqrt(u(2)^2+u(4)^2)/(2*m)-g;