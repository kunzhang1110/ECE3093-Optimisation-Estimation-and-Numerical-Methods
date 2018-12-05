%Written by Kun Zhang
%ID 22701478
%--------------------------------------------------
%reconstruct convariance matrix (3,4,1,2)
clc;clear all;close all;
%assigned variable
A=3;
U=1.478;
V=2.27;
Z=8.741;

%% Question (1)(i)
my_cov=[Z+1 -0.75	0.64    -0.84
        -0.75   Z+2     0.51    0.81
        0.64   0.51    9.25   -1.25
        -0.84  0.81    -1.25   4.75];  %covariance matrix
sym_check=my_cov-my_cov';  %if zero matrix, symmetric
eig(my_cov);    %if all eigenvalues>0, positive definite

%% Question (1)(ii)
my_exp=[U;V;U+3*V;2*U+V];   %expectation vector

% %% Question (2)(i)(ii)
% cov_Y=my_cov(2:end,2:end);  %Cov(Y)
% cov_XY=my_cov(1,2:end); %Cov(X,Y)
% cov_X=my_cov(1,1); %Cov(X)
% exp_X=my_exp(1);
% exp_Y=my_exp(2:end);
% M=cov_XY/cov_Y; %Cov(X,Y)/Cov(Y)
% inov_var=cov_X-M*cov_XY'; %var(X-P(X|Y) Prediction error
% 
% %% Question (2)(iii)
% y=[U+V+A U-2*V U*V+A]'; %y - known Y
% prd=exp_X+M*(y-exp_Y);  %P(X|Y=y)

%% Question (3)(i)
N=3000; %simulation point
cov_X=my_cov(1:2,1:2);  %Cov(X)
cov_Y=my_cov(3:end,3:end);  %Cov(Y)
exp_X=my_exp(1:2);
exp_Y=my_exp(3:end);
cov_XY=my_cov(1:2,3:end)

%% Question (3)(ii)(iii)
[Q D]=eig(cov_X); %spectral decomposition
Z=randn(2,N);   %standard normal Z
X=diag(my_exp(1:2))*ones(2,N)+Q*sqrt(D)*Z; %X=[W1 W2]
W1=X(1,1:end);
W2=X(2,1:end);
wmv=mvnrnd(exp_X,cov_X,3000);    %MVNRND Random vectors from the multivariate normal distribution.

%plots
figure(1)
plot(W1,W2,'x')
title('Scatter');
xlabel('W1');
ylabel('W2');
figure(2)
plot(wmv(:,1),wmv(:,2),'x')
title('Mvnrnd');
xlabel('W1');
ylabel('W2');



%% Question (3)(iv)
xmin=min(W1);
xmax=max(W1);
ymin=min(W2);
ymax=max(W2);
xstep=0.1;
ystep=xstep;
[x,yy]=meshgrid(xmin:xstep:xmax,ymin:ystep:ymax); %construct meshgrid
[nx,ny]=size(x);
z=mvnpdf([x(:) yy(:)],exp_X',cov_X); %multivariate pdf
z=reshape(z,nx,ny);
figure(3)
contour(x,yy,z)  %contourplots
title('Contour');
grid on
%% Question (3)(v)
M=cov_XY/cov_Y; %Cov(X,Y)*Cov(Y)^-1

%% Question (3)(vi)
y=[2*V-U U+V]'; %y - known Y
prd=exp_X+M*(y-exp_Y);  %a=P(X|Y=y)

%% Question (3)(vii)
inov_var=cov_X-M*cov_XY'; %K=var(X-P(X|Y) Prediction error
inov_exp=sqrt(inov_var); %a=E(X-P(X|Y)

%% Question (3)(viii)
[QY DY]=eig(cov_Y); %spectral decomposition
ZY=randn(2,N);

PX_Y=diag(exp_X)*ones(2,N)+M*Q*sqrt(D)*Z;
Y=diag(exp_Y)*ones(2,N)+Q*sqrt(D)*Z;
%% Question (3)(ix)
figure(4)
hold on
plot(Y(1,:),Y(2,:),'r.')
plot(PX_Y(1,:),PX_Y(2,:),'.')
contour(x,yy,z) 
title('Overlay plots');
xlabel('n');
ylabel('Mag');
legend('Y','Prediction','contour');




