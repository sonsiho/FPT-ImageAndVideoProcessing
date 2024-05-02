%%%%%
clear , clc , close all;

% (a) Read and display the original image
originalImage = imread('Ex2.jpg');
figure, imshow(originalImage), title('Original Image');

% (b) Binarize the original image using Otsu's method
grayImage = rgb2gray(originalImage);
level = graythresh(grayImage);
binaryImage = im2bw(grayImage, level);
figure, imshow(binaryImage), title('Binary Image');

% (c) Fill small holes in the binary image
filledImage = imfill(binaryImage, 'holes');
figure, imshow(filledImage), title('Filled Binary Image');

% (d) Perform erosion on the binary image using a diamond structuring element
se = strel('diamond', 15);
erodedImage = imerode(filledImage, se);
figure, imshow(erodedImage), title('Eroded Binary Image');

% (e) Apply region labeling on the eroded image to count number of stones
[labeledImage, numberOfStones] = bwlabel(erodedImage,6);
rgbLabel2 = label2rgb(labeledImage, 'jet', 'k');
printf("Number of objects after dilation: %d\n", numberOfStones);
figure(5), imshow(rgbLabel2), title('Eroded Binary Image');





