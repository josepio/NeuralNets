%Superfície
x = linspace(-5, 5, 100);
y = linspace(-5, 5, 100);
[X,Y] = meshgrid(x,y);
Z = X.^2 + Y.^2;
surf(X,Y,Z);
