close all; 
clear; 
clc; 

%% ======================== Instructions ==========================
% 
%  This file contains code to process the Gaussian noise polluted images
%  by specific kernels to achieve desired effect.
%  
%  Two functions are defined:
%       Average_filtering(N, img)
%       Median_filtering(N, img)


%% ===================== Part 0: Main Code ======================== 
%  Use my filtering functions to process noise polluted images
%  Use MATLAB functions to process noise polluted images
% 
%  Compare with each other

original_img = imread('test_image\test_2.bmp');
img = imread('noi_image\var disturbances\M3_Mean=0.1 Var=0.01.jpg');

% % filtering with my function Average_filtering && Medium_filtering
% Average filtering
figure;
subplot(1,4,1);imshow(original_img);title('Origin');
for k=1:2:5
    my_img_ave = Average_filtering(k,img);
    title_1 = [num2str(k) '*' num2str(k) ' Average filtering'];
    subplot(1,4,(k+1)/2+1),imshow(my_img_ave),title(title_1);
end

% Medium filtering
figure;
subplot(1,4,1);imshow(original_img);title('Origin');
for k=1:2:5
    my_img_med = Median_filtering(k,img);
    title_2 = [num2str(k) '*' num2str(k) ' Medium filtering'];
    subplot(1,4,(k+1)/2+1),imshow(my_img_med),title(title_2);
end
% -----------------------------------------------------------------------


% % filtering with MATLAB fuction filter2 && medfilt2
% Average filtering
figure;
subplot(1,4,1);imshow(original_img);title('Origin');
img_gray = img;     % img_gray = rgb2gray(img);
for k=1:2:5
    img_ave = filter2(fspecial('average',k),img_gray) / 255;
    title_3 = [num2str(k) '*' num2str(k) ' filter2'];
    subplot(1,4,(k+1)/2+1),imshow(img_ave),title(title_3);
end

% Medium filtering
figure;
subplot(1,4,1);imshow(original_img);title('Origin');
for k=1:2:5
    img_med = medfilt2(img_gray);
    title_4 = [num2str(k) '*' num2str(k) ' medfilt2'];
    subplot(1,4,(k+1)/2+1),imshow(img_med),title(title_4);
end
% -----------------------------------------------------------------------



%% ================== Part 1: Average filtering ==================
%  With a kenel of N*N

function img_o=Average_filtering(N, img)
    img_grey = img;     % img_grey = rgb2gray(img);
    [height, width] = size(img_grey);
    img_double = double(img_grey);
    for i=1:height-N+1
        for j=1:width-N+1
             img_double(i:i+(N-1)/2,j:j+(N-1)/2) = sum(sum(img_grey(i:i+(N-1),j:j+(N-1)) ))/(N*N);
        end
    end
    img_o = uint8(img_double);
end
     


 %% ================== Part 2: Median filtering ==================
%  With a kenel of N*N   

function img_o=Median_filtering(N, img)
    img_grey = img;     % img_grey = rgb2gray(img);
    [height, width] = size(img_grey);
    img_double = double(img_grey);
    for i=1:height-N+1
        for j=1:width-N+1
            temp = img_grey(i:i+(N-1),j:j+(N-1));
            m = median(temp(:));
            img_double(i:i+(N-1)/2,j:j+(N-1)/2) = m;
        end
    end
    img_o = uint8(img_double);
end

