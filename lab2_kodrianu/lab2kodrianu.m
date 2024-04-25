
%% 1. Завантажити з бібліотеки MATLAB кілька тестових зображень
image1 = imread('coins.png');
image2 = imread('cameraman.tif');
image3 = imread('rice.png');

%% 2. Відобразити вихідні зображення на екрані ПК
figure;
subplot(1,3,1); imshow(image1); title('Coins');
subplot(1,3,2); imshow(image2); title('Cameraman');
subplot(1,3,3); imshow(image3); title('Rice');

%% 3. Здійснити процедуру зашумлення зображення нормальним білим шумом і імпульсною перешкодою з різною щільністю
% Зашумлення нормальним білим шумом
noise_mean = 0; noise_var = 0.01;
image1_gaussian_noise = imnoise(image1, 'gaussian', noise_mean, noise_var);
image2_gaussian_noise = imnoise(image2, 'gaussian', noise_mean, noise_var);
image3_gaussian_noise = imnoise(image3, 'gaussian', noise_mean, noise_var);

% Зашумлення імпульсною перешкодою
salt_and_pepper_density = 0.05;
image1_salt_pepper_noise = imnoise(image1, 'salt & pepper', salt_and_pepper_density);
image2_salt_pepper_noise = imnoise(image2, 'salt & pepper', salt_and_pepper_density);
image3_salt_pepper_noise = imnoise(image3, 'salt & pepper', salt_and_pepper_density);

%% 4. Відобразити зашумлені зображення
figure;
subplot(2,3,1); imshow(image1_gaussian_noise); title('Coins with Gaussian Noise');
subplot(2,3,2); imshow(image2_gaussian_noise); title('Cameraman with Gaussian Noise');
subplot(2,3,3); imshow(image3_gaussian_noise); title('Rice with Gaussian Noise');
subplot(2,3,4); imshow(image1_salt_pepper_noise); title('Coins with Salt & Pepper Noise');
subplot(2,3,5); imshow(image2_salt_pepper_noise); title('Cameraman with Salt & Pepper Noise');
subplot(2,3,6); imshow(image3_salt_pepper_noise); title('Rice with Salt & Pepper Noise');

%% 5. Виконати фільтрацію вихідних зображень лінійними фільтрами з використанням віконних фільтрів низьких і високих частот, і процедури imfilter(I,h)
% Фільтр низьких частот (усереднюючий)
avg_filter = fspecial('average', 3);
image1_low_pass = imfilter(image1, avg_filter);
image2_low_pass = imfilter(image2, avg_filter);
image3_low_pass = imfilter(image3, avg_filter);

% Фільтр високих частот (Лапласіан)
laplacian_filter = fspecial('laplacian', 0.2);
image1_high_pass = imfilter(image1, laplacian_filter);
image2_high_pass = imfilter(image2, laplacian_filter);
image3_high_pass = imfilter(image3, laplacian_filter);

%% 6. Відобразити зображення після фільтрації. Пояснити отриманий результат (зміна характеру зображення в результаті фільтрації).
figure;
subplot(2,3,1); imshow(image1_low_pass); title('Coins - Low Pass Filter');
subplot(2,3,2); imshow(image2_low_pass); title('Cameraman - Low Pass Filter');
subplot(2,3,3); imshow(image3_low_pass); title('Rice - Low Pass Filter');
subplot(2,3,4); imshow(image1_high_pass); title('Coins - High Pass Filter');
subplot(2,3,5); imshow(image2_high_pass); title('Cameraman - High Pass Filter');
subplot(2,3,6); imshow(image3_high_pass); title('Rice - High Pass Filter');

% Пояснення: Фільтр низьких частот усереднює значення пікселів, що призводить до згладжування зображення. Фільтр високих частот виділяє границі та контури на зображенні.

%% 7. Профільтрувати різними лінійними фільтрами зображення, що зашумлені різними за характером перешкодами. Відобразити результат фільтрації. Пояснити отриманий результат.
% Фільтрація зображень з гауссівським шумом
gaussian_noise_filtered_1 = imfilter(image1_gaussian_noise, avg_filter);
gaussian_noise_filtered_2 = imfilter(image2_gaussian_noise, avg_filter);
gaussian_noise_filtered_3 = imfilter(image3_gaussian_noise, avg_filter);

% Фільтрація зображень з імпульсною перешкодою
salt_pepper_noise_filtered_1 = medfilt2(image1_salt_pepper_noise, [3 3]);
salt_pepper_noise_filtered_2 = medfilt2(image2_salt_pepper_noise, [3 3]);
salt_pepper_noise_filtered_3 = medfilt2(image3_salt_pepper_noise, [3 3]);

