close all; 
clear; 
clc;

% the left image
img = imread('test_image\06_a.png');
figure;
subplot(221), imshow(img), title('a-1 original image');
subplot(222), imhist(img), title('a-2 original hist');

img_o = histeq(img);
subplot(223), imshow(img_o), title('a-3 blurred image');
subplot(224), imhist(img_o), title('a-4 blurred hist');


% the right image
img = imread('test_image\06_b.png');
figure;
subplot(221), imshow(img), title('b-1 original image');
subplot(222), imhist(img), title('b-2 original hist');

img_o = histeq(img);
subplot(223), imshow(img_o), title('b-3 blurred image');
subplot(224), imhist(img_o), title('b-4 blurred hist');

