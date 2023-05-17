%https://www.philadelphia.edu.jo/academics/qhamarsheh/uploads/Associative_Example_4.m
%The MATLAB program for calculating the weight matrix is as follows
%Discrete Hopfield net
clc;
clear;
x=[1 1 1 0];
w=(2*x'-1)*(2*x-1);
for i=1:4
    w(i,i)=0;
end
disp('Weight matrix');
disp(w);