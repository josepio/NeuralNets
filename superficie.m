% Definir intervalo para x e y
[x, y] = meshgrid(-5:0.1:5);

% Calcular valores de z da superfície quadrática negativa
z = -x.^2 - y.^2;

% Plotar a superfície
surf(x, y, z);
