original_img = imread('test_image\test_2.bmp');
img = imread('noi_image\var disturbances\M3_Mean=0.1 Var=0.01.jpg');

subplot(1,4,1);imshow(original_img);title('Origin');
subplot(1,4,2);imshow(img);title('Polluted');

k = 5;

img_ave = filter2(fspecial('average',k),img_gray) / 255;
title_3 = [num2str(k) '*' num2str(k) ' filter2'];
subplot(1,4,3),imshow(img_ave),title(title_3);

img_med = medfilt2(img_gray);
title_4 = [num2str(k) '*' num2str(k) ' medfilt2'];
subplot(1,4,4),imshow(img_med),title(title_4);