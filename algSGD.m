% Exemplo de treinamento de uma MLP com SGD

% Definição dos dados de entrada e saída
X = [0 0; 0 1; 1 0; 1 1];
Y = [0; 1; 1; 0];

% Parâmetros da rede
n_input = size(X,2); % número de entradas
n_hidden = 5; % número de neurônios na camada oculta
n_output = 1; % número de saídas
learning_rate = 0.1; % taxa de aprendizado
n_epochs = 10000; % número de épocas de treinamento
batch_size = 2; % tamanho do batch

% Inicialização dos pesos da rede
W1 = randn(n_input,n_hidden); % pesos da camada de entrada para oculta
W2 = randn(n_hidden,n_output); % pesos da camada oculta para saída

% Loop de treinamento
for epoch = 1:n_epochs
    % Embaralha os dados
    idx = randperm(size(X,1));
    X = X(idx,:);
    Y = Y(idx,:);
    
    % Loop do SGD
    for batch = 1:size(X,1)/batch_size
        % Seleciona o batch
        X_batch = X((batch-1)*batch_size+1:batch*batch_size,:);
        Y_batch = Y((batch-1)*batch_size+1:batch*batch_size,:);
        
        % Forward pass
        H = X_batch*W1; % saída da camada oculta
        H = tanh(H); % aplicação da função de ativação (tangente hiperbólica)
        Y_pred = H*W2; % saída da rede
        error = Y_batch - Y_pred; % cálculo do erro
        
        % Backward pass
        grad_W2 = H.'*error; % gradiente em relação aos pesos da camada oculta para saída
        delta_output = error*W2.'.*sech(H).^2; % cálculo do delta para a camada de saída
        grad_W1 = X_batch.'*delta_output; % gradiente em relação aos pesos da camada de entrada para oculta
        
        % Atualização dos pesos
        W2 = W2 + learning_rate*grad_W2;
        W1 = W1 + learning_rate*grad_W1;
    end
    
    % Cálculo do erro quadrático médio (MSE)
    H = X*W1; % saída da camada oculta
    H = tanh(H); % aplicação da função de ativação (tangente hiperbólica)
    Y_pred = H*W2; % saída da rede
    error = Y - Y_pred; % cálculo do erro
    mse = mean(error.^2);
    
    % Exibição do progresso
    if mod(epoch,100) == 0
        disp(['Época ' num2str(epoch) ', MSE: ' num2str(mse)]);
    end
end

% Teste da rede treinada
H_test = tanh(X*W1);
Y_pred_test = H_test*W2;
error_test = Y - Y_pred_test;
 Y_pred
mse_test
