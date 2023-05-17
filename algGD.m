% Exemplo de treinamento de uma MLP com gradiente descendente

% Definicao dos dados de entrada e saida
X = [0 0; 0 1; 1 0; 1 1];
Y = [0; 1; 1; 0];

% Parametros da rede
n_input = size(X,2); % numero de entradas
n_hidden = 5; % numero de neurônios na camada oculta
n_output = 1; % numero de saídas
learning_rate = 0.1; % taxa de aprendizado
n_epochs = 10000; % numero de epocas de treinamento

% Inicializacao dos pesos da rede
W1 = randn(n_input,n_hidden); % pesos da camada de entrada para oculta
W2 = randn(n_hidden,n_output); % pesos da camada oculta para saida

% Loop de treinamento
for epoch = 1:n_epochs
    
    % Forward pass
    H = X*W1; % saida da camada oculta
    H = tanh(H); % aplicação da funcao de ativacao (tangente hiperbolica)
    Y_pred = H*W2; % saida da rede
    error = Y - Y_pred; % calculo do erro
    
    % Backward pass
    grad_W2 = H.'*error; % gradiente em relacao aos pesos da camada oculta para saida
    delta_output = error*W2.'.*sech(H).^2; % calculo do delta para a camada de saida
    grad_W1 = X.'*delta_output; % gradiente em relacao aos pesos da camada de entrada para oculta
    
    % Atualizacao dos pesos
    W2 = W2 + learning_rate*grad_W2;
    W1 = W1 + learning_rate*grad_W1;
    
    % Calculo do erro quadratico medio (MSE)
    mse = mean(error.^2);
    
    % Exibicao do progresso
    if mod(epoch,100) == 0
        disp(['Época ' num2str(epoch) ', MSE: ' num2str(mse)]);
    end
end

% Teste da rede treinada
H_test = tanh(X*W1);
Y_pred_test = H_test*W2;
error_test = Y - Y_pred_test;
mse_test = mean(error_test.^2);
disp(['MSE no teste: ' num2str(mse_test)]);
