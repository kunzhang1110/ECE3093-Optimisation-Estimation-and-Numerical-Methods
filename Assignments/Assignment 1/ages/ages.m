clear all;close all;clc
% prepare the data for face recognition
train_dir = 'D:\ѧϰ\ECSE Monash\Level 3\ECE3093 Optimisation Estimation and Numerical Methods\Assignments\Assignment 1\ages\Train'; % change this to wherever the unzipped Face Recognition\Train folder has been saved
img_dir = dir(fullfile(train_dir, '*.jpg'));
%Extract age from filenames
for i=1:max(size(img_dir));
    img_age(i)=str2num(img_dir(i,1).name(5:6));
end    

img_num = length(img_dir);
person_num = img_num; % each person has one image, so #persons = #images

traindata = zeros(img_num, 69*45); % #images = img_num, image size = 69*45.

% read all images into the matrix traindata:
for i=1:img_num
    img = imread(fullfile(train_dir, img_dir(i).name));
    img = double(img)/255; % normalize to double in [0,1], 255 values for each pixel
    traindata(i,:) = img(:);
end

% train eigenface:
[eigenV,SCORE,LATENT] = princomp(traindata); % alternatively could be done using the svd(traindata) function
% eigenV: eigen vectors.
% SCORE: projection vectors of training data on the eigen vectors.
% LATENT: eigenvalues

% test:
test_dir = 'D:\ѧϰ\ECSE Monash\Level 3\ECE3093 Optimisation Estimation and Numerical Methods\Assignments\Assignment 1\ages\Test'; % change this to wherever the unzipped Face Recognition\Test folder has been saved
img_dir = dir(fullfile(test_dir, '*.jpg'));
img_num = length(img_dir);
%Extract age from test file names
for i=1:max(size(img_dir));
    test_age(i)=str2num(img_dir(i,1).name(5:6));
end    

testdata = zeros(img_num, 69*45); % # images = img_num, image size = 69*45.

for i=1:img_num
    img = imread(fullfile(test_dir, img_dir(i).name));
    img = double(img)/255; % normalize to double in [0,1]
    testdata(i,:) = img(:);
end

mae = zeros(1,max(size(eigenV))); %construct mae

for i=14
pc_num = i; % we keep the first i Principal Components:
eigenfaces = eigenV(:, 1:pc_num);
gallery = SCORE(:, 1:pc_num);

%Modelling the relationship
W=[gallery.^2,gallery,ones(size(gallery,1),1)]\transpose(img_age);
w1=W(1:pc_num);
w2=W((pc_num+1):pc_num+pc_num);
b=W(end);

% project onto the eigenfaces:
meanV = mean(traindata);
features = (testdata-repmat(meanV,size(testdata,1),1))*eigenfaces;
features = transpose (features);
est_age = transpose(w1)*(features.^2)+transpose(w2)*features+b;

%Mean Absolute Error
mae(i) = sum (abs(test_age-est_age))/max(size(test_age));

%my face, rescale to 45 by 69
myface=double(imresize(rgb2gray(imread('D:\ѧϰ\ECSE Monash\Level 3\ECE3093 Optimisation Estimation and Numerical Methods\Assignments\Assignment 1\ages\my_face_for_math.png')),[45 69]));
%imshow(myface)
myface=myface/255; %normalise myface
myface_data(1,:)=myface(:); %put the data in a row
myfeatures = (myface_data-repmat(meanV,size(myface_data,1),1))*eigenfaces; %project the data on eigenvectors
myfeatures = transpose(myfeatures);
my_est_age = transpose(w1)*(myfeatures.^2)+transpose(w2)*myfeatures+b; %estimate age
end

plot(mae(1:100))
title('Mean average error vs. k value');
xlabel('k');
ylabel('MAE')
[minV minidx]=min(mae(1:100));%minV gives the lowest MAE which corresponds to the k value minidx





