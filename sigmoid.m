% Função de ativação sigmoide
function y = sigmoid(x)
    y = 1./(1 + exp(-x));
end