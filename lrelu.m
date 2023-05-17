%plota LReLu
t=-3:0.001:3;
n=size(t,2);
alfa=0.2;
for i=1:n
    if t(i)<=alfa*t(i)
        llu(i)=alfa*t(i);
    else
        llu(i)=t(i);
    end
end

%derivada
for i=1:n
    if t(i)>=0
        dll(i)=1;
    else
        dll(i)=alfa;
    end
end

plot(t,llu,t,dll,'--','LineWidth',3);
grid on
axis([-2.5 2.5 -0.5  1.5]);
title ('Função LReLu')
xlabel ('u');
ylabel ('LReLu(u)');