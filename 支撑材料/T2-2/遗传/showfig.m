% 清空所有变量
clear
% 清空屏幕
clc

% 时间跨度取0-200,间隔为0.01
tspan = 0:0.01:200;

% 初始值
y0 = [0,0,0,0.2019];

% 积分的位置
t0 = 150;
t1 = 190;

% 最优值
% gb = 93644.8967;
% gk = 0.5239;
% R = 300.2583;

gb = 93600:1:93700;
gk = 0:0.01:1;
R = load("res.mat");
R = [R.res];
R = reshape(R,101,101);

% [X,Y] = meshgrid(gb,gk);

% scatter(gb,gk,5,R(:,1))
% 
% figure
% 
[X,Y,Z] = griddata(gb,gk,R,linspace(min(gb),max(gb))',linspace(min(gk),max(gk)),'v4');
% pcolor(X,Y,Z);shading interp

% 平面等高线颜色变化
figure,contourf(X,Y,Z)
xlabel('damping coefficient');
ylabel('power value')
text(93644.8967,0.5239,'o','color','r')
text(93644.8967, 0.5239-0.05, ['(',num2str(93644.8967),',',num2str(0.5239),',',num2str(300.2583),')'],'color','b');


% 三维
figure,mesh(X,Y,Z),
title('平均输出功率-[阻尼系数,幂值]');
set(xlabel('阻尼系数'),'Rotation',15);
set(ylabel('幂值'),'Rotation',-30);
zlabel('功率P(W)');
% set(zlabel('功率P(W)'),'Rotation',30);
text(93644.8967,0.5239, 300.2583,'o','color','r')
text(93644.8967, 0.5239, 300.2583+10, ['(',num2str(93644.8967),',',num2str(0.5239),',',num2str(300.2583),')'],'color','b');

% 获取res数据
% 遍历0:0.01:1
% res = [];
% 
% for gb = 93600:1:93700
%     for gk = 0:0.01:1
%     
%         % 调用语句
%         % ofn为直接算，offn为相对
%         [T,Y] = ode45( @(T,Y) offn(T,Y,gb,gk), tspan, y0);  
%     
%         R = 0;
%         for j = t0:0.01:t1-0.01
%             R = R + 0.005*gb*(power(abs(Y(int16(j*100),2)),2+gk) ...
%                 +power(abs(Y(int16(j*100+1),2)),2+gk));
%         end
%     
%         res = [res R/(t1-t0)];
%     
%     end
%     fprintf("The gb: %.4f has done!\n",gb)
% end

fprintf("end\n")