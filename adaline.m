% Definir os dados de entrada (X) e saídas esperadas (Y)
clear all
X = [0 0; 0 1; 1 0; 1 1];
Y = [0; 0; 0; 1];

% Inicializar os pesos aleatoriamente
w = rand(1, size(X, 2) + 1);

% Definir a taxa de aprendizado e o número máximo de épocas
learning_rate = 0.1;
max_epochs = 100;

% Adicionar um bias aos dados de entrada
X = [ones(size(X, 1), 1) X];

% Treinar o ADALINE
for epoch = 1:max_epochs
    for i = 1:size(X, 1)
        % Calcular a saída do ADALINE para a entrada i
        output = X(i,:) * w';

        % Calcular o erro e atualizar os pesos, se necessário
        error = Y(i) - output;
        w = w + learning_rate * error * X(i,:);
    end
end

% Testar o ADALINE
for i = 1:size(X, 1)
    output = X(i,:) * w';
    if output >= 0.5
        output = 1;
    else
        output = 0;
    end
    fprintf('Input: [%d %d] Output: %d\n', X(i,2), X(i,3), output);
end
