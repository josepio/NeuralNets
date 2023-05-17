% 1a derivada da função Gaussiana
function y = dgauss(x)
sigma =1;
a=x./(sigma.^3.*sqrt(2.*pi)); 
y=a.*exp(-x.^2/(2*sigma^2));
end