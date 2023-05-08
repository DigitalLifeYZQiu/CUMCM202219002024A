% 清空所有变量
clear
% 清空屏幕
clc

% 时间跨度取0-200,间隔为0.2
tspan = 0:0.2:147;
% 初始值
y0 = [0,0,0,0,0,0,0,0.2019];

% 调用语句
% ofn为直接算，offn为相对
[T,Y] = ode45( @offn11, tspan, y0 );
X=Y(:,7);   %浮子垂荡位移
X1=Y(:,3);  %浮子垂荡速度
A=Y(:,5);   %浮子纵摇角位移
A1=Y(:,1);   %浮子纵摇角速度
R=Y(:,8);    %振子相对浮子径向位移
R1=Y(:,4);    %振子相对浮子径向速度
B=Y(:,6);    %振子相对浮子角位移
B1=Y(:,2);   %振子相对浮子角速度

Z=X+R.*cos(A+B)-0.2019;  %振子的垂荡位移
Z1=X1+R1.*cos(A+B)-R.*sin(A+B).*(A1+B1); %振子的纵摇速度
C=A+B;           %振子的纵摇角位移
C1=A1+B1;        %振子的纵摇角速度

% % 浮子角速度
figure(1);
plot(T,Y(:,1),'-b')
xlabel('时间/s','Fontsize',18);
ylabel('浮子的角速度(rad/s)','Fontsize',18);
title('浮子角速度','Fontsize',18)
legend('浮子的角速度')

%振子相对浮子的角速度
% figure(2);
% plot(T,Y(:,2),'-b')
% xlabel('时间/s','Fontsize',18);
% ylabel('振子相对浮子的角速度(rad/s)','Fontsize',18);
% title('振子相对浮子的角速度','Fontsize',18)
% legend('振子相对浮子的角速度')

%浮子的垂荡速度
figure(3);
plot(T,Y(:,3),'-b')
xlabel('时间/s','Fontsize',18);
ylabel('浮子的垂荡速度(m/s)','Fontsize',18);
title('浮子的垂荡速度','Fontsize',18)
legend('浮子的垂荡速度')

%振子相对浮子的径向速度
% figure(4);
% plot(T,Y(:,4),'-b')
% xlabel('时间/s','Fontsize',18);
% ylabel('振子相对浮子的径向速度(m/s)','Fontsize',18);
% title('振子相对浮子的径向速度','Fontsize',18)
% legend('振子相对浮子的径向速度')

%浮子的角位移
figure(5);
plot(T,Y(:,5),'-b')
xlabel('时间/s','Fontsize',18);
ylabel('浮子的角位移(rad)','Fontsize',18);
title('浮子的角位移','Fontsize',18)
legend('浮子的角位移')

%振子相对浮子的角位移
% figure(6);
% plot(T,Y(:,6),'-b')
% xlabel('时间/s','Fontsize',18);
% ylabel('振子相对浮子的角位移(rad)','Fontsize',18);
% title('振子相对浮子的角位移','Fontsize',18)
% legend('振子相对浮子的角位移')

%浮子的垂荡位移
figure(7);
plot(T,Y(:,7),'-b')
xlabel('时间/s','Fontsize',18);
ylabel('浮子的垂荡位移(m)','Fontsize',18);
title('浮子的垂荡位移','Fontsize',18)
legend('浮子的垂荡位移')

%振子相对浮子的径向位移
% figure(8);
% plot(T,Y(:,8),'-b')
% xlabel('时间/s','Fontsize',18);
% ylabel('振子相对浮子的径向位移(m)','Fontsize',18);
% title('振子相对浮子的径向位移','Fontsize',18)
% legend('振子相对浮子的径向位移')

%振子垂荡位移
figure(9);
plot(T,Z,'-b')
xlabel('时间/s','Fontsize',18);
ylabel('振子垂荡位移(m)','Fontsize',18);
title('振子垂荡位移','Fontsize',18)
legend('振子垂荡位移')

%振子垂荡速度
figure(10);
plot(T,Z1,'-b')
xlabel('时间/s','Fontsize',18);
ylabel('振子垂荡速度(m/s)','Fontsize',18);
title('振子垂荡速度','Fontsize',18)
legend('振子垂荡速度')

%振子纵摇角位移
figure(11);
plot(T,C,'-b')
xlabel('时间/s','Fontsize',18);
ylabel('振子纵摇角位移(m)','Fontsize',18);
title('振子纵摇角位移','Fontsize',18)
legend('振子纵摇角位移')

%振子纵摇角速度
figure(12);
plot(T,C1,'-b')
xlabel('时间/s','Fontsize',18);
ylabel('振子纵摇角速度(m/s)','Fontsize',18);
title('振子纵摇角速度','Fontsize',18)
legend('振子纵摇角速度')






