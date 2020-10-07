close all; 
clear; 
clc; 

%% ======================== Instructions ==========================
% 
%  This file contains code to calculate  histogram and 
%  make histogram equalization  for  given  images.
%
%  Three functions are defined:
%     histogram_calculation(img)
%     histogram_equalization(img)
%     histogram_equalization_ad(img)


%% ===================== Part 0: Main Code ======================== 
% img = imread('test_image\test_4.png');
% histogram_equalization(img);         % test_1/2/3
% histogram_equalization_ad(img);      % test_4/office_1-6


% Histograms of noi-images with different mean disturbances by imnoise()
img = imread('noi_image\mean disturbances\M3_Mean=0.03 Var=0.jpg');
m = 1; mean = 0.03; var = 0;
histogram_calculation_ad(img, m, mean, var);

img = imread('noi_image\mean disturbances\M3_Mean=0.1 Var=0.jpg');
m = 2; mean = 0.1; var = 0;
histogram_calculation_ad(img, m, mean, var);

img = imread('noi_image\mean disturbances\M3_Mean=0.3 Var=0.jpg');
m = 3; mean = 0.3; var = 0;
histogram_calculation_ad(img, m, mean, var);
% -----------------------------------------------------------------------


% Histograms of noi-images with different mean vars by imnoise()
figure;
img = imread('noi_image\var disturbances\M3_Mean=0.1 Var=0.01.jpg');
m = 1; mean = 0.1; var = 0.01;
histogram_calculation_ad(img, m, mean, var);

img = imread('noi_image\var disturbances\M3_Mean=0.1 Var=0.03.jpg');
m = 2; mean = 0.1; var = 0.03;
histogram_calculation_ad(img, m, mean, var);

img = imread('noi_image\var disturbances\M3_Mean=0.1 Var=0.1.jpg');
m = 3; mean = 0.1; var = 0.1;
histogram_calculation_ad(img, m, mean, var);
% -----------------------------------------------------------------------


% Histograms of noi-images with randn()
figure;
img = imread('noi_image\M1_Mean=0.03 Std=0.1.jpg');
m = 1; mean = 0.03; std = 0.1;
histogram_calculation_ad(img, m, mean, std);

img = imread('noi_image\M1_Mean=0.2 Std=0.1.jpg');
m = 2; mean = 0.2; std = 0.1;
histogram_calculation_ad(img, m, mean, std);

img = imread('noi_image\M1_Mean=0.2 Std=0.2.jpg');
m = 3; mean = 0.2; std = 0.2;
histogram_calculation_ad(img, m, mean, std);
% -----------------------------------------------------------------------


% Histograms of noi-images with Gaussian definition()
figure;
img = imread('noi_image\M2_Mean=0.03 Std=0.1.jpg');
m = 1; mean = 0.03; std = 0.1;
histogram_calculation_ad(img, m, mean, std);

img = imread('noi_image\M2_Mean=0.2 Std=0.1.jpg');
m = 2; mean = 0.2; std = 0.1;
histogram_calculation_ad(img, m, mean, std);

img = imread('noi_image\M2_Mean=0.2 Std=0.2.jpg');
m = 3; mean = 0.2; std = 0.2;
histogram_calculation_ad(img, m, mean, std);
% -----------------------------------------------------------------------


% Histograms of noi-images with imnoise()
figure;
img = imread('noi_image\M3_Mean=0.03 Var=0.01.jpg');
m = 1; mean = 0.03; var = 0.01;
histogram_calculation_ad(img, m, mean, var);

img = imread('noi_image\M3_Mean=0.2 Var=0.01.jpg');
m = 2; mean = 0.2; var = 0.01;
histogram_calculation_ad(img, m, mean, var);

img = imread('noi_image\M3_Mean=0.2 Var=0.04.jpg');
m = 3; mean = 0.2; var = 0.04;
histogram_calculation_ad(img, m, mean, var);
% -----------------------------------------------------------------------



%% ================= Part 1: Calculate  Histogram =================
%  Calculate  Histogram:
%       Count the number of pixel values for each gray level
%       Count the frequency of each gray level
%  
%  Compare my function histogram_calculation() with MATLAB function imhist()

function ProbPixel=histogram_calculation(img)
    [height, width] = size(img);

    % STEP1: Count the number of pixel values for each gray level
    NumPixel = zeros(1,256);
    for i = 1 : height
       for j = 1 : width
           k = img(i,j);    % Gray value of pixel point(i,j)
           k = k + 1;       % The index of the array starts with 1, but the value of image pixel starts with 0
           NumPixel(k) = NumPixel(k) + 1;
       end
    end

    % STEP2: Count the frequency of each gray level
    ProbPixel = zeros(1,256);
    for i = 1 : 256
        ProbPixel(i) = NumPixel(i) / (height * width);
    end
        
    % Compare my function//histogram_calculation with //imhist()
    figure;
    bar(ProbPixel), title('Histogram calculation - MY'), axis ([-10 265 -inf inf]);
    
    figure;
    subplot(221), imshow(img), title('Original image');
    subplot(223), bar(NumPixel), title('Histogram calculation - MY'), axis ([-inf inf 0 3200]);
    subplot(224), imhist(img), title('Histogram calculation - Imhist');
    
