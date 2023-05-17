%https://www.philadelphia.edu.jo/academics/qhamarsheh/uploads/Associative_Example_1.m
%Auotassociative net to store the vector
clc;
clear;
x = [1 1 -1 -1];
w=zeros (4, 4);
w=x'*x;
yin=x*w;
for i=1:4
    if yin(i)>0
        y(i)=1;
    else
        y(i) = -1;
    end
end
disp ('Weight matrix');
disp (w);
if x == y
    disp ('The vector is a Known Vector');
else
    disp ('The vector is a Unknown Vector');
end