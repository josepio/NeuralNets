%https://www.philadelphia.edu.jo/academics/qhamarsheh/uploads/Associative_Example_7.m
%Hopfield neural networks using Matlab Neural Network ToolBox.
clc;
clear;
T = [-1 -1 1; 1 -1 1]';
net = newhop (T);
Ai = T;
[Y, Pf, Af] = sim (net, 2, [ ], Ai);
disp('Y');
disp(Y);
Ai = {[-0.9; -0.8; 0.7]};
[Y, Pf, Af] = sim (net,{1 5},{},Ai);
disp('Y{1}');
disp(Y{1});

