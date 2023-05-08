% 清空所有变量
clear
% 清空屏幕
clc

% 初步最优值
% gb = 91132.8979;
% gk = 26977.6055;
% R = 643.7957;

gb = 91100:1:91150;
gk = 26950:1:27000;
R = load("bestret.mat");
R = [R.res];
R = reshape(R,51,51);

% [X,Y] = meshgrid(gb,gk);

% scatter(gb,gk,5,R(:,1))
% 
% figure
% 
[X,Y,Z] = griddata(gb,gk,R,linspace(min(gb),max(gb))',linspace(min(gk),max(gk)),'v4');
% pcolor(X,Y,Z);shading interp

% 平面等高线颜色变化
% figure,contourf(X,Y,Z)
% xlabel('旋转阻尼器阻尼系数');
% ylabel('直线阻尼器阻尼系数')

% 三维
figure,mesh(X,Y,Z),
title('平均输出功率-[旋转阻尼器阻尼系数,直线阻尼器阻尼系数]');
set(xlabel('旋转阻尼器阻尼系数'),'Rotation',15);
set(ylabel('直线阻尼器阻尼系数'),'Rotation',-30);
zlabel('功率P(W)');

fprintf("end\n")