figure;
subplot(2,3,1); imshow(gaussian_noise_filtered_1); title('Coins - Gaussian Noise Filtered');
subplot(2,3,2); imshow(gaussian_noise_filtered_2); title('Cameraman - Gaussian Noise Filtered');
subplot(2,3,3); imshow(gaussian_noise_filtered_3); title('Rice - Gaussian Noise Filtered');
subplot(2,3,4); imshow(salt_pepper_noise_filtered_1); title('Coins - Salt & Pepper Noise Filtered');
subplot(2,3,5); imshow(salt_pepper_noise_filtered_2); title('Cameraman - Salt & Pepper Noise Filtered');
subplot(2,3,6); imshow(salt_pepper_noise_filtered_3); title('Rice - Salt & Pepper Noise Filtered');

% Пояснення: Лінійні фільтри, такі як усереднюючий, добре справляються з гауссівським шумом, згладжуючи зображення. Однак, для імпульсної перешкоди краще підходить нелінійний медіанний фільтр.

%% 8. Виконати фільтрацію вихідних і перекручених шумами зображень адаптивним вінерівським фільтром (фільтром, який адаптує свої характеристики під характер і рівень шумів).
wiener_filtered_1 = wiener2(image1_gaussian_noise, [5 5]);
wiener_filtered_2 = wiener2(image2_gaussian_noise, [5 5]);
wiener_filtered_3 = wiener2(image3_gaussian_noise, [5 5]);

figure;
subplot(1,3,1); imshow(wiener_filtered_1); title('Coins - Wiener Filtered');
subplot(1,3,2); imshow(wiener_filtered_2); title('Cameraman - Wiener Filtered');
subplot(1,3,3); imshow(wiener_filtered_3); title('Rice - Wiener Filtered');

%% 9. Здійснити фільтрацію зашумлених зображень нелінійним медіанним фільтром. Відобразити отриманий результат. Пояснити дію медіанного фільтра на гаусівську й імпульсну перешкоду на зображенні.
median_filtered_gaussian_1 = medfilt2(image1_gaussian_noise, [3 3]);
median_filtered_gaussian_2 = medfilt2(image2_gaussian_noise, [3 3]);
median_filtered_gaussian_3 = medfilt2(image3_gaussian_noise, [3 3]);

median_filtered_salt_pepper_1 = medfilt2(image1_salt_pepper_noise, [3 3]);
median_filtered_salt_pepper_2 = medfilt2(image2_salt_pepper_noise, [3 3]);
median_filtered_salt_pepper_3 = medfilt2(image3_salt_pepper_noise, [3 3]);

figure;
subplot(2,3,1); imshow(median_filtered_gaussian_1); title('Coins - Gaussian Noise Median Filtered');
subplot(2,3,2); imshow(median_filtered_gaussian_2); title('Cameraman - Gaussian Noise Median Filtered');
subplot(2,3,3); imshow(median_filtered_gaussian_3); title('Rice - Gaussian Noise Median Filtered');
subplot(2,3,4); imshow(median_filtered_salt_pepper_1); title('Coins - Salt & Pepper Noise Median Filtered');
subplot(2,3,5); imshow(median_filtered_salt_pepper_2); title('Cameraman - Salt & Pepper Noise Median Filtered');
subplot(2,3,6); imshow(median_filtered_salt_pepper_3); title('Rice - Salt & Pepper Noise Median Filtered');

% Пояснення: Медіанний фільтр ефективно видаляє імпульсну перешкоду (соль і перець), замінюючи значення пікселів медіаною околиці.
% При гауссівському шумі медіанний фільтр також згладжує зображення, але може призвести до спотворень.

%% 10. Відповісти на наступні запитання:

%1 поясніть процедуру лінійної фільтрації зображення віконним фільтром.
%2 чому відрізняються “вікна фільтрів” для низькочастотної і високочастотної фільтрації?
%3 як змінюється вигляд зображення після його фільтрації низькочастотнимифільтрами?
%4 як змінюється вигляд зображення після його фільтрації високочастотними фільтрами?
%5 для перешкод якого характеру більше підходить медіанна фільтрація, і чому?

%% Відповіді:

%1 Процедура лінійної фільтрації зображення віконним фільтромце застосування фільтра 
% до зображення на кожному кроці, де вікно фільтра просувається по всьому зображенню, 
% і значення пікселів у цьому вікні перераховуються згідно з визначеною операцією.

%2 Вікна фільтрів для низькочастотної і високочастотної фільтрації відрізняються 
% в залежності від їхньої реакції на різні частоти у зображенні. 
% Низькочастотні фільтри зазвичай мають більші розміри для згладжування,
% а високочастотні - менші для підсилення різких переходів.

%3 Після фільтрації низькочастотними фільтрами зображення стає розмитим і менше контрастним.

%4 Після фільтрації високочастотними фільтрами зображення стає більш гострим і контрастним.

%5 Медіанна фільтрація підходить для перешкод типу "соль і перець", 
% оскільки вона ефективно видаляє випадкові яскраві пікселі 
% без згладжування суттєвих деталей.
