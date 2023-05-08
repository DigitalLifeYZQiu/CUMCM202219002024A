% 清空所有变量
clear
% 清空屏幕
clc

lb = [0;0];
ub = [100000;100000];

res = [];

% 求十次取最优
for i = 1:1:10

    tic
    x = ga(@tar,2,[],[],[],[],lb,ub);
    -tar(x);
    toc
    
    fprintf("The gb is %.4f\tThe gk is %.4f\n",x(1),x(2));

    % 时间跨度取0-200,间隔为0.01
    tspan = 0:0.01:200;
    
    % 初始值
    y0 = [0,0,0,0,0,0,0,0.2019];

    [~,Y] = ode45( @(T,Y) offn(T,Y,x(1),x(2)), tspan, y0);

    % 积分的位置
    t0 = 150;
    t1 = 190;

    R1 = 0;
    R2 = 0;
    for j = t0:0.01:t1-0.01
        R1 = R1 + 0.005*x(1)*(power(abs(Y(int16(j*100),2)),2) ...
            +power(abs(Y(int16(j*100+1),2)),2));
        R2 = R2 + 0.005*x(2)*(power(abs(Y(int16(j*100),4)),2) ...
            +power(abs(Y(int16(j*100+1),4)),2));
    end

    R = (R1+R2)/(t1-t0);

    res = [res [x(1) x(2) R]];

end

res = reshape(res,3,10);

x = res(1,:);
y = res(2,:);
z = res(3,:);

xlswrite('best.xlsx',x,'A1:I1');
xlswrite('best.xlsx',y,'A2:I2');
xlswrite('best.xlsx',z,'A3:I3');

fprintf("end\n")