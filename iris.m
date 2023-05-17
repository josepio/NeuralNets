%Iris database

load fisheriris/
gscatter(meas(:,1), meas(:,2), species,'rgb','osd');
x1=meas(1:100,2);
x2=meas(1:100,2);
x3=meas(51:150,3);
gscatter(x1,x2, species(1:100),'rb','os');

