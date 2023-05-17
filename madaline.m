clear all;
% Dados de entrada
X = [1 1; 1 -1; -1 1; -1 -1];
D = [1; -1; -1; -1];

% Inicialização dos pesos
W = rand(1, 2);

% Taxa de aprendizagem
alpha = 0.1;

% Número máximo de iterações
max_epochs = 1000;

% Treinamento
for epoch = 1:max_epochs
    % Para cada entrada de treinamento
    for i = 1:size(X, 1)
        % Saída da rede
        Y = W * X(i,:)';

        % Erro
        E = D(i) - Y;

        % Atualização dos pesos
        W = W + alpha * E * X(i,:);
    end
    % Calculo do erro medio da epoca
    Y1=W*X';
    E=D'-Y1;
    erros(epoch)=mean(E.^2);
end

% Teste
for i = 1:size(X, 1)
    Y = W * X(i,:)';
    disp(['Entrada: ', num2str(X(i,:)), ' Saída: ', num2str(Y)]);
end

% Plotagem do gráfico de decaimento do erro
plot(1:max_epochs, erros);
title('Decaimento do erro');
xlabel('Número de épocas');
ylabel('Erro médio');
