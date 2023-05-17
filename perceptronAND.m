% Perceptron para o AND
clear all
% Definir os dados de entrada (X) e saídas esperadas (Y)
X = [0 0; 0 1; 1 0; 1 1];
Y = [0; 0; 0; 1];

% Inicializar os pesos aleatoriamente
w = rand(1, size(X, 2) + 1);

% Definir a taxa de aprendizado e o número máximo de épocas
learning_rate = 0.1;
max_epochs = 10000;

% Adicionar um bias aos dados de entrada
X = [ones(size(X, 1), 1) X];

% Treinar o perceptron
for epoch = 1:max_epochs
    for i = 1:size(X, 1)
        % Calcular a saída do perceptron para a entrada i
        output = sign(X(i,:) * w');

        % Calcular o erro e atualizar os pesos, se necessário
        error = abs(Y(i)) - output;
        w = w + learning_rate * error * X(i,:);
    end
end

% Testar o perceptron
for i = 1:size(X, 1)
    output = sign(X(i,:) * w');
    fprintf('Input: [%d %d] Output: %d\n', X(i,2), X(i,3), output);
end
