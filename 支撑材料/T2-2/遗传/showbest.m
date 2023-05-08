% 清空所有变量
clear
% 清空屏幕
clc

R = load("ret.mat");
R = [R.res];
R = reshape(R,3,10);

x = R(1,:);
y = R(2,:);
z = R(3,:);

xlswrite('best.xlsx',x,'A1:I1');
xlswrite('best.xlsx',y,'A2:I2');
xlswrite('best.xlsx',z,'A3:I3');

fprintf("end\n");
