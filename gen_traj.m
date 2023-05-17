% FEEC/Unicamp
% Generate the graphical solution for TSP
%
function [] = gen_traj(cities,seq_cities,nfig)
n_cities1 = length(cities(:,1));
n_cities2 = length(seq_cities);
L = sprintf('%c','A':'Z');
figure(nfig);
for i=1:n_cities1,
    plot(cities(i,1),cities(i,2),'ko');hold on;
    text(cities(i,1)+cities(i,3),cities(i,2)+cities(i,4),L(i));
    if i < n_cities2,
        plot([cities(seq_cities(i),1);cities(seq_cities(i+1),1)],[cities(seq_cities(i),2);cities(seq_cities(i+1),2)]);
    elseif i == n_cities2,
    plot([cities(seq_cities(i),1);cities(seq_cities(1),1)],[cities(seq_cities(i),2);cities(seq_cities(1),2)]);
    end
end
axis([0 1 0 1]);
hold off;
tot_dist = 0;
for i=1:n_cities2,
    if i < n_cities2,
        tot_dist = tot_dist + sqrt((cities(seq_cities(i),1)-cities(seq_cities(i+1),1))^2+(cities(seq_cities(i),2)-cities(seq_cities(i+1),2))^2);
    else
    tot_dist = tot_dist + sqrt((cities(seq_cities(i),1)-cities(seq_cities(1),1))^2+(cities(seq_cities(i),2)-cities(seq_cities(1),2))^2);
    end
end
title(sprintf('Total distance = %g',tot_dist));