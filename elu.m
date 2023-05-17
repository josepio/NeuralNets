%plota LReLu
t=-3:0.001:3;
n=size(t,2);
alfa=0.2;
for i=1:n
    if t(i)>= 0
        elu(i)=t(i);
    else
        elu(i)=alfa*(exp(t(i)-1));
    end
end


plot(t,elu,t,dll,'--','LineWidth',3);
grid on
axis([-2.5 2.5 -0.5  1.5]);
title ('Função ELu')
xlabel ('u');
ylabel ('LReLu(u)');