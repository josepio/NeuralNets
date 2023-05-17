% NMP - Discriminador Linear - AND e OR logico
clear all
clc
x1=[1 1 0 0];
x2=[1 0 1 0];
w1=1;
w2=1;
%teta=0.5; % OR logico
teta=1.5;  % AND logico
hold on
for i=1:4
    u=(x1(i)*w1)+(x2(i)*w2)-teta; % Classificacao
    if(u>=0)
        Y(i)=1;
        % Desenha um ponto branco
        plot(x1(i), x2(i),'o','MarkerSize',10,'MarkerFaceColor',[0 0 0]);
    else
        % Desenha um ponto preto
        plot(x1(i), x2(i),'o','MarkerSize',10,'MarkerFaceColor',[1 1 1]);
        Y(i)=0;
    end
end
% Desenha o hiperplano
axis([-0.5,1.5,-0.5,1.5]);
xl1=-1.0:0.01:1.5;
xl2=-xl1*w1/w2+teta; % Hiperplano
plot(xl1,xl2,'LineWidth',3);
if teta == 0.5
    titulo = 'Discriminador Linear NMP - OR';
else
     titulo = 'Discriminador Linear NMP - AND';
end
title (titulo);
xlabel ('x1');
ylabel ('x2');
grid on;
hold off
% Tabela verdade
[x1' x2' Y']