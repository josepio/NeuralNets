% Definir as entradas e saídas do problema do XOR
X = [0 0; 0 1; 1 0; 1 1];
y = [0; 1; 1; 0];

% Definir os centros das RBF
centers = [0 0; 0 1; 1 0; 1 1];

% Calcular as distâncias entre as entradas e os centros das RBF
distances = pdist2(X, centers);

% Definir o parâmetro de largura da RBF
sigma = 0.25;

% Calcular as ativações das RBF
activations = exp(-distances.^2 / (2*sigma^2));

% Calcular os pesos da saída da RBF
weights = pinv(activations)*y;

% Plotar a saída da RBF para cada ponto no espaço de entrada
x1 = linspace(-0.5, 1.5, 100);
x2 = linspace(-0.5, 1.5, 100);
[X1, X2] = meshgrid(x1, x2);
X12 = [X1(:) X2(:)];
distances12 = pdist2(X12, centers);
activations12 = exp(-distances12.^2 / (2*sigma^2));
y12 = activations12*weights;
Y = reshape(y12, length(x2), length(x1));
figure;
surf(x1, x2, Y);
xlabel('Entrada 1');
ylabel('Entrada 2');
zlabel('Saída');
