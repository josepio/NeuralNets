% Hopfield neural network for TSP – Matlab code 
clear all; 
close all; 
% Coordinates of the cities plus displacements of the labels 
displace1 = 0.05; 
displace2 = 0.03; 
cities = [      0.2439 0.1463 0 -displace1     
                0.8488 0.3609 displace2 0     
                0.6683 0.2536 displace2 -displace1     
                0.6878 0.5219 displace2 0     
                0.1707 0.2293 -displace1 0     
                0.2293 0.7610 -displace1 0     
                0.4000 0.4439 -displace1 0     
                0.8732 0.6536 displace2 0     
                0.5171 0.9414 displace2 0     
                0.6195 0.2634 -displace1 -displace1]; 
n_cities = length(cities(:,1));
delta = 0.0001;
A = 500;
B = 500;
C = 1000;
D = 500;
u0 = 0.02;
for i=1:n_cities
    for j=1:n_cities
        d(i,j) = sqrt((cities(i,1)-cities(j,1))^2+(cities(i,2)-cities(j,2))^2);
    end
end
fault = 1;
n_attempt = 0;
while fault == 1
    n_attempt = n_attempt + 1;
    y = rand(n_cities,n_cities);
    u = atanh(2*y-1)*u0;
for t=1:1000
    for i=1:n_cities
        for j=1:n_cities
            sum1 = 0;
        for k=1:n_cities
            if k ~= j
                sum1 = sum1 + y(i,k);
            end
        end
        sum2 = 0;
        for k=1:n_cities
            if k ~= i
                sum2 = sum2 + y(k,j);
            end
        end
        sum3 = 0;
    for k=1:n_cities
        for p=1:n_cities
            sum3 = sum3 + y(k,p);
        end
    end
    sum3 = sum3 - n_cities;
    sum4 = 0;
    for k=1:n_cities
        if j == 1
            sum4 = sum4 + d(i,k)*(y(k,j+1)+y(k,n_cities));
        elseif j == n_cities
            sum4 = sum4 + d(i,k)*(y(k,1)+y(k,j-1));
        else
            sum4 = sum4 + d(i,k)*(y(k,j+1)+y(k,j-1));
        end
    end
    du(i,j) = -u(i,j) - A*sum1 - B*sum2 - C*sum3 - D*sum4;
    end
end
u = u + delta*du;
y = 0.5.*(1+tanh(u./u0));
for i=1:n_cities
    for j=1:n_cities
        if y(i,j) < 0.3
            y(i,j) = 0;
            elseif y(i,j) > 0.7
                y(i,j) = 1;
            end
        end
    end
end
disp(sprintf('Attempt %d',n_attempt));
fault1 = n_cities;
for i=1:n_cities
    for j=1:n_cities
        fault1 = fault1 - y(i,j);
    end
end
fault2 = 0;
for i=1:n_cities
    for j=1:(n_cities-1)
        for k=(j+1):n_cities
            fault2 = fault2 + y(i,j)*y(i,k);
        end
    end
end
fault3 = 0;
    for i=1:n_cities
        for j=1:(n_cities-1)
            for k=(j+1):n_cities
                fault3 = fault3 + y(j,i)*y(k,i);
            end
        end
    end
    if fault1 == 0 && fault2 == 0 && fault3 == 0
        fault = 0;
    end
end
seq_cities = [];
for j=1:n_cities
    [val,pos] = max(y(:,j));
    seq_cities = [seq_cities;pos];
end
seq_cities'
gen_traj(cities,seq_cities,1);