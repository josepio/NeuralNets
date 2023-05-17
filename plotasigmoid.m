%plota sigmoid
A=10;
B=1;
C=0;
t=-5:0.001:5;
%y=1./(1+exp(-B.*(t-C));
y=1./(1+exp(-t));
dy=y.*(1-y);
%plot(t,y,'LineWidth',3);
%plot(t,dy,'LineWidth',3);
plot(t,y,t,dy,'--','LineWidth',3);
grid on
axis([-5 5 0 1.1]);
title ('Função Sigmoide')
xlabel ('u');
ylabel ('s(u)')