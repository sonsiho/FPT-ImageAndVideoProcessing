% Load the grayscale image
img = imread('Ex3.png');

FS = 10;

% Define the sharpening filter
h = [0, -1, 0; -1, 5, -1; 0, -1, 0];

%%%%%%%%%%%%%%%%%% Method 1
% Apply the denoise filter (default averaging kernel filter)
img_denoised = imfilter(img, ones(3, 3)/9, 'replicate');
img_restored_kernel = imfilter(img_denoised, h, 'replicate');

%%%%%%%%%%%%%%%%%% Method 2
% Compute the noise variance
noise_var = 0.2^2;
% Compute the estimated noise
noise_est = noise_var / var(img(:));

% Apply the Wiener filter to deblur
img_wiener = deconvwnr(img, h, noise_est);

% Display the restored image
figure(1), clf;
subplot(1, 3, 1), imshow(img), title('Original Image', "fontsize", FS);
subplot(1, 3, 2), imshow(img_restored_kernel), title('Denoised Deblurred Image Method 1', "fontsize", FS);
subplot(1, 3, 3), imshow(img_wiener), title('Denoised Deblurred Image Method 2', "fontsize", FS)

%compare Mean Square Error (MSE) between Method 1 image and original image
mse_kernel = 255 * (img_restored_kernel - img);
fprintf("Mean Square Error after Restoration Method 1: %.2f\n", rms(mse_kernel(:)));

%compare Mean Square Error (MSE) between Method 2 and original image
mse_wiener = 255 * (img_wiener - img);
fprintf("Mean Square Error after Restoration Method 2: %.2f\n", rms(mse_wiener(:)));





