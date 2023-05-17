% Funcao degrau
% u: resultado da funcao de agregacao
function y =relu(u)
if u <= 0
    y = 0;
else
    y = u;
end