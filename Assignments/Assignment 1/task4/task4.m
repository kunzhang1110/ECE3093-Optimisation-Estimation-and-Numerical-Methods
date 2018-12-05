% main function
clc;clear;close all
origin = double(imread('zhang.png'));%read the image
origin_R=origin(:,:,1);
origin_G=origin(:,:,2);
origin_B=origin(:,:,3);

keepV= 35; %the values that we keep

dec_ALL(:,:,1)=decomp(keepV,origin_R);
dec_ALL(:,:,2)=decomp(keepV,origin_G);
dec_ALL(:,:,3)=decomp(keepV,origin_B);

figure;
imshow(uint8((dec_ALL))) %reconstruction
