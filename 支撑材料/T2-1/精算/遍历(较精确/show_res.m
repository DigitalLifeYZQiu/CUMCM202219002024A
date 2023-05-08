% 清空所有变量
clear
% 清空屏幕
clc

% 步长遍历
k = 32000:0.01:33000;

r1 = load("res_ppart.mat");

% 结果存储
res = [r1.res];

% 最大值
[M,I] = max(res);

fprintf("The max P is %.4f,the index is %d\n",M,I);
fprintf("The best k is %.4f\n",k(I));

% 绘图

figure(1);
plot(k,res,'-r');
grid on
text(k(I),res(I),'o','color','b')
text(32593, 391.43, ['(',num2str(k(I)),',',num2str(res(I)),')'],'color','b');
xlabel('阻尼系数','Fontsize',18);
ylabel('输出功率/W','Fontsize',18);
title('输出功率P随阻尼系数的增加的值','FontSize',18);
legend('输出功率')

fprintf("end\n")