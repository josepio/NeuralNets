clear all
% Definir entradas e saídas esperadas
entrada = [0 0; 0 1; 1 0; 1 1];
saida_esperada = [0; 0; 0; 1];

% Definir parâmetros iniciais
pesos = rand(1,2);
vies = rand();
taxa_aprendizagem = 0.001;

% Iniciar loop de treinamento
erro = 1;
epocas = 0;
while erro ~= 0 && epocas < 1000
    % Inicializar o erro para cada época
    erro = 0;
    
    % Percorrer todas as entradas e atualizar os pesos
    for i = 1:size(entrada,1)
        % Calcular a saída do Perceptron
        soma = dot(entrada(i,:),pesos) + vies;
        if soma >= 0
            saida = 1;
        else
            saida = 0;
        end
        
        % Atualizar os pesos e o viés
        erro_local = saida_esperada(i) - saida;
        pesos = pesos + taxa_aprendizagem * erro_local * entrada(i,:);
        vies = vies + taxa_aprendizagem * erro_local;
        
        % Atualizar o erro da época
        erro = erro + abs(erro_local);
    end
    
    % Incrementar o número de épocas
    epocas = epocas + 1;
    % Adicionar o erro da época ao vetor
    erros_por_epoca(epocas) = erro;
end

% Testar o Perceptron treinado
for i = 1:size(entrada,1)
    soma = dot(entrada(i,:),pesos) + vies;
    if soma >= 0
        saida = 1;
    else
        saida = 0;
    end
    fprintf('Entrada: %d %d, Saída esperada: %d, Saída obtida: %d\n', ...
        entrada(i,1), entrada(i,2), saida_esperada(i), saida);
end

% Plotar o gráfico do erro por época
plot(erros_por_epoca)
xlabel('Épocas')
ylabel('Erro')
title('Decaimento do erro durante o treinamento do Perceptron para o problema do AND lógico')