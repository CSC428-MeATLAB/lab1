% Read and Display 2 RGB images
img_1 = imread('landscape.jpg');
img_2 = imread('cvgrouppic.jpg');
subplot(3,2,1), imshow(img_1);
subplot(3,2,2), imshow(img_2);

% Convert RGB image to grayscale
gray_img_1 = rgb2gray(img_1);
gray_img_2 = rgb2gray(img_2);

% Save the images to a file
% imwrite(gray_img_1, 'gray_landscape.bmp');
% imwrite(gray_img_2, 'gray_cvgrouppic.bmp');

% Display the images 
subplot(3,2,3), imshow(gray_img_1);
subplot(3,2,4), imshow(gray_img_2);

% Find Max and Min in Matrix
max_gray_img_1 = max(gray_img_1,[],'all');
max_gray_img_2 = max(gray_img_2,[],'all');
min_gray_img_1 = min(gray_img_1,[],'all');
min_gray_img_2 = min(gray_img_2,[],'all');
% Max pixel value in Landscape image = 255
% Max pixel value in Selfie image = 255
% Min pixel value in Landscape image = 0
% Min pixel value in Selfie image = 0

% Find the coordinates of the max and min values 
[row_max_img_1, col_max_img_1] = find(gray_img_1==max_gray_img_1, 1);
[row_max_img_2, col_max_img_2] = find(gray_img_2==max_gray_img_2, 1);
[row_min_img_1, col_min_img_1] = find(gray_img_1==min_gray_img_1, 1);
[row_min_img_2, col_min_img_2] = find(gray_img_2==min_gray_img_2, 1);
% [row, col] of max pixel value in Landscape image = [16, 1]
% [row, col] of max pixel value in Selfie image = [502, 596]
% [row, col] of min pixel value in Landscape image = [986, 7]
% [row, col] of min pixel value in Selfie image = [1985, 1]

% Size of Landscape image = 1200x1920
% Size of Selfie image = 2208x2944

% Reduce quality of image until it is just acceptable
reduced_gray_img_1 = decimate_image(gray_img_1, 40);
reduced_gray_img_2 = decimate_image(gray_img_2, 40);

% Display the reduced images 
subplot(3,2,5), imshow(reduced_gray_img_1);
subplot(3,2,6), imshow(reduced_gray_img_2);

% Save the images to a file
imwrite(reduced_gray_img_1, 'reduced__landscape.bmp');
imwrite(reduced_gray_img_2, 'reduced__cvgrouppic.bmp');

% Function to decimate the image by a specified factor
function [reduced_image] = decimate_image(image, times)
    reduced_image = image(1:times:end, 1:times:end);
end




