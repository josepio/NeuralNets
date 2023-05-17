%Definindo os parâmetros da RBF
num_rbfs = 10;
sigma = 1.0;
centers = rand(num_rbfs, input_size);

%Calculando as saídas das funções de base radial
rbf_outputs = zeros(num_rbfs, num_samples);
for i = 1:num_samples
    for j = 1:num_rbfs
        rbf_outputs(j,i) = exp(-norm(inputs(:,i)-centers(j,:)')^2/sigma^2);
    end
end

% Calculando os pesos da camada de saída
W = desired_output*rbf_outputs'/(rbf_outputs*rbf_outputs');

% Testando a rede
test_outputs = W*rbf_outputs_test;
\end{lstlisting}

Aqui está um exemplo de código MATLAB para implementar uma RBF para resolver o problema do XOR:

\begin{lstlisting}
% Criando os dados de entrada e saída
X = [-1 -1 1 1; -1 1 -1 1];
Y = [-1 1 1 -1];

% Definindo os parâmetros da RBF
num_rbfs = 4;
sigma = 1.0;
centers = [-1 -1; -1 1; 1 -1; 1 1];

% Calculando as saídas das funções de base radial
rbf_outputs = zeros(num_rbfs, size(X,2));
for i = 1:size(X,2)
    for j = 1:num_rbfs
        rbf_outputs(j,i) = exp(-norm(X(:,i)-centers(j,:)')^2/sigma^2);
    end
end

% Calculando os pesos da camada de saída
W = Y*rbf_outputs'/(rbf_outputs*rbf_outputs');

% Testando a rede
test_inputs = [-1 -1; -1 1; 1 -1; 1 1]';
test_outputs = W*exp(-(pdist2(test_inputs, centers)/sigma).^2)';

% Exibindo os resultados
disp('Entradas:');
disp(test_inputs);
disp('Saídas:');
disp(test_outputs);