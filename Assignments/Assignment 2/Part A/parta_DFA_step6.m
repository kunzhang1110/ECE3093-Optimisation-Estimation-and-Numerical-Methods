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

%---------------------------------for Y5------------------------------
%Box paramentres

for n=4:300; %box size confined in a range or 4-300number of boxes
m=fix(Y5_len/n); %number of boxes
n_redu=mod(Y5_len,n); %redundant elements number <300

%Spliting data and time
if n_redu<4 %last box = regularbox+redundant elements
    n_last=n_redu+n; %last box size last box
    m_reg = m-1; %number of regular boxes
    Y5_split_reg=reshape(Y5_igt(1:(Y5_len-n_last)),n,m_reg);%splitted regular boxes
    Y5_split_last=Y5_igt((Y5_len- n_last+1):end);%last box
    Y5_time_reg=reshape(Y5_igt(1:(Y5_len-n_last)),n,m_reg);%splitted regular boxes
    Y5_time_last=Y5_igt((Y5_len- n_last+1):end);%last box
else %last box = redundant elements
    n_last=n_redu;%last box size last box
    m_reg = m; %number of regular boxes
    Y5_split_reg=reshape(Y5_igt(1:(Y5_len-n_last)),n,m);%splitted regular boxes
    Y5_split_last=Y5_igt((Y5_len-n_last+1):end);%last box
    Y5_time_reg=reshape(Y5_time(1:(Y5_len-n_last)),n,m);%splitted regular boxes
    Y5_time_last=Y5_time((Y5_len-n_last+1):end);%last box
end

%predefine yreg and ydet, regular regression and detrended
yreg=zeros(n,m_reg);
ydet=zeros(n,m_reg);

%linear regression for each regualr boxes
for i=1:m_reg
[r m b]=regress(Y5_split_reg(:,i),Y5_time_reg(:,i)); %linear regression
yreg(:,i)=transpose(b+m(2)*Y5_time_reg(:,i));   %m(2) is the coefficient with higher confidence
ydet(:,i)=transpose(Y5_split_reg(:,i)-yreg(:,i));
end
%linear regression for last box
[r m b]=regress(Y5_split_last,Y5_time_last); %linear regression
yreg_last=b+m(2)*Y5_time_last; %m(2) is the coefficient with higher confidence
ydet_last=Y5_split_last-yreg_last;

%recombine data into vector
ydet_all=[reshape(ydet,1,[]),transpose(ydet_last)];
rms(n-3)=sqrt(dot(transpose(ydet_all),ydet_all)/length(ydet_all));%root means square of dot product / matrix length
end

n_mat=4:300
loglog(n_mat,transpose(rms))












