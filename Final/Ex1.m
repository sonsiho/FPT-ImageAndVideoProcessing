%Ex1
clear, clc, close all

%%%%%%%%%%%%%%%%%%%%%%%%%
%1.a. Plot the original image and its histogram. Save this image as ‘Color_Histogram.jpe'
Img = imread('Ex1.jfif');

[count, bins] = imhist(Img);
FS = 10;
figure(1), clf;

subplot(1,2,1), bar(bins,count);
set(gca,'fontsize',FS); grid on;
xlim([0 255]); ylim([0 max(count(:)+500)]);
xlabel('Index level'); ylabel('# of pixels');

subplot(1,2,2),imshow(Img);
title('Original Image','fontsize',FS);

saveas(1, 'Color_Histogram.jpeg');

%1.b. Display three primary components Red, Green and Blue of the original image.
%Recombine them in Blue, Red, Green order.
%Plot these images in the same figure and save as ‘Primary_Colors_and_BRG_Image.jpeg’

I1(:,:,1) = Img(:,:,1); % red component
I1(:,:,2) = 0; % green component
I1(:,:,3) = 0; % blue component

I2(:,:,2) = Img(:, :, 2); % green component
I2(:,:,1) = 0; % red component
I2(:,:,3) = 0; % blue component

I3(:,:,3) = Img(:, :, 3); % blue component
I3(:,:,1) = 0; % red component
I3(:,:,2) = 0; % green component

figure(2), clf;
subplot (2, 3 , 1), imshow(I1), title ('Red Image', "fontsize", FS);
subplot (2, 3 , 2), imshow(I2), title ('Green Image', "fontsize", FS);
subplot (2, 3 , 3), imshow(I3), title ('Blue Image', "fontsize", FS);

%Reorder the three components to create a new image as (BRG).
I4(:,:,1) = Img(:,:,3); % red component = img blue
I4(:,:,2) = Img(:,:,1); % green component = img red
I4(:,:,3) = Img(:,:,2); % blue component = img green
subplot (2, 3 , 5), imshow(I4), title ('BRG Image', "fontsize", FS);
saveas(2, 'Primary_Colors_and_BRG_Image.jpeg');

%1.c. Apply histogram equalization for the original image.
%Plot the image and its histogram after being equalized.
%Save this figure as ‘Equalizatio n_Histogram.jpeg'

figure(3), clf;
I5(:,:,1) = histeq(Img(:, :, 1)); % red component
I5(:,:,2) = histeq(Img(:, :, 2)); % green component
I5(:,:,3) = histeq(Img(:, :, 3)); % blue component
[count, bins] = imhist(I5);
bins *= 255;
subplot(1, 2, 1), bar(bins, count);
set(gca, "fontsize", FS); grid on;
xlim([0 255]); xlabel('Index Level'); ylabel('# of pixels');
title('Histogram of equalized image', "fontsize", FS);

subplot(1,2,2),imshow(I5);
title('Equalized Image','fontsize',FS);
saveas(3, 'Equalizatio n_Histogram.jpeg')
