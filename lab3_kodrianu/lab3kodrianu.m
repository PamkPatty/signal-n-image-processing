%% 1. Завантажити з бібліотеки MATLAB тестове зображення
original_image = imread('cameraman.tif');

%% 2. Відобразити вихідне зображення на екрані ПК
figure;
imshow(original_image);
title('Original Image');

%% 3. Здійснити процедуру перекручення зображення змінюючи параметри LEN і THETA
len = 9; % Довжина розфокусування
theta = 11; % Кут розфокусування (в градусах)
PSF = fspecial('motion', len, theta); % Функція розсіювання точки (PSF)
blurred_image = imfilter(original_image, PSF, 'circular'); % Перекручене зображення

%% 4. Відобразити перекручене зображення
figure;
imshow(blurred_image);
title('Blurred Image');

%% 5. Виконати процедуру відновлення зображення
rlc_deblurred_image = deconvlucy(blurred_image, PSF, 100); % Відновлення за допомогою алгоритму Люсі-Річардсона

%% 6. Відобразити зображення після відновлення
figure;
imshow(rlc_deblurred_image);
title('Restored Image (Lucy-Richardson)');

%% 7. Виконати зашумлення початкового зображення та повторити пункти 2-6
noise_mean = 0;
noise_var = 0.01;
noisy_image = imnoise(original_image, 'gaussian', noise_mean, noise_var); % Зашумлене зображення

figure;
imshow(noisy_image);
title('Noisy Image');

len = 9;
theta = 11;
PSF = fspecial('motion', len, theta);
blurred_noisy_image = imfilter(noisy_image, PSF, 'circular'); % Перекручене зашумлене зображення

figure;
imshow(blurred_noisy_image);
title('Blurred Noisy Image');

rlc_deblurred_noisy_image = deconvlucy(blurred_noisy_image, PSF, 100); % Відновлення зашумленого зображення

figure;
imshow(rlc_deblurred_noisy_image);
title('Restored Noisy Image (Lucy-Richardson)');

%% 8. Відповісти на наступні запитання:
%- поясніть процес формування зображення.
%- опишіть модель формування зображень та лінійних перекручень.
%- поясніть процес відновлення перекрученого зображення.

%% Відповіді
%1. Формування зображення - це процес захоплення світла 
% та його перетворення на цифровий сигнал.

%2. Модель формування зображень описує вплив фізичних процесів на зображення
% за допомогою математичних виразів. 
% Лінійні перекручення змінюють зображення лінійно.

%3. Відновлення перекрученого зображення - це процес виправлення або зменшення
% впливу перекручень, щоб отримати більш чітке зображення.

