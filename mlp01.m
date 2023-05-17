%https://www.philadelphia.edu.jo/academics/qhamarsheh/uploads/FFMLP_FF_1_Input.m
clear all ; clc; close all;
%Obtain the data:
x = 0:.05:2; y=humps(x);
P=x; T=y;
%Plot the data
% plot (P, T, 'x')
grid; xlabel('time (s)'); ylabel('output'); title('humps function')
%DESIGN THE NETWORK
%Bad solutions
% net = newff([0 2], [5,1], {'tansig','purelin'},'traingd');
% net = newff([0 2], [20,1], {'tansig','purelin'},'traingd');
%Good solution
% net = newff([0 2], [10,1], {'tansig','purelin'},'trainlm');
net = newff([0 2], [1000,1], {'tansig','purelin'},'trainlm');
% The first argument [0 2] defines the range of the input and initializes the network.
% The second argument the structure of the network. There are two layers.
% 5 is the number of the nodes in the first hidden layer,
% 1 is the number of nodes in the output layer,
% Next the activation functions in the layers are defined.
% In the first hidden layer there are 5 tansig functions.
% In the output layer there is 1 linear function.
% ‘traingd’ defines the basic teaching scheme – gradient method
% Define learning parameters
net.trainParam.show = 50; % The result is shown at every 50th iteration (epoch)
net.trainParam.lr = 0.05; % Learning rate used in some gradient schemes
net.trainParam.epochs =1000; % Max number of iterations
net.trainParam.goal = 1e-3; % Error tolerance; stopping criterion
%Train network
net1 = train(net, P, T); % Iterates gradient type of loop
% Resulting network is strored in net1
%Convergenceurve c is shown below.
% Simulate how good a result is achieved: Input is the same input vector P.
% Output is the output of the neural network, which should be compared with output data
a= sim(net1,P);
% Plot result and compare
% plot(P,a-T, P,T); grid;
%Try simulating with independent data.
x1=0:0.01:2; P1=x1;y1=humps(x1); T1=y1;
a1= sim (net1, P1);
plot (P1,a1, 'r', P1,T1, 'g', P,T, 'b', P1, T1-a1, 'y');
legend ('New Data using MLP','New Data using function' ...
         ,'old Data using function','Error');