end

function ProbPixel=histogram_calculation_ad(img, m, mean, var)
    [height, width] = size(img);

    % STEP1: Count the number of pixel values for each gray level
    NumPixel = zeros(1,256);
    for i = 1 : height
       for j = 1 : width
           k = img(i,j);    % Gray value of pixel point(i,j)
           k = k + 1;       % The index of the array starts with 1, but the value of image pixel starts with 0
           NumPixel(k) = NumPixel(k) + 1;
       end
    end

    % STEP2: Count the frequency of each gray level
    ProbPixel = zeros(1,256);
    for i = 1 : 256
        ProbPixel(i) = NumPixel(i) / (height * width);
    end
        
    % Print
%     title_0 = ['H-MY ' 'Mean=' num2str(mean) ' Var=' num2str(var)];
%     title_0 = ['H-MY ' 'Mean1 = ' num2str(mean) ' Std1 = ' num2str(var)];
    title_0 = ['H-MY ' 'Mean2 = ' num2str(mean) ' Std2 = ' num2str(var)];
    subplot(1,3,m); bar(ProbPixel); title(title_0); axis ([-10 265 -inf inf]);

end


%% ======== Part 2: Histogram equalization for Gray_image =========
%  Make histogram equalization for gray images
%  For histogram calculating, use my own code histogram_calculation()
%  
%  Display images before and after histogram equalization
%  Compare my function histogram_equalization() with MATLAB function histeq()

function histogram_equalization(img)
%     img = rgb2gray(img);
    [height, width] = size(img);
    ProbPixel = histogram_calculation(img);
    
    % Calculate the cumulative distribution function(CDF) by cumsum()
    CumPixel = cumsum(ProbPixel);   % 0-1
    subplot(222), plot(CumPixel), title('CumPixel'), axis ([-10 265 -inf inf]);
    
    CumPixel = uint8((256-1) .* CumPixel + 0.5);   % 0-255
    img_o = uint8(zeros(height, width));
    for i = 1 : height
       for j = 1 : width
          img_o(i,j) = CumPixel(img(i,j)+1);    % Notice: +1
       end
    end
    
    % Compare my function//histogram_equalization with //histeq()
    figure;
    subplot(1,3,1);imshow(img);title('Original - Gray');
    subplot(1,3,2);imshow(img_o);title('Equalized - MY');
    img_oo = histeq(img, 256);
    subplot(1,3,3);imshow(img_oo);title('Equalized - Histeq');
    
    % obtain histogram plot of the equalized image
    histogram_calculation(img_o);
    
end


%% ======= Part 3: Histogram equalization for Colored_image =======
%  Make histogram equalization for colored images
%  In both RGB space && HSV space
%  For histogram calculating, use both my own code and MATLAB function_histeq()
%  
%  Compare the result in each space

function histogram_equalization_ad(img)
    
% -------- Histogram equalization in RGB space ----------
% For histogram calculating, use MATLAB function_histeq()

    % Extract three components of R, G and B
    R = img(:, :, 1);
    G = img(:, :, 2); 
    B = img(:, :, 3); 

    % Histogram equalization
    R = histeq(R, 256); 
    G = histeq(G, 256); 
    B = histeq(B, 256); 

    img_o = img;
    img_o(:, :, 1) = R; 
    img_o(:, :, 2) = G; 
    img_o(:, :, 3) = B;
    
    
% -------- Histogram equalization in HSV space ----------
% For histogram calculating, use both my own code 
% histogram_calculation()
 
    % convert RGB space to the HSV one
    img_hsv = rgb2hsv(img); 
    v = img_hsv(:, :, 3);
    v = uint8(v .* 255 + 0.5);	% in case 0
    
    [height, width] = size(v);
    ProbPixel = histogram_calculation(v);
    CumPixel = cumsum(ProbPixel);
    CumPixel = uint8(255 .* CumPixel + 0.5);

    for i = 1 : height
       for j = 1 : width
          v(i,j) = CumPixel(v(i,j)+1);    % Notice: +1
       end
    end
    v = im2double(v); 
    img_hsv(:, :, 3) = v; 
    img_oo = hsv2rgb(img_hsv); 


% -------- Compare the result in RGB && HSV space --------
    figure;
    subplot(1,3,1);imshow(img);title('Original - Color');
    subplot(1,3,2);imshow(img_o);title('Equalized: RGB');
    subplot(1,3,3);imshow(img_oo);title('Equalized: HSV');

    % obtain 'R' histogram plot of the equalized image in RGB space
    histogram_calculation(img_o(:,:,3));
end



