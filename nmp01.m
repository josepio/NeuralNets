% NMP - Função OR c/ 3 entradas
% Limiar = 1
clear all
clc
x1=[1 1 0 0];
x2=[1 0 1 0];
x3=[1 1 0 0];
w1=1;
w2=1;
w3=1;
t=1;
for i=1:4
    u=(x1(i)*w1)+(x2(i)*w2)+x3(i)*w3;
    if(u>=t)
        Y(i)=1;
    else
        Y(i)=0;
    end
end
[x1' x2' x3' Y']