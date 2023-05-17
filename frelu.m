%plota ReLu
t=-3:0.001:3;
n=size(t,2);
for i=1:n
    if t(i)<=0
        rlu(i)=0;
    else
        rlu(i)=t(i);
    end
end
%derivada
for i=1:n
    if t(i)>=0
        dlu(i)=1;
    else
        dlu(i)=0;
    end
end

plot(t,rlu,t,dlu,'--','LineWidth',3);
grid on
axis([-2.5 2.5 -0.5  1.5]);
title ('Função ReLu')
xlabel ('u');
ylabel ('ReLu(u)');