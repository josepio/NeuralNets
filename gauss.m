% Funcao Gaussiana

function y = gauss(x)
sigma = 1;
m = 0;                  % media - posicao do centro do pico
a=1/(sigma*sqrt(2*pi)); % altura da curva
y=a*exp(-0.5.*((x-m)/sigma).^2);
end