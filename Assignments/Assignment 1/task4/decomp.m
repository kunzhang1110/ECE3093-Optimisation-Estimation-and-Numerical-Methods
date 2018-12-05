%function for decompostion, sugular value plotting and approximation
function dec_X=decomp(keepV,data_X)
% a way to set title name of the figures, not important
nhdle = inputname(2);
if(strcmp(nhdle,'origin_R'))
    name = 'Red';
else if (strcmp(nhdle,'origin_G'))
    name='Green';
    else
name='Blue';
    end
end

%SVD
[U,S,V] = svd(data_X);
%sort the absolute values
sorted=sort(abs(S),'descend');
%excerpt the largest values
[sortedSV idx]=sort(sorted(1,:),'descend');
figure;
plot(sortedSV(1:50));
title(sprintf('Singular Values for %s', name));
xlabel('Index');
ylabel('Singular values');
hold on
nidx=idx(keepV:end);%corresponding index of colums
for i=1:max(size(nidx))
    S(:,nidx(i))=zeros(max(size(S)),1);%make the insignificant singular values zero
end
%approximated matrix
dec_X=U*S*transpose(V);

