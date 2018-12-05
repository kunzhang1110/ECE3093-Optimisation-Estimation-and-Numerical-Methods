function heartbeat5Y()
%ECE3093 Assignment 2 2011, Q3
%Tool for comparing at all five young, Y1,Y2,Y3,Y4,Y5 EEG records
heartY1=load('Y1.txt');
heartY2=load('Y2.txt');
heartY3=load('Y3.txt');
heartY4=load('Y4.txt');
heartY5=load('Y5.txt');
reclen_Y1 = length(heartY1);
reclen_Y2 = length(heartY2);
reclen_Y3 = length(heartY3);
reclen_Y4 = length(heartY4);
reclen_Y5 = length(heartY5);

%timeseries
newplot
x=[0:reclen_Y1-1];
plot(x,heartY1,'k.');
title(['Timeseries - Y1.txt Fantasia heartbeat data'])
xlabel('heartbeat')
ylabel('inter-beat period')
axis([0 reclen_Y1 0.5 1.8])
pause

%timeseries
newplot
x=[0:reclen_Y2-1];
plot(x,heartY2,'k.');
title(['Timeseries - Y2.txt Fantasia heartbeat data'])
xlabel('heartbeat')
ylabel('inter-beat period')
axis([0 reclen_Y2 0.5 1.8])
pause

%timeseries
newplot
x=[0:reclen_Y3-1];
plot(x,heartY3,'k.');
title(['Timeseries - Y3.txt Fantasia heartbeat data'])
xlabel('heartbeat')
ylabel('inter-beat period')
axis([0 reclen_Y3 0.5 1.8])
pause

%timeseries
newplot
x=[0:reclen_Y4-1];
plot(x,heartY4,'k.');
title(['Timeseries - Y4.txt Fantasia heartbeat data'])
xlabel('heartbeat')
ylabel('inter-beat period')
axis([0 reclen_Y4 0.5 1.8])
pause

%timeseries
newplot
x=[0:reclen_Y5-1];
plot(x,heartY5,'k.');
title(['Timeseries - Y5 Fantasia heartbeat data'])
xlabel('heartbeat')
ylabel('inter-beat period')
axis([0 reclen_Y5 0.5 1.8])
pause

%Construct a Poincare plot.
y=heartY1(2:reclen_Y1);
x=heartY1(1:reclen_Y1-1);
plot(x,y,'k.');
axis([0.5 1.8 0.5 1.8])
title(['Poincare plot - Y1 Fantasia heartbeat data'])
xlabel('inter-beat period')
ylabel('next inter-beat period')
pause

y=heartY2(2:reclen_Y2);
x=heartY2(1:reclen_Y2-1);
plot(x,y,'k.');
axis([0.5 1.8 0.5 1.8])
title(['Poincare plot - Y2 Fantasia heartbeat data'])
xlabel('inter-beat period')
ylabel('next inter-beat period')
pause

y=heartY3(2:reclen_Y3);
x=heartY3(1:reclen_Y3-1);
plot(x,y,'k.');
axis([0.5 1.8 0.5 1.8])
title(['Poincare plot - Y3 Fantasia heartbeat data'])
xlabel('inter-beat period')
ylabel('next inter-beat period')
pause

y=heartY4(2:reclen_Y4);
x=heartY4(1:reclen_Y4-1);
plot(x,y,'k.');
axis([0.5 1.8 0.5 1.8])
title(['Poincare plot - Y4 Fantasia heartbeat data'])
xlabel('inter-beat period')
ylabel('next inter-beat period')
pause

y=heartY5(2:reclen_Y5);
x=heartY5(1:reclen_Y5-1);
plot(x,y,'k.');
axis([0.5 1.8 0.5 1.8])
title(['Poincare plot - Y5 Fantasia heartbeat data'])
xlabel('inter-beat period')
ylabel('next inter-beat period')
pause

bins=[0.5:0.02:1.8];

newplot
y=hist(heartY1,bins);
plot(bins,y,'k.');
title(['Histogram - Y1.txt Fantasia heartbeat data'])
xlabel('interbeat interval')
ylabel('ibin frequency')
mh(1)=mean(heartY1);
mdh(1)=median(heartY1);
varh(1)=var(heartY1);
stdh(1)=std(heartY1);
pause

newplot
y=hist(heartY2,bins);
plot(bins,y,'k.');
title(['Histogram - Y2.txt Fantasia heartbeat data'])
xlabel('interbeat interval')
ylabel('ibin frequency')
mh(2)=mean(heartY2);
mdh(2)=median(heartY2);
varh(2)=var(heartY2);
stdh(2)=std(heartY2);
pause

newplot
y=hist(heartY3,bins);
plot(bins,y,'k.');
title(['Histogram - Y3.txt Fantasia heartbeat data'])
xlabel('interbeat interval')
ylabel('ibin frequency')
mh(3)=mean(heartY3);
mdh(3)=median(heartY3);
varh(3)=var(heartY3);
stdh(3)=std(heartY3);
pause

newplot
y=hist(heartY4,bins);
plot(bins,y,'k.');
title(['Histogram - Y4.txt Fantasia heartbeat data'])
xlabel('interbeat interval')
ylabel('ibin frequency')
mh(4)=mean(heartY4);
mdh(4)=median(heartY4);
varh(4)=var(heartY4);
stdh(4)=std(heartY4);
pause

newplot
y=hist(heartY5,bins);
plot(bins,y,'k.');
title(['Histogram - Y5.txt Fantasia heartbeat data'])
xlabel('interbeat interval')
ylabel('ibin frequency')
mh(5)=mean(heartY5);
mdh(5)=median(heartY5);
varh(5)=var(heartY5);
stdh(5)=std(heartY5);
pause

return