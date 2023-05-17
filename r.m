% função rampa simétrica
function [u]=r(x,a)
n=size(x,2);
for i=1:n
    if x(i) > a
        u(i) = a;
    elseif x(i) < -a
         u(i) = -a ;
    else
        u(i)=x(i);
    end
end