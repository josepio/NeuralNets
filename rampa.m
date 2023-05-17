%plota degrau
t=-2:0.001:2;
y=r(t,1);
plot(t, y,'LineWidth',3);
axis([-2 2 -1.5 1.5]);
%axis([-5 5 -1.5 1.5]);
title ('Função Rampa Simétrica')
xlabel ('u');
ylabel ('g(u)');
grid on