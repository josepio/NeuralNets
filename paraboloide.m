%paraboloide (mudar o sinal)

vet_x = -2 : 0.1 : 2 ; 
vet_y = -2 : 0.1 : 2 ; 
[ matriz_x , matriz_y ] = meshgrid( vet_x , vet_y ) ; 
matriz_z = matriz_x .^2 - matriz_y .^2 ; 
surf( matriz_x , matriz_y , matriz_z ) ; 