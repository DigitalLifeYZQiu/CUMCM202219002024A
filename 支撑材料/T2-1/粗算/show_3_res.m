% 清空所有变量
clear
% 清空屏幕
clc

% 步长遍历
k = 0:1:100001;

r1 = load("res_part1.mat");
r2 = load("res_part2.mat");
r3 = load("res_part3.mat");

% 结果存储
res = [r1.res r2.res r3.res];

% 积分的位置
t0 = 40;
t1 = 180;

% 最大值
[M,I] = max(res);

fprintf("The max P is %.4f,the index is %d\n",M,I);

% 绘图

figure(1);
plot(k,res,'-r');
grid on
text(k(I),res(I),'o','color','r')
text(k(I), res(I)-20, ['(',num2str(k(I)+1),',',num2str(res(I)),')'],'color','k');
xlabel('阻尼系数','Fontsize',18);
ylabel('输出功率/W','Fontsize',18);
title('输出功率P随阻尼系数的增加的值','FontSize',18);
legend('输出功率')

fprintf("end\n")