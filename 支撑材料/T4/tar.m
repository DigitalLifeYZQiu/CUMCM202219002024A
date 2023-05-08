function R=tar(x)
    
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

    R = -R;

%     fprintf("The gb is %.4f\tThe gk is %.4f\tThe R is %.4f\n",x(1),x(2),-R);

end

