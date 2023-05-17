function [p,d] = dhamm(x,y)
p = x~=y;
d=sum(p);
end