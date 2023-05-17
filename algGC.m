%Gradiente conjulgado
% Inicialização dos pesos da rede neural
W1 = rand(10, 784);
W2 = rand(10, 10);
b1 = rand(10, 1);
b2 = rand(10, 1);

% Definir os parâmetros do algoritmo do gradiente conjugado
max_iter = 1000;
alpha = 0.01;
tolerance = 1e-5;

% Definir as amostras de treinamento
X = rand(784, 100);
y = randi([1, 10], 1, 100);

% Calcular o gradiente da função de perda em relação aos pesos
grad_W1 = zeros(size(W1));
grad_W2 = zeros(size(W2));
grad_b1 = zeros(size(b1));
grad_b2 = zeros(size(b2));

for i = 1:length(y)
    % Forward pass
    a1 = W1 * X(:, i) + b1;
    h1 = sigmoid(a1);
    a2 = W2 * h1 + b2;
    h2 = softmax(a2);
    
    % Calcular o gradiente da função de perda em relação aos pesos
    delta3 = h2;
    delta3(y(i)) = delta3(y(i)) - 1;
    grad_W2 = grad_W2 + delta3 * h1';
    delta2 = W2' * delta3 .* sigmoid_deriv(a1);
    grad_W1 = grad_W1 + delta2 * X(:, i)';
    grad_b2 = grad_b2 + delta3;
    grad_b1 = grad_b1 + delta2;
end

% Inicializar as variáveis do algoritmo
d_W1 = -grad_W1;
d_W2 = -grad_W2;
d_b1 = -grad_b1;
d_b2 = -grad_b2;
r_W1 = d_W1;
r_W2 = d_W2;
r_b1 = d_b1;
r_b2 = d_b2;
prev_loss = inf;

% Treinar a rede neural usando o algoritmo do gradiente conjugado
for iter = 1:max_iter
    % Atualizar os pesos
    W1 = W1 + alpha * d_W1;
    W2 = W2 + alpha * d_W2;
    b1 = b1 + alpha * d_b1;
    b2 = b2 + alpha * d_b2;
    
    % Calcular o gradiente da função de perda em relação aos pesos
    grad_W1_new = zeros(size(W1));
    grad_W2_new = zeros(size(W2));
    grad_b1_new = zeros(size(b1));
    grad_b2_new = zeros(size(b2));
    
    for i = 1:length(y)
        % Forward pass
        a1 = W1 * X(:, i) + b1;
        h1 = sigmoid(a1);
        a2 = W2 * h1 + b2;
        h2 = softmax(a2);

        % Calcular o gradiente da função de perda em relação aos pesos
        delta3 = h2;
        delta3(y(i)) = delta3(y(i)) - 1;
        grad_W2_new = grad_W2_new + delta3 * h1';
        delta2 = W2' * delta3        .* sigmoid_deriv(a1);
        grad_W1_new = grad_W1_new + delta2 * X(:, i)';
        grad_b2_new = grad_b2_new + delta3;
        grad_b1_new = grad_b1_new + delta2;
    end
    
    % Verificar se a perda está convergindo
    loss = compute_loss(W1, W2, b1, b2, X, y);
    if abs(prev_loss - loss) < tolerance
        break;
    end
    prev_loss = loss;
    
    % Atualizar as variáveis do algoritmo do gradiente conjugado
    beta_W1 = norm(grad_W1_new(:))^2 / norm(grad_W1(:))^2;
    beta_W2 = norm(grad_W2_new(:))^2 / norm(grad_W2(:))^2;
    beta_b1 = norm(grad_b1_new(:))^2 / norm(grad_b1(:))^2;
    beta_b2 = norm(grad_b2_new(:))^2 / norm(grad_b2(:))^2;
    d_W1 = -grad_W1_new + beta_W1 * d_W1;
    d_W2 = -grad_W2_new + beta_W2 * d_W2;
    d_b1 = -grad_b1_new + beta_b1 * d_b1;
    d_b2 = -grad_b2_new + beta_b2 * d_b2;
    r_W1 = -grad_W1_new;
    r_W2 = -grad_W2_new;
    r_b1 = -grad_b1_new;
    r_b2 = -grad_b2_new;
end

% Definir as funções de ativação
function y = sigmoid(x)
    y = 1 ./ (1 + exp(-x));
end

function y = softmax(x)
    y = exp(x) ./ sum(exp(x));
end

function y = sigmoid_deriv(x)
    y = sigmoid(x) .* (1 - sigmoid(x));
end

% Calcular a perda da rede neural
function loss = compute_loss(W1, W2, b1, b2, X, y)
    loss = 0;
    for i = 1:length(y)
        % Forward pass
        a1 = W1 * X(:, i) + b1;
        h1 = sigmoid(a1);
        a2 = W2 * h1 + b2;
        h2 = softmax(a2);
        
        % Calcular a perda da amostra i
        loss = loss - log(h2(y(i)));
    end
    loss = loss / length(y);
end

