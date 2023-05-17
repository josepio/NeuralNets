%https://www.philadelphia.edu.jo/academics/qhamarsheh/uploads/FFMLP_FF_2_Inputs.m
clear all ; clc; close all; format compact;
%Generate data
x = -2:0.25:2; y = -2:0.25:2;
z = cos(x)'*sin(y);
%Draw the surface
mesh (x, y, z)
xlabel ('x axis'); ylabel ('y axis'); zlabel ('z axis');
title('surface z = cos(x)sin(y)');
gi=input('Strike any key ...');
%Store data in input matrix P and output vector T
P = [x; y]; T = z;
%Create and initialize the network
net=newff ([-2 2; -2 2], [25 17], {'tansig' 'purelin'},'trainlm');
%Apply Levenberg-Marquardt algorithm
%Define parameters
net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-3;
%Train network
net1 = train (net, P, T);
gi=input('Strike any key ...');
%Plot how the error develops
%Simulate the response of the neural network and draw the surface
a= sim(net1,P);
mesh (x, y, a)
% Error surface
mesh (x, y, a-z)
xlabel ('x axis'); ylabel ('y axis'); zlabel ('Error'); title ('Error surface')
gi=input('Strike any key to continue......');
% Maximum fitting error
Maxfiterror = max (max (z-a))
%Maxfiterror = 0.1116