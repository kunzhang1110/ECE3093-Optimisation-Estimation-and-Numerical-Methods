function reclen_O1=heartbeat5O_2013()
%ECE3093 Assignment 2 PartA 2013 Q1
%Tool for comparing at all five old, O1,O2,O3,O4,O5 EEG records
%The m-file and data file have to be in the same directory
%
%Load the datasets from the m-file's directory
heartO1=load('O1.txt');
heartO2=load('O2.txt');
heartO3=load('O3.txt');
heartO4=load('O4.txt');
heartO5=load('O5.txt');

%Record length of each dataset
reclen_O1 = length(heartO1);
reclen_O2 = length(heartO2);
reclen_O3 = length(heartO3);
reclen_O4 = length(heartO4);
reclen_O5 = length(heartO5);

%The elapsed time = sum of the heartbeat intervals.
timeO1=cumsum(heartO1);
timeO2=cumsum(heartO2);
timeO3=cumsum(heartO3);
timeO4=cumsum(heartO4);
timeO5=cumsum(heartO5);

%Plot the time series of each dataset
newplot
plot(timeO1,heartO1,'k.');
title(['Timeseries - O1 Fantasia heartbeat data'])
xlabel('time(seconds)')
ylabel('inter-beat period')
axis([0 timeO1(reclen_O1) 0.5 1.8])
pause

newplot
plot(timeO2,heartO2,'k.');
title(['Timeseries - O2 Fantasia heartbeat data'])
xlabel('time(seconds)')
ylabel('inter-beat period')
axis([0 timeO2(reclen_O2) 0.5 1.8])
pause

newplot
plot(timeO3,heartO3,'k.');
title(['Timeseries - O3 Fantasia heartbeat data'])
xlabel('time(seconds)')
ylabel('inter-beat period')
axis([0 timeO3(reclen_O3) 0.5 1.8])
pause

newplot
plot(timeO4,heartO4,'k.');
title(['Timeseries - O4.txt Fantasia heartbeat data'])
xlabel('time(seconds)')
ylabel('inter-beat period')
axis([0 timeO4(reclen_O4) 0.5 1.8])
pause

newplot
plot(timeO5,heartO5,'k.');
title(['Timeseries - O5 Fantasia heartbeat data'])
xlabel('time(seconds)')
ylabel('inter-beat period')
axis([0 timeO5(reclen_O5) 0.5 1.8])
pause

%Construct a Poincare plot for each dataset
y=heartO1(2:reclen_O1);
x=heartO1(1:reclen_O1-1);
plot(x,y,'k.');
axis([0.5 1.8 0.5 1.8])
title(['Poincare plot - O1 Fantasia heartbeat data'])
xlabel('inter-beat period')
ylabel('next inter-beat period')
pause

y=heartO2(2:reclen_O2);
x=heartO2(1:reclen_O2-1);
plot(x,y,'k.');
axis([0.5 1.8 0.5 1.8])
title(['Poincare plot - O2 Fantasia heartbeat data'])
xlabel('inter-beat period')
ylabel('next inter-beat period')
pause

y=heartO3(2:reclen_O3);
x=heartO3(1:reclen_O3-1);
plot(x,y,'k.');
axis([0.5 1.8 0.5 1.8])
title(['Poincare plot - O3 Fantasia heartbeat data'])
xlabel('inter-beat period')
ylabel('next inter-beat period')
pause

y=heartO4(2:reclen_O4);
x=heartO4(1:reclen_O4-1);
plot(x,y,'k.');
axis([0.5 1.8 0.5 1.8])
title(['Poincare plot - O4 Fantasia heartbeat data'])
xlabel('inter-beat period')
ylabel('next inter-beat period')
pause

y=heartO5(2:reclen_O5);
x=heartO5(1:reclen_O5-1);
plot(x,y,'k.');
axis([0.5 1.8 0.5 1.8])
title(['Poincare plot - O5 Fantasia heartbeat data'])
xlabel('inter-beat period')
ylabel('next inter-beat period')
pause

bins=[0.5:0.02:1.8];

newplot
y=hist(heartO1,bins);
plot(bins,y,'k.');
title(['Histogram - O1.txt Fantasia heartbeat data'])
xlabel('interbeat interval')
ylabel('ibin frequency')
mh(1)=mean(heartO1);
mdh(1)=median(heartO1);
varh(1)=var(heartO1);
stdh(1)=std(heartO1);
pause

newplot
y=hist(heartO2,bins);
plot(bins,y,'k.');
title(['Histogram - O2.txt Fantasia heartbeat data'])
xlabel('interbeat interval')
ylabel('ibin frequency')
mh(2)=mean(heartO2);
mdh(2)=median(heartO2);
varh(2)=var(heartO2);
stdh(2)=std(heartO2);
pause

newplot
y=hist(heartO3,bins);
plot(bins,y,'k.');
title(['Histogram - O3.txt Fantasia heartbeat data'])
xlabel('interbeat interval')
ylabel('ibin frequency')
mh(3)=mean(heartO3);
mdh(3)=median(heartO3);
varh(3)=var(heartO3);
stdh(3)=std(heartO3);
pause

newplot
y=hist(heartO4,bins);
plot(bins,y,'k.');
title(['Histogram - O4.txt Fantasia heartbeat data'])
xlabel('interbeat interval')
ylabel('ibin frequency')
mh(4)=mean(heartO4);
mdh(4)=median(heartO4);
varh(4)=var(heartO4);
stdh(4)=std(heartO4);
pause

newplot
y=hist(heartO5,bins);
plot(bins,y,'k.');
title(['Histogram - O5.txt Fantasia heartbeat data'])
xlabel('interbeat interval')
ylabel('ibin frequency')
mh(5)=mean(heartO5);
mdh(5)=median(heartO5);
varh(5)=var(heartO5);
stdh(5)=std(heartO5);

return