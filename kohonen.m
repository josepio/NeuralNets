% Define o tamanho do grid bidimensional
nrows = 20;
ncols = 20;

% Define o numero de neuronios na camada de saida da rede
n_neurons = 100;

% Define a taxa de aprendizagem e o tamanho inicial do raio de vizinhanca
learn_rate = 0.1;
radius = 3;

% Inicializa os pesos da rede de forma aleatoria
weights = rand(2, n_neurons);

% Cria uma matriz de vertices aleatorios para o grid bidimensional
vertices = rand(nrows*ncols, 2);

% Cria uma figura para visualizar o grid antes e depois do treinamento da rede
figure;
subplot(1,2,1);
scatter(vertices(:,1), vertices(:,2));
title('Grid antes do treinamento');

% Treina a rede de Kohonen
for i = 1:5000 % numero de iteracoes
    % Seleciona um vertice aleatorio do grid
    sample = vertices(randi(size(vertices,1)), :);
    
    % Calcula as distancias entre o vertice e os neuronios
    distances = pdist2(sample, weights');
    
    % Encontra o neuronio mais proximo ao vertice
    [min_dist, winner_neuron] = min(distances);
    
    % Atualiza os pesos dos neuronios proximos ao neuronio vencedor
    for j = 1:n_neurons
        if pdist([weights(:, winner_neuron)'; weights(:, j)']) <= radius
            weights(:, j) = weights(:, j) + learn_rate * (sample' - weights(:, j));
        end
    end
    
    % Decrementa o tamanho do raio de vizinhanca e a taxa de aprendizagem ao longo do tempo
    radius = radius * exp(-i/5000);
    learn_rate = learn_rate * exp(-i/5000);
end

% Reorganiza os vertices do grid usando os neuronios da camada de saida
new_vertices = zeros(nrows*ncols, 2);
for i = 1:nrows
    for j = 1:ncols
        index = (i-1)*ncols + j;
        distances = pdist2(vertices(index,:), weights');
        [~, winner_neuron] = min(distances);
        new_vertices(index,:) = weights(:,winner_neuron)';
    end
end

% Plota o grid reorganizado depois do treinamento da rede
subplot(1,2,2);
scatter(new_vertices(:,1), new_vertices(:,2));
title('Grid depois do treinamento');