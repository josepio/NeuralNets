%Auto-associative Memories (continuous)
clc;
clear;
x1=[-0.3; 0.9; -0.2];
x2=[0.44; -0.7; 0.9];
x3=[0.9; 0.6; 0.8];
Total_M = x1*x1' + x2*x2' + x3*x3';
estimate_x1= Total_M *x1;
estimate_x2= Total_M *x2;
estimate_x3= Total_M *x3;
%Estimates are not perfect because of non-orthogonality of the vectors
%Euclidean distance between x1 and other key vectors
d11 = norm(x1-estimate_x1);
d21 = norm(x2-estimate_x1);
d31 = norm(x3-estimate_x1);
% As expected the response vector estimate_x1 is closest to x1
%Euclidean distance between x2 and other key vectors
d12 = norm(x1-estimate_x2);
d22 = norm(x2-estimate_x2);
d32 = norm(x3-estimate_x2);
%As expected the response vector estimate_x2 is closest to x2
%Euclidean distance between x3 and other key vectors
d13 = norm(x1-estimate_x3);
d23 = norm(x2-estimate_x3);
d33 = norm(x3-estimate_x3);
%As expected the response vector estimate_x3 is closest to x3