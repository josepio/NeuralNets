% Derivada da função de ativação sigmoide
function y = sigmoidDerivative(x)
    y = x.*(1-x);
end