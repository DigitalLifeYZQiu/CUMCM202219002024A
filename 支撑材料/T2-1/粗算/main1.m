% 清空所有变量
clear
% 清空屏幕
clc

% 时间跨度取0-200,间隔为0.01
tspan = 0:0.01:200;

% 初始值
y0 = [0,0,0,0.2019];

% 步长遍历
% 粗
k = 0:0.01:100000;

% 结果存储
res = [];

% 积分的位置
t0 = 40;
t1 = 180;

for i = 0:0.01:100000
    gb = i;
    % 调用语句
    % ofn为直接算，offn为相对
    [T,Y] = ode45( @(T,Y) offn(T,Y,gb), tspan, y0);

    % Y(:,2)

    R = 0;
    for j = t0:0.01:t1-0.01
        R = R + 0.005*gb*(power(Y(int16(j*100),2),2) ...
            +power(Y(int16(j*100+1),2),2));
    end
    
    res(end+1) = R/(t1-t0);

%     fprintf("%.4f\n",R);
% 
    fprintf("%d Done!\n",i);
end

[M,L] = max(res);

fprintf("The max P is %.4f,the index is %d\n",M,I);

% 绘图

figure(1);
plot(k,res,'-r');
xlable('阻尼系数','Fontsize',18);
ylable('输出功率/W','Fontsize',18);
title('输出功率P随阻尼系数的增加的值','FontSize',18);
legend('输出功率')

% 相对速度
% figure(4);
% plot(T,Y(:,2),'-r')
% xlabel('时间/s','Fontsize',18);
% ylabel('y2(m/s)','Fontsize',18);
% title('相对速度y2随时间推移的值','Fontsize',18)
% legend('y2')

fprintf("end\n")