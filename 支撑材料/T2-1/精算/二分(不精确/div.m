% 清空所有变量
clear
% 清空屏幕
clc

% 时间跨度取0-200,间隔为0.01
tspan = 0:0.01:200;

% 初始值
y0 = [0,0,0,0.2019];

% 步长遍历
k = 0:1:10000;

% 结果存储
res = 0;
pos = 0;

% 积分的位置
t0 = 40;
t1 = 180;

% 边界
l = 32000;
r = 33000;
s = 32599;

% 边界值
[~,Yl] = ode45( @(T,Yl) offn(T,Yl,l), tspan, y0);
[~,Yr] = ode45( @(T,Yr) offn(T,Yr,r), tspan, y0);
[~,Ys] = ode45( @(T,Ys) offn(T,Ys,s), tspan, y0);

Rl = 0;
Rr = 0;
Rs = 0;
for j = t0:0.01:t1-0.01
        Rl = Rl + 0.005*l*(power(Yl(int16(j*100),2),2) ...
            +power(Yl(int16(j*100+1),2),2));
        Rr = Rr + 0.005*r*(power(Yr(int16(j*100),2),2) ...
            +power(Yr(int16(j*100+1),2),2));
        Rs = Rs + 0.005*s*(power(Ys(int16(j*100),2),2) ...
            +power(Ys(int16(j*100+1),2),2));
end

Rm = 0;
Rmm = 0;

while r-l > 1e-6
    mid = (r-l)/2 + l;
    mm = mid + 0.0001;

    % 调用语句
    % ofn为直接算，offn为相对
    [~,Ym] = ode45( @(T,Ym) offn(T,Ym,mid), tspan, y0);
    [~,Ymm] = ode45( @(T,Ymm) offn(T,Ymm,mm), tspan, y0);
    % Y(:,2)

    Rm = 0;
    Rmm = 0;

    for j = t0:0.01:t1-0.01
        Rm = Rm + 0.005*mid*(power(Ym(int16(j*100),2),2) ...
            +power(Ym(int16(j*100+1),2),2));
        Rmm = Rmm + 0.005*mm*(power(Ymm(int16(j*100),2),2) ...
            +power(Ymm(int16(j*100+1),2),2));
    end
    
    if Rm - Rmm < 1e-6
        l = mm;Rl = Rmm;
    else if Rm - Rmm > 1e-6
        r = mid;Rr = Rm;
    else
        if Rr - Rl > 1e-6
            l = l + 0.01;
            [~,Yl] = ode45( @(T,Yl) offn(T,Yl,l), tspan, y0);
            Rl = 0;
            for j = t0:0.01:t1-0.01
                Rl = Rl + 0.005*l*(power(Yl(int16(j*100),2),2) ...
                    +power(Yl(int16(j*100+1),2),2));
            end
        else
            r = r - 0.01;
            [~,Yr] = ode45( @(T,Yr) offn(T,Yr,r), tspan, y0);
            Rr = 0;
            for j = t0:0.01:t1-0.01
                Rr = Rr + 0.005*r*(power(Yr(int16(j*100),2),2) ...
                    +power(Yr(int16(j*100+1),2),2));
            end
        end
    end

    end
end

fprintf("Rs = %.4f\n",Rs/140);

fprintf("r = %.4f\tl = %.4f\nRm = %.4f\tRmm = %.4f\n",r,l,Rm/140,Rmm/140);

% 绘图
% figure(1);
% plot(k,res,'-r');
% xlabel('阻尼系数','Fontsize',18);
% ylabel('输出功率/W','Fontsize',18);
% title('输出功率P随阻尼系数的增加的值','FontSize',18);
% legend('输出功率')

% 相对速度
% figure(4);
% plot(T,Y(:,2),'-r')
% xlabel('时间/s','Fontsize',18);
% ylabel('y2(m/s)','Fontsize',18);
% title('相对速度y2随时间推移的值','Fontsize',18)
% legend('y2')

fprintf("end\n")