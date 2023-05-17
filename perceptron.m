%ADALINE para o problema do AND, OR e XOR
%Espaço de características
clc;
clear all;
%Configuração do neuronio
nu = 0.5; %Taxa de aprendizagem
%Saída desejada
t = [0 0 0 1];  %AND
%t = [0 1 1 1]; %OR
%t = [0 1 1 0];%XOR
%Pesos iniciais
w = [0.1 0.5 0.2];
%Entradas
x = [1 0 0; 
     1 0 1; 
     1 1 0; 
     1 1 1];
[n m] = size(x)
aprender = true;
i=0;
fez=false
while aprender
    aprender = false;
    for i=1:n
        xd = x(i,:);
        s = w*xd';
        if s <= 0
            s = 0;
        else
            s =1;
        end
        Erro = t(i)-s
        if Erro ~= 0
            for j=1:m
                w(j)=w(j)+nu*Erro*x(i,j)
            end
            fez = true;
        end
    end
    if fez
        aprender = true;
        fez = false;
    end
end  
Xp = [0 1 0];
Yp = [0 0 1];
figure(1)
axis([-1.0,1.5,-1.0,1.5]);
plot(Xp, Yp,'o','MarkerSize',10,'MarkerFaceColor',[0 0 0]);
hold on
grid on
axis([-1.0,1.5,-1.0,1.5]);
plot(1, 1,'o','MarkerSize',10,'MarkerFaceColor',[1 1 1]);
%superficie
x1=-1.0:0.01:1.5;
x2=(-w(1)-x1*w(2))/w(3);
plot(x1,x2,'LineWidth',3);
hold off
w