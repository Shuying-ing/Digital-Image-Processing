close all; 
clear; 
clc; 

%% ======================== Instructions ==========================
% 
%  This file contains code to add different levels of Gaussian noises to a
%  given image.
%
%  It includes three methods:
%       Gauss-type Random Noise Matrix
%       Gaussian Definition
%       MATLAB fuction imnoise()


%% ===================== Part 0: Main Code ======================= 
img = imread('test_image\test_2.bmp'); 
subplot(1,4,1);imshow(img);title('Original image');
[m,n,z] = size(img);


% Add Gaussian noises by randn()
m = 2; mean = 0.03; std = 0.1;
Add_Gaussian_noises_by_randn(img,m,mean,std);

m = 3; mean = 0.2; std = 0.1;
Add_Gaussian_noises_by_randn(img,m,mean,std);

m = 4; mean = 0.2; std = 0.2;
Add_Gaussian_noises_by_randn(img,m,mean,std);
% --------------------------------------------------------


% Add Gaussian noises by definition
m = 2; mean = 0.03; std = 0.1;
Add_Gaussian_noises_by_definition(img,m,mean,std);

m = 3; mean = 0.2; std = 0.1;
Add_Gaussian_noises_by_definition(img,m,mean,std);

m = 4; mean = 0.2; std = 0.2;
Add_Gaussian_noises_by_definition(img,m,mean,std);
% --------------------------------------------------------


% Add Gaussian noises by imnoise()
m = 2; mean = 0.03; std = 0.1;
Add_Gaussian_noises_by_imnoise(img,m,mean,std*std);

m = 3; mean = 0.2; std = 0.1;
Add_Gaussian_noises_by_imnoise(img,m,mean,std*std);

m = 4; mean = 0.2; std = 0.2;
Add_Gaussian_noises_by_imnoise(img,m,mean,std*std);
% --------------------------------------------------------



%% =========== Part 1: Gauss-type Random Noise Matrix ============ 
%  Realized by function randn(m,n)

% noise = mean + std * randn(m,n);
% img = img + noise

function Add_Gaussian_noises_by_randn(img,k,mean,std)
    [m,n,z] = size(img);
    mean_1 = mean; std_1 = std;
    
    noise_1 = mean_1 + std_1 * randn(m,n); %Two dimensional Gaussian distribution matrix
    img_1 = double(img)/255 + noise_1;

    % print
    img_1 = uint8(img_1*255);
    title_1 = ['Mean=' num2str(mean_1) ' Std=' num2str(std_1)];
    subplot(1,4,k),imshow(img_1),title(title_1);
    
    % Save images
    filename = ['M1_' title_1 '.jpg'];
    imwrite(img_1,filename,'jpg');

end


%% ================ Part 2: Gaussian Definition ==================
%  Realized by Gaussian definition
% 
%  noise = mean + std *sqrt(-2*log(u1)).*cos(2*pi*u2);
%  img = img + noise

function Add_Gaussian_noises_by_definition(img,k,mean,std)
    [m,n,z] = size(img);
    mean_2 = mean; std_2 = std;
    
    u1 = rand(m,n); u2 = rand(m,n);
    noise_2 = mean_2 + std_2*sqrt(-2*log(u1)).*cos(2*pi*u2);
    img_2 = double(img)/255 + noise_2;

    % Print
    img_2 = uint8(img_2*255);
    title_2 = ['Mean=' num2str(mean_2) ' Std=' num2str(std_2)];
    subplot(1,4,k),imshow(img_2),title(title_2);
    
    % Save images
    filename = ['M2_' title_2 '.jpg'];
    imwrite(img_2,filename,'jpg');
    
end


%% ============== Part 3: MATLAB fuction imnoise() =============== 
% img = imnoise(img,'gaussian',M,V);
% 
% Set V=0, to keep the spectrum smooth
% Set M=0.01, increase the spectral mean by 1% disturbance

function Add_Gaussian_noises_by_imnoise(img,m,mean,var)
    img_3 = imnoise(img, 'gaussian', mean, var);
    title_3 = ['Mean=' num2str(mean) ' Var=' num2str(var)];
    subplot(1,4,m);imshow(img_3);title(title_3);
    filename = ['M3_' title_3 '.jpg'];
    imwrite(img_3,filename,'jpg');

end


