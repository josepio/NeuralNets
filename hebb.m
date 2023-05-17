%Aprendizado de Hebb
clear all;
n=1; %numero de neuronio
m=3; %numero de pares entrada/saida
eta = 0.5 %coeficiente de aprendizagem
x=[-1 -1 1;
    -1 1 1;
    1 -1 1;
    1  1 1];
y = [-1 -1 -1 1];
w =[0 0 0];
dw = [0 0 0];
for i=1:4
    for j=1:3
        dw(j) = eta*x(i,j)*y(i);
    end
    w = w + dw;
end
x, y', w
