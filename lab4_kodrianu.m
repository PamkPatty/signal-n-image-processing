%% Завдання 1 
% Завантажимо кілька різних зображень з бібліотеки MATLAB
image1 = imread('coins.png');
image2 = imread('cameraman.tif');
image3 = imread('rice.png');

%% Завдання 2
% Використовуємо функцію fft2 для отримання двовимірних спектрів зображень
F1 = fft2(image1);
F2 = fft2(image2); 
F3 = fft2(image3);

% Відображення спектрів із логарифмічним масштабом
figure;
subplot(1,3,1), imshow(log(1+abs(F1)),[]), title('Spectrum of Coins');
subplot(1,3,2), imshow(log(1+abs(F2)),[]), title('Spectrum of Cameraman');
subplot(1,3,3), imshow(log(1+abs(F3)),[]), title('Spectrum of Rice');

%% Завдання 3
% Використовуємо fftshift для зсуву нульової частоти в центр
F1_shifted = fftshift(F1);
F2_shifted = fftshift(F2);
F3_shifted = fftshift(F3);

figure;
subplot(1,3,1), imshow(log(1+abs(F1_shifted)),[]), title('Shifted Spectrum of Coins');
subplot(1,3,2), imshow(log(1+abs(F2_shifted)),[]), title('Shifted Spectrum of Cameraman'); 
subplot(1,3,3), imshow(log(1+abs(F3_shifted)),[]), title('Shifted Spectrum of Rice');

%% Завдання 4
% Відновлення зображень з використанням ifft2
image1_recovered = ifft2(F1);
image2_recovered = ifft2(F2);
image3_recovered = ifft2(F3);

image1_recovered_shifted = ifft2(F1_shifted);
image2_recovered_shifted = ifft2(F2_shifted);
image3_recovered_shifted = ifft2(F3_shifted);

figure;
subplot(2,3,1), imshow(image1_recovered,[]), title('Recovered Coins (Unshifted)');
subplot(2,3,2), imshow(image2_recovered,[]), title('Recovered Cameraman (Unshifted)');
subplot(2,3,3), imshow(image3_recovered,[]), title('Recovered Rice (Unshifted)');
subplot(2,3,4), imshow(image1_recovered_shifted,[]), title('Recovered Coins (Shifted)');
subplot(2,3,5), imshow(image2_recovered_shifted,[]), title('Recovered Cameraman (Shifted)');
subplot(2,3,6), imshow(image3_recovered_shifted,[]), title('Recovered Rice (Shifted)');
%% Завдання 5
% Задаємо двовимірний фільтр з використанням fspecial('gaussian')
filter_size = [15 15]; % Розмір фільтра
sigma = 3; % Стандартне відхилення
gaussian_filter = fspecial('gaussian', filter_size, sigma);

figure;
imshow(gaussian_filter, []), title('Gaussian Filter Window');

%% Завдання 6
% Визначаємо частотну характеристику фільтра
F_gaussian_filter = fft2(gaussian_filter);
F_gaussian_filter_shifted = fftshift(F_gaussian_filter);

figure;
imshow(log(1+abs(F_gaussian_filter_shifted)),[]), title('Frequency Response of Gaussian Filter');

%% Завдання 
% Змінюємо параметр sigma фільтра та повторюємо завдання 5 та 6
sigma = 6;
gaussian_filter = fspecial('gaussian', filter_size, sigma);

figure;
imshow(gaussian_filter, []), title('Gaussian Filter Window (sigma=6)');

F_gaussian_filter = fft2(gaussian_filter);
F_gaussian_filter_shifted = fftshift(F_gaussian_filter);

figure;
imshow(log(1+abs(F_gaussian_filter_shifted)),[]), title('Frequency Response of Gaussian Filter (sigma=6)');

%% Завдання 
% Фільтрація зображень у просторовій області  
filtered_image1_spatial = imfilter(image1, gaussian_filter, 'replicate');
filtered_image2_spatial = imfilter(image2, gaussian_filter, 'replicate');
filtered_image3_spatial = imfilter(image3, gaussian_filter, 'replicate');

figure;
subplot(1,3,1), imshow(filtered_image1_spatial,[]), title('Spatially Filtered Coins');
subplot(1,3,2), imshow(filtered_image2_spatial,[]), title('Spatially Filtered Cameraman');
subplot(1,3,3), imshow(filtered_image3_spatial,[]), title('Spatially Filtered Rice');
