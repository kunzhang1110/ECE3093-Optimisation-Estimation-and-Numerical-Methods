clc;clear;
% prepare the data for face recognition
train_dir = 'J:\ECE3093 Optimisation Estimation and Numerical Methods\Assignments\Assignment 1\eigenfaces\Train'; % change this to wherever the unzipped Face Recognition\Train folder has been saved
img_dir = dir(fullfile(train_dir, '*.jpg'));
img_num = length(img_dir);
person_num = img_num; % each person has one image, so #persons = #images

traindata = zeros(img_num, 28*34); % #images = img_num, image size = 28*34.
correct_rate= zeros(0,952);
% read all images into the matrix traindata:
for i=1:img_num
    img = imread(fullfile(train_dir, img_dir(i).name));
    img = double(img)/255; % normalize to double in [0,1]
    traindata(i,:) = img(:);
end

% train eigenface:
[eigenV,SCORE,LATENT] = princomp(traindata); % alternatively could be done using the svd(traindata) function
% eigenV: eigen vectors.
% SCORE: projection vectors of training data on the eigen vectors.
% LATENT: eigenvalues

%The eigenvalues plot
figure(1)
plot(LATENT(1:50))
xlabel('Index');
ylabel('Eigenvalues');
title('Eigenvalues,First 50');

%The cumulative sum of eigenvalues and plot
cumLATENT=cumsum(LATENT);
figure(2)
plot(cumLATENT(1:50))
xlabel('Index');
ylabel('Eigenvalues Cumsum');
title('Eigenvalues Cumsum,First 50');



for loop = 1:952
pc_num = loop; % suppose we keep the first 10 Principal Components:
eigenfaces = eigenV(:, 1:pc_num);
gallery = SCORE(:, 1:pc_num);
%figure(3)
%montage(eigenfaces)


% test:
test_dir = 'J:\ECE3093 Optimisation Estimation and Numerical Methods\Assignments\Assignment 1\eigenfaces\Test'; % change this to wherever the unzipped Face Recognition\Test folder has been saved
img_dir = dir(fullfile(test_dir, '*.jpg'));
img_num = length(img_dir);

testdata = zeros(img_num, 28*34); % # images = img_num, image size = 28*34.

for i=1:img_num
    img = imread(fullfile(test_dir, img_dir(i).name));
    img = double(img)/255; % normalize to double in [0,1]
    testdata(i,:) = img(:);
end

% project onto the eigenfaces:
meanV = mean(traindata);
features = (testdata-repmat(meanV,size(testdata,1),1))*eigenfaces;

correct = 0; % counter for correct recognitions

for i=1:img_num
    f = features(i,:);
    dis = sum((repmat(f, person_num, 1) - gallery).^2, 2);%Calculate the distance between features and gallery
    [B, idx] = sort(dis);
    top3rank = idx(1:3); % see whether the correct match is in the top 3 ranked images
    if ismember(i, top3rank)
        correct = correct+1;
    end
end
correct_rate(loop) = correct/img_num;

end

%plot(correct_rate)
%title('Correct Rate')
%xlabel('Principle Component')
%ylabel('Correct Rate')


