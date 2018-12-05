clc;clear;
C=[1/sqrt(5) 2/sqrt(5);-2/sqrt(5) 1/sqrt(5)];
Z=[0.2 0.6];
lamda=[3 8];
b=[0.4;0.7];
X=b+sqrt(lamda(1))*Z(1)*C(:,1)+sqrt(lamda(2))*Z(2)*C(:,2)

