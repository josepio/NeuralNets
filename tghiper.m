%plota tangente hiperbólica
t=-5:0.001:5;
%y=1./(1+exp(-B.*(t-C));
tgh=tanh(t);
dtg=1-(tgh.*tgh);
plot(t,tgh,t,dtg,'--','LineWidth',3);
grid on
axis([-5 5 -1.1  1.1]);
title ('Função Tangente Hiperbólica')
xlabel ('u');
ylabel ('tgh(u)')