close all;clc;
%load all data
heartY1=load('Y1.txt');
heartY2=load('Y2.txt');
heartY3=load('Y3.txt');
heartY4=load('Y4.txt');
heartY5=load('Y5.txt');
heartO1=load('O1.txt');
heartO2=load('O2.txt');
heartO3=load('O3.txt');
heartO4=load('O4.txt');
heartO5=load('O5.txt');

%get lengths for the data loaded
reclen_O1 = length(heartO1);
reclen_O2 = length(heartO2);
reclen_O3 = length(heartO3);
reclen_O4 = length(heartO4);
reclen_O5 = length(heartO5);
reclen_Y1 = length(heartY1);
reclen_Y2 = length(heartY2);
reclen_Y3 = length(heartY3);
reclen_Y4 = length(heartY4);
reclen_Y5 = length(heartY5);

heart_dataY=[heartY1;heartY2;heartY3;heartY4;heartY5; ...
             heartO1;heartO2;heartO3;heartO4;heartO5];
xlabel=[repmat({'Y1'},1,reclen_Y1)';repmat({'Y2'},1,reclen_Y2)';repmat({'Y3'},1,reclen_Y3)';repmat({'Y4'},1,reclen_Y4)';repmat({'Y5'},1,reclen_Y5)';...
         repmat({'O1'},1,reclen_O1)';repmat({'O2'},1,reclen_O2)';repmat({'O3'},1,reclen_O3)';repmat({'O4'},1,reclen_O4)';repmat({'O5'},1,reclen_O5)'];
%(a)boxplots for orignial data
figure(1)
boxplot(heart_dataY,xlabel,'orientation','horizontal')



%(b)(c)boxplots for normalised data
heart_norm=@(x)(x-median(x))/iqr(x); %subtract mean and divided by IQR
heartY1_n=heart_norm(heartY1);
heartY2_n=heart_norm(heartY2);
heartY3_n=heart_norm(heartY3);
heartY4_n=heart_norm(heartY4);
heartY5_n=heart_norm(heartY5);
heartO1_n=heart_norm(heartO1);
heartO2_n=heart_norm(heartO2);
heartO3_n=heart_norm(heartO3);
heartO4_n=heart_norm(heartO4);
heartO5_n=heart_norm(heartO5);

heart_dataY_n=[heartY1_n;heartY2_n;heartY3_n;heartY4_n;heartY5_n; ...
             heartO1_n;heartO2_n;heartO3_n;heartO4_n;heartO5_n];
xlabel=[repmat({'Y1'},1,reclen_Y1)';repmat({'Y2'},1,reclen_Y2)';repmat({'Y3'},1,reclen_Y3)';repmat({'Y4'},1,reclen_Y4)';repmat({'Y5'},1,reclen_Y5)';...
         repmat({'O1'},1,reclen_O1)';repmat({'O2'},1,reclen_O2)';repmat({'O3'},1,reclen_O3)';repmat({'O4'},1,reclen_O4)';repmat({'O5'},1,reclen_O5)'];
%(a)boxplots for orignial data
figure(2)
boxplot(heart_dataY_n,xlabel,'orientation','horizontal')