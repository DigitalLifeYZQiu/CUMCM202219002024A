% 清空所有变量
clear
% 清空屏幕
clc

lb = [0;0];
ub = [100000;1];

res = [];

for i = 1:10

    tic
    x = ga(@tar,2,[],[],[],[],lb,ub);
    -tar(x);
    toc

    fprintf("The gb is %.4f\tThe gk is %.4f\n",x(1),x(2));

    % 积分的位置
    t0 = 150;
    t1 = 190;
    
    % 时间跨度取0-200,间隔为0.01
    tspan = 0:0.01:200;
    
    % 初始值
    y0 = [0,0,0,0.2019];

    [~,Y] = ode45( @(T,Y) offn(T,Y,x(1),x(2)), tspan, y0);

    R = 0;
    for j = t0:0.01:t1-0.01
        R = R + 0.005*x(1)*(power(abs(Y(int16(j*100),2)),2+x(2)) ...
            +power(abs(Y(int16(j*100+1),2)),2+x(2)));
    end

    res = [res [x(1) x(2) R / (t1-t0)]];

    fprintf("The index of %d has done!\n",i)

end

fprintf("end\n")