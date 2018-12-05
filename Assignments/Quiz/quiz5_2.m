clc;clear;
C=[81 -49;-49 64];
ro=C(1,2)/(sqrt(C(1,1))*sqrt(C(2,2)))

pred=[1 2]*inv([4 2;2 3])

M=[1 1;0 1]
C=[4 -1;-1 2]
M*C*M'