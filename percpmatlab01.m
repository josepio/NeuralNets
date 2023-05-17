%Perceptron in matlab
%https://www.philadelphia.edu.jo/academics/qhamarsheh/uploads/AND_Gate.m
clear all ; clc; close all;
P = [0 0 1 1; 0 1 0 1]; % training inputs, p = [p1; p2]
T = [0 0 0 1]; % targets
net = newp ([0 1; 0 1], 1);
net = train (net, P, T);
a = sim (net, P);