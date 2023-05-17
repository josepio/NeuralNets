t=-10:0.001:10;
y=heaviside(t);
plot(t, h(t,0),'LineWidth',3);
%axis([-5 5 0 1.5]);
axis([-2 2 -1.5 1.5]);
%title ('Função Degrau');
title ('Função Degrau Bipolar');
xlabel ('u');
ylabel ('g(u)');
grid on