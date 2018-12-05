clc;clear;
origin = imread('unionjack.png');
origin_d= double(origin);
%eigen decomposition
[evec eval] = eig(origin_d);
%sort the absolute values
sorted=sort(abs(eval),'descend');
%excerpt the largest values
[sortedeigen idx]=sort(sorted(1,:),'descend');
plot(sortedeigen(1:50))
title('eigenvalue');
xlabel('index');
ylabel('eigenvalue');

keepV= 35; %the values that we keep
nidx=idx(keepV:end);%corresponding index of colums

for i=1:max(size(nidx))
    eval(:,nidx(i))=zeros(max(size(eval)),1);%make the insignificant eigenvalues zero
end

figure(2)
imshow(uint16((evec*eval*transpose(evec)))) %reconstruction
