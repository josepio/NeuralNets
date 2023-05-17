% Clustering Problem using a Self-Organizing Map
load simplecluster_dataset;
x = simpleclusterInputs;
% Create a Self-Organizing Map
dim1 = 10;
dim2 = 10;
net = selforgmap([dim1 dim2]);
% Train the Network
[net,tr] = train(net,x);
% Test the Network
y = net(x);
% View the Network
view(net)
% Plots
figure, plotsomtop(net)
figure, plotsomnc(net)
figure, plotsomnd(net)
figure, plotsomplanes(net)
figure, plotsomhits(net,x)
figure, plotsompos(net,x)
