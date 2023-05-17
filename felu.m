%plota LReLu
clear all
t=-4:0.001:4;
n=size(t,2);
alfa=1;
for i=1:n
    if t(i)>= 0
        elu(i)=t(i);
    else
        elu(i)=alfa*(exp(t(i))-1);
    end
end

%derivada
for i=1:n
    if t(i)>=0
        delu(i)=1;
    else
        delu(i)=elu(i)+alfa;
    end
end

plot(t,elu,t,delu,'--','LineWidth',3);
grid on
axis([-4 3 -2 3]);
title ('Função ELu')
xlabel ('u');
ylabel ('LReLu(u)');