function [u]=h(x,delta)
n=size(x,2);
for i=1:n
    if x(i) >= delta
        u(i) = 1;
    else
        %u(i) = 0;
        u(i) = -1; %bipolar
    end
end