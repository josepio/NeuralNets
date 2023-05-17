%plota gaussiana
clc
clear all
t=-3:0.01:3;
y=gauss(t);
plot(t,y,'LineWidth',3);
grid on
axis([-3 3 -0.1 0.5]);
title ('Função Gaussiana')
xlabel ('u');
ylabel ('gauss(u)')