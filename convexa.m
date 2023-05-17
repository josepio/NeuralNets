%funções convexas
clc;
x=-3.0:0.1:3.0
y1=x.^2;
y2=3.*sin(x);
y3=x.^3-5.
%subplot(1,3,1);plot(x,y1);subplot(1,3,2);plot(x,y2);subplot(1,3,3);plot(x,y3);
figure(1)
plot(x,y1,LineWidth = 2);
xlabel('w');
ylabel('f(w)=w^2');
grid on
figure(2)
plot(x,y2,LineWidth = 2);
xlabel('w');
ylabel('f(w)=3sen(w)');
grid on
figure(3)
plot(x,y3,LineWidth = 2);
xlabel('w');
ylabel('f(w)=w^3-5w');
grid on
