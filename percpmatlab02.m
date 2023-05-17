%https://www.philadelphia.edu.jo/academics/qhamarsheh/uploads/Image_classification.m
clear all ; clc; close all;
image1 = [ 0 1 0 1 0 1 1 0 1 0 1 0]';%group 0
image2 = [1 0 1 0 1 0 0 1 0 1 0 1]';%group 1
image3 = [ 0 1 0 1 0 1 1 1 0 0 1 0]';%group 0
image4 = [1 0 1 0 1 0 0 1 1 1 0 0]';%group 1
%Try testing the trained perceptron on following images:
timg1 = [1 1 0 1 0 1 0 1 0 0 1 0 ]';
timg3 = [1 0 1 0 1 0 0 0 1 1 0 1]';
timg2 = [1 0 1 0 1 1 0 0 0 1 0 1]';
P = [image1 image3 image2  image4];
T = [0 0 1 1];
net = newp (minmax(P), 1);
net = train (net, P, T);
a = sim (net, P);
% Load the test images and ask the perceptron to classify it
PTest = [timg1 timg3 timg2];
testALL = sim (net, PTest) ;
test1 = sim (net, timg1) % to do similarly for other test images