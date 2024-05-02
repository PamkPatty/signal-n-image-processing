%% Завдання 1
% Визначення матриці T для ДКП
T = double(dctmtx(8));

% Функція для прямого ДКП
function dct_block = dct_func(block)
    dct_block = T * block.data * T';
end

% Функція для зворотного ДКП
function idct_block = idct_func(block)
    idct_block = T' * block.data * T;
end

% Завантажимо кілька кольорових і чорно-білих зображень
image1 = imread('peppers.png'); % Кольорове зображення
image2 = imread('cameraman.tif'); % Чорно-біле зображення

%% Завдання 2
% Перетворимо кольорове зображення в чорно-біле
gray_image1 = rgb2gray(image1);

figure;
subplot(1,2,1), imshow(image1), title('Original Color Image');
subplot(1,2,2), imshow(gray_image1), title('Grayscale Image');

%% Завдання 3
% Поблочне дискретне косинусне перетворення зображень
B1 = blockproc(gray_image1, [8 8], @dct_func);
B2 = blockproc(image2, [8 8], @dct_func);

%% Завдання 4
% Відобразимо результат поблочного ДКП
figure;
subplot(1,2,1), imshow(log(abs(B1)+1),[]), title('Block DCT of Grayscale Image');
subplot(1,2,2), imshow(log(abs(B2)+1),[]), title('Block DCT of Grayscale Image');

% Пояснення вигляду отриманого зображення...

%% Завдання 5
% Відновлення зображень з поблочного ДКП-спектру
recovered_image1 = blockproc(B1, [8 8], @idct_func);
recovered_image2 = blockproc(B2, [8 8], @idct_func);

figure;
subplot(1,2,1), imshow(recovered_image1,[]), title('Recovered Grayscale Image');
subplot(1,2,2), imshow(recovered_image2,[]), title('Recovered Grayscale Image');

%% Завдання 6
% Квантування результатів ДКП
N = 10; % Крок квантування
quantized_B1 = N * round(B1 / N);
quantized_B2 = N * round(B2 / N);

% Пояснення процедури квантування...

%% Завдання 7
% Квантування коефіцієнтів ДКП з використанням матриці mask
mask = [1 1 1 1 0 0 0 0
         1 1 1 0 0 0 0 0
         1 1 0 0 0 0 0 0
         1 0 0 0 0 0 0 0
         0 0 0 0 0 0 0 0
         0 0 0 0 0 0 0 0
         0 0 0 0 0 0 0 0
         0 0 0 0 0 0 0 0];
     
quantized_B1_mask = blockproc(B1, [8 8], @(block_struct) block_struct.data .* mask);
quantized_B2_mask = blockproc(B2, [8 8], @(block_struct) block_struct.data .* mask);

%% Завдання 8
% Відновлення зображень з квантованого ДКП-спектру
recovered_quantized_image1 = blockproc(quantized_B1_mask, [8 8], @idct_func);
recovered_quantized_image2 = blockproc(quantized_B2_mask, [8 8], @idct_func);

figure;
subplot(1,2,1), imshow(recovered_quantized_image1,[]), title('Recovered from Quantized DCT');
subplot(1,2,2), imshow(recovered_quantized_image2,[]), title('Recovered from Quantized DCT');