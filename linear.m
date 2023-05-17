%plota linear
clc
clear all
t=0:0.001:1;
y=t
plot(t,y,'LineWidth',3);
grid on
axis([0 1.0 0 1.0]);
title ('Função Linear')
xlabel ('u');
ylabel ('l(u)')