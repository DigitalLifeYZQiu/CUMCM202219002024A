function dy=offn(t,y)
dy=zeros(4,1);
dy(1)=(-31541.3*y(3)-656.3616*y(1)+6250*cos(1.4005*t)-2433*9.8-2433*dy(2))/(4866+2433+1335.535);
dy(2)=(-80000*(y(4)-0.5)-10000*y(2)*power(abs(y(2)),0.5))/2433 - dy(1) - 9.8;
dy(3)=y(1);
dy(4)=y(2);
end

