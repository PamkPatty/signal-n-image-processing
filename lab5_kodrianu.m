%% Завдання 1
% Завантажимо кілька кольорових і чорно-білих зображень
image1 = imread('peppers.png'); % Кольорове зображення
image2 = imread('cameraman.tif'); % Чорно-біле зображення

% Відображення зображень
figure;
subplot(1,3,1); imshow(image1); title('Peppers');
subplot(1,3,2); imshow(image2); title('Cameraman');

%% Завдання 2
% Перетворимо кольорове зображення в чорно-біле
gray_image1 = rgb2gray(image1);

figure;
subplot(1,2,1), imshow(image1), title('Original Color Image');
subplot(1,2,2), imshow(gray_image1), title('Grayscale Image');

%% Завдання 3
% Виконаємо дискретне косинусне перетворення зображень
dct_image1 = dct2(gray_image1);
dct_image2 = dct2(image2);

figure;
subplot(1,2,1), imshow(log(abs(dct_image1)+1),[]), title('DCT of Grayscale Image');
subplot(1,2,2), imshow(log(abs(dct_image2)+1),[]), title('DCT of Grayscale Image');

%% Завдання 4
% Відновимо зображення з ДКП-спектрів
recovered_image1 = idct2(dct_image1);
recovered_image2 = idct2(dct_image2);

figure;
subplot(1,2,1), imshow(recovered_image1,[]), title('Recovered Grayscale Image');
subplot(1,2,2), imshow(recovered_image2,[]), title('Recovered Grayscale Image');

%% Завдання 5
% Квантування результатів ДКП
N = 10; % Крок квантування
quantized_dct_image1 = N * round(dct_image1 / N);
quantized_dct_image2 = N * round(dct_image2 / N);

%% Завдання 6
figure;
subplot(1,2,1), imshow(log(abs(quantized_dct_image1)+1),[]), title('Quantized DCT of Grayscale Image');
subplot(1,2,2), imshow(log(abs(quantized_dct_image2)+1),[]), title('Quantized DCT of Grayscale Image');

%% Завдання 7
recovered_quantized_image1 = idct2(quantized_dct_image1);
recovered_quantized_image2 = idct2(quantized_dct_image2);

figure;
subplot(1,2,1), imshow(recovered_quantized_image1,[]), title('Recovered from Quantized DCT');
subplot(1,2,2), imshow(recovered_quantized_image2,[]), title('Recovered from Quantized DCT');

%% Завдання 9
n = 10; % Крок квантування для зображення
quantized_image1 = round(gray_image1 / n) * n;
quantized_image2 = round(image2 / n) * n;

figure;
subplot(1,2,1), imshow(quantized_image1,[]), title('Quantized Grayscale Image');
subplot(1,2,2), imshow(quantized_image2,[]), title('Quantized Grayscale Image');
