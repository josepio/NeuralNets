% Preparação dos dados de treinamento
X = [0 0; 0 1; 1 0; 1 1];
Y = [0; 1; 1; 0];

% Definir a arquitetura da rede MLP
inputLayerSize = 2;
hiddenLayerSize = 4;
outputLayerSize = 1;

% Inicialização aleatória dos pesos
W1 = randn(inputLayerSize, hiddenLayerSize);
W2 = randn(hiddenLayerSize, outputLayerSize);

% Definir hiperparâmetros
learningRate = 0.1;
numIterations = 10000;

% Algoritmo de treinamento do backpropagation
for i = 1:numIterations
    % Forward pass
    hiddenLayerOutput = sigmoid(X * W1);
    outputLayerOutput = sigmoid(hiddenLayerOutput * W2);

    % Cálculo do erro e da derivada
    error = Y - outputLayerOutput;
    outputLayerDelta = error .* sigmoidDerivative(outputLayerOutput);

    % Backward pass
    hiddenLayerError = outputLayerDelta * W2';
    hiddenLayerDelta = hiddenLayerError .* sigmoidDerivative(hiddenLayerOutput);

    % Atualização dos pesos
    W2 = W2 + learningRate * hiddenLayerOutput' * outputLayerDelta;
    W1 = W1 + learningRate * X' * hiddenLayerDelta;
end

% Testando a rede MLP treinada
Xtest = [0 0; 0 1; 1 0; 1 1];
hiddenLayerOutput = sigmoid(Xtest * W1)
outputLayerOutput = sigmoid(hiddenLayerOutput * W2)
