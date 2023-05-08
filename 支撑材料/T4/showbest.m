% 清空所有变量
clear
% 清空屏幕
clc

% R = load("ret.mat");
% R = [R.res];
% 
% x = R(1,:);
% y = R(2,:);
% z = R(3,:);
% 
% xlswrite('best.xlsx',x,'A1:J1');
% xlswrite('best.xlsx',y,'A2:J2');
% xlswrite('best.xlsx',z,'A3:J3');

% 时间跨度取0-200,间隔为0.01
tspan = 0:0.01:200;

% 初始值
y0 = [0,0,0,0,0,0,0,0.2019];

% x = [91132.8979 26977.6055];
% 
% [~,Y] = ode45( @(T,Y) offn(T,Y,x(1),x(2)), tspan, y0);
%  
% 积分的位置
% t0 = 150;
% t1 = 190;
% 
% R1 = 0;
% R2 = 0;
% for j = t0:0.01:t1-0.01
%     R1 = R1 + 0.005*x(1)*(power(abs(Y(int16(j*100),2)),2) ...
%         +power(abs(Y(int16(j*100+1),2)),2));
% 
%     R2 = R2 + 0.005*x(2)*(power(abs(Y(int16(j*100),4)),2) ...
%             +power(abs(Y(int16(j*100+1),4)),2));
% end
% 
% R = (R1+R2)/(t1-t0);

%R1纵摇 R2垂荡
% fprintf("The R1 is %.4f\tThe R2 is %.4f\n",R1/(t1-t0),R2/(t1-t0));

% 获取计算三维的数据
% 积分区间
t0 = 150;
t1 = 190;

res = [];

for gb = 91100:1:91150
    for gk = 26950:1:27000
    
        % 调用语句
        % ofn为直接算，offn为相对
        [T,Y] = ode45( @(T,Y) offn(T,Y,gb,gk), tspan, y0);  
    
        R1 = 0;
        R2 = 0;

        for j = t0:0.01:t1-0.01
            R1 = R1 + 0.005*gb*(power(abs(Y(int16(j*100),2)),2) ...
                +power(abs(Y(int16(j*100+1),2)),2));

            R2 = R2 + 0.005*gk*(power(abs(Y(int16(j*100),4)),2) ...
                +power(abs(Y(int16(j*100+1),4)),2));
        end
        
        R = (R1+R2)/(t1-t0);
    
        res = [res R];
    
    end
    fprintf("The gb: %.4f has done!\n",gb)
end

fprintf("end\n");
