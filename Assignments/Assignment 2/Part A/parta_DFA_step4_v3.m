%--------------------------------------------------------------------------
%Assignment 2 Part A step 4
%Written by Kun Zhang, 22701478

clc;clear;close all;
%data assigned Y5, O4
heartY5=load('Y5.txt');
heartO4=load('O4.txt');

%integrated data
Y5_igt=cumsum(heartY5-mean(heartY5));
O4_igt=cumsum(heartO4-mean(heartO4));

%data length
Y5_len=length(Y5_igt);
O4_len=length(O4_igt);

%The elapsed time = sum of the heartbeat intervals
Y5_time=cumsum(heartY5);
O4_time=cumsum(heartO4);

%---------------------------------for Y5------------------------------------
%Box paramentres
n=300; %box size confined in a range or 4-300number of boxes
m=fix(Y5_len/n); %number of boxes
n_redu=mod(Y5_len,n); %redundant elements number <300

%Spliting data and time
if n_redu<4 %last box = regularbox+redundant elements
    n_last=n_redu+n; %last box size last box
    m_reg = m-1; %number of regular boxes
    Y5_split_reg=reshape(Y5_igt(1:(Y5_len-n_last)),n,m_reg);%splitted regular boxes
    Y5_split_last=Y5_igt((Y5_len-n_last+1):end);%last box
    Y5_time_reg=reshape(Y5_time(1:(Y5_len-n_last)),n,m_reg);%splitted regular boxes
    Y5_time_last=Y5_time((Y5_len-n_last+1):end);%last box
else %last box = redundant elements
    n_last=n_redu;%last box size last box
    m_reg = m; %number of regular boxes
    Y5_split_reg=reshape(Y5_igt(1:(Y5_len-n_last)),n,m_reg);%splitted regular boxes
    Y5_split_last=Y5_igt((Y5_len-n_last+1):end);%last box
    Y5_time_reg=reshape(Y5_time(1:(Y5_len-n_last)),n,m_reg);%splitted regular boxes
    Y5_time_last=Y5_time((Y5_len-n_last+1):end);%last box
end

%predefine yreg and ydet, regular regression and detrended
yreg=zeros(n,m_reg);
ydet=zeros(n,m_reg);

%linear regression for each regualr boxes
for i=1:m_reg
b=polyfit(Y5_time_reg(:,i),Y5_split_reg(:,i),1); %linear regression
yreg(:,i)=b(1)*Y5_time_reg(:,i)+b(2);   %=polyval
ydet(:,i)=transpose(Y5_split_reg(:,i)-yreg(:,i)); %find the residual
end
%linear regression for last box
b=polyfit(Y5_time_last,Y5_split_last,1); %linear regression
yreg_last=b(1)*Y5_time_last+b(2);   %m(2) is the coefficient with higher confidence
ydet_last=transpose(Y5_split_last-yreg_last); %last box detrended

%combine regular boxes and the last box
ydet_all=[reshape(ydet,1,[]),ydet_last];
yreg_all=[reshape(yreg,1,[]),transpose(yreg_last)];

figure(1)
plot(Y5_time,Y5_igt)
hold on
plot(Y5_time,ydet_all,'r')
%hold on
%plot(Y5_time,yreg_all,'k')
title(' Y5');
xlabel('time(s)');
ylabel('period(s)');
legend('Integrated','Detrended','Regession')

%-------------------------------for O4------------------------------------
%Box paramentres
n=300; %box size confined in a range or 4-300number of boxes
m=fix(O4_len/n); %number of boxes
n_redu=mod(O4_len,n); %redundant elements number <300

%spliting data and time
if n_redu<4 %if lastbox size<4, last box = regularbox+redundant elements
    n_last=n_redu+n; %last box size last box
    m_reg = m-1; %number of regular boxes
    O4_split_reg=reshape(O4_igt(1:(O4_len-n_last)),n,m_reg);%splitted regular boxes
    O4_split_last=Y5_igt((O4_len-n_last+1):end);%last box
    O4_time_reg=reshape(O4_time(1:(O4_len-n_last)),n,m_reg);%splitted regular boxes
    O4_time_last=O4_time((O4_len-n_last+1):end);%last box
else %last box = redundant elements
    n_last=n_redu;%last box size last box
    m_reg = m; %number of regular boxes
    O4_split_reg=reshape(O4_igt(1:(O4_len-n_last)),n,m_reg);%splitted regular boxes
    O4_split_last=O4_igt((O4_len-n_last+1):end);%last box
    O4_time_reg=reshape(O4_time(1:(O4_len-n_last)),n,m_reg);%splitted regular boxes
    O4_time_last=O4_time((O4_len-n_last+1):end);%last box
end

%predefine yreg and ydet, regular regression and detrended
yreg=zeros(n,m_reg);
ydet=zeros(n,m_reg);

%linear regression for each regualr boxes
for i=1:m_reg
b=polyfit(O4_time_reg(:,i),O4_split_reg(:,i),1); %linear regression
yreg(:,i)=b(1)*O4_time_reg(:,i)+b(2);   %=polyval
ydet(:,i)=transpose(O4_split_reg(:,i)-yreg(:,i)); %find the residual
end
%linear regression for last box
b=polyfit(O4_time_last,O4_split_last,1); %linear regression
yreg_last=b(1)*O4_time_last+b(2);   %m(2) is the coefficient with higher confidence
ydet_last=transpose(O4_split_last-yreg_last); %last box detrended

%combine regular boxes and the last box
ydet_all=[reshape(ydet,1,[]),ydet_last];
yreg_all=[reshape(yreg,1,[]),transpose(yreg_last)];

figure(2)
plot(O4_time,O4_igt)
hold on
plot(O4_time,ydet_all,'r')
%hold on
%plot(O4_time,yreg_all,'k')
title('O4');
xlabel('time(s)');
ylabel('period(s)');
legend('Integrated','Detrended','Regession')








