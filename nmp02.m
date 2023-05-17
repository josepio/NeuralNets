clear all
x1=[1 1 0 0];
x2=[1 0 1 0];
% pesos neuronio 1
y1=1;
y2=-1;
% pesos neuronio 2
v1=-1
v2=1;
% pesos neuronio 3
w1=1;
w2=1;
% limiar
t=1;
for i=1:4
    n=(x1(i)*y1)+(x2(i)*y2);
    if(n>=t)
        z1(i)=1;
    else
        z1(i)=0;
    end
end
for i=1:4
    n=(x1(i)*v1)+(x2(i)*v2);
    if(n>=t)
        z2(i)=1;
    else
        z2(i)=0;
    end
end
for i=1:4
    n=(z1(i)*w1)+(z2(i)*w2);
    if(n>=t)
        Y(i)=1;
    else
        Y(i)=0;
    end
end
[x1' x2' Y']