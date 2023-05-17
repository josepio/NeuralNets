%https://www.philadelphia.edu.jo/academics/qhamarsheh/uploads/SOM2.m
% Clustering Problem using a Self-Organizing Map
%   iris_dataset.
clear all; clc;
load iris_dataset;
x = irisInputs;
% Create a Self-Organizing Map
dim1 = 10;
dim2 = 10;
net = selforgmap([dim1 dim2],300,2,'randtop','dist');
% Train the Network
[net,tr] = train(net,x);
% Test the Network
y = net(x);
% View the Network
view(net)
% Different Plots
figure, plotsomtop(net)
figure, plotsomnc(net)
figure, plotsomnd(net)
figure, plotsomplanes(net)
figure, plotsomhits(net,x)
figure, plotsompos(net,x)
