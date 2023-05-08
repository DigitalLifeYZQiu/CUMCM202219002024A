% 清空所有变量
clear
% 清空屏幕
clc

% 时间跨度取0-200,间隔为0.2
tspan = 0:0.2:200;
% 初始值
y0 = [0,0,0,0.2019];

% 调用语句
% ofn为直接算，offn为相对
[T,Y] = ode45( @offn, tspan, y0 );

% 绘图

% 浮子速度
figure(1);
plot(T,Y(:,1),'-b')
xlabel('时间/s','Fontsize',18);
ylabel('x1的变化率(m/s)','Fontsize',18);
title('浮子速度v1随时间推移的值','Fontsize',18)
legend('x1的变化率')

% 振子速度
figure(2);
plot(T,Y(:,1)+Y(:,2),'-r')
xlabel('时间/s','Fontsize',18);
ylabel('x2的变化率(m/s)','Fontsize',18);
title('振子速度v2随时间推移的值','Fontsize',18)
legend('x2的变化率')

% 浮子位移
figure(3);
plot(T,Y(:,3),'-b')
xlabel('时间/s','Fontsize',18);
ylabel('x1(m)','Fontsize',18);
title('浮子位移x1随时间推移的值','Fontsize',18)
legend('x1')

xx = Y(1,3) + Y(1,4) - 2;

% 振子位移
figure(4);
plot(T,Y(:,4)+Y(:,3)-2-xx,'-r')
xlabel('时间/s','Fontsize',18);
ylabel('x2(m)','Fontsize',18);
title('振子位移x2随时间推移的值','Fontsize',18)
legend('x2')

xlswrite('result1-2.xlsx',T,'A3:A903')
xlswrite('result1-2.xlsx',Y(:,3),'B3:B903');
xlswrite('result1-2.xlsx',Y(:,1),'C3:C903');
xlswrite('result1-2.xlsx',Y(:,3)+Y(:,4)-2-xx,'D3:D903');
xlswrite('result1-2.xlsx',Y(:,1)+Y(:,2),'E3:E903');

fprintf("end\n")