%Enter three test patterns.
clc;
clear;
x1b= [0 0 1 0 1 0 0 1];
x2b= [0 0 0 0 0 1 0 0];
x3b= [0 1 1 0 0 1 0 1];
%Translate a vector from the binary format into the bipolar.
%x1= [-1 -1 1 -1 1 -1 -1 1];
%x2= [-1 -1 -1 -1 -1 1 -1 -1];
%x3=[-1 1 1 -1 -1 1 -1 1];
x1 = 2*x1b -1;
x2 = 2*x2b -1;
x3 = 2*x3b -1;
%Calculate a weight matrix.
w=x1'*x1+x2'*x2+x3'*x3-3*eye (8, 8);
%Check if the network was able to store all three patterns.
x1test=sign (w*x1');
x2test=sign (w*x2');
x3test=sign (w*x3');
%Convergence and attractors.
%Can the memory recall the stored patterns from distorted inputs
% patterns? Define a few new patters which are distorted versions of 
%the original ones:
x1db= [1 0 1 0 1 0 0 1];
x2db= [1 1 0 0 0 1 0 0];
x3db= [1 1 1 0 1 1 0 1];
%x1d has a one bit error, x2d and x3d have two bit errors.
x1d=[1 -1 1 -1 1 -1 -1 1];
x2d=[1 1 -1 -1 -1 1 -1 -1];
x3d=[1 1 1 -1 1 1 -1 1];