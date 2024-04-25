%% 1. Завантажити з бібліотеки MATLAB і відобразити на екрані ПК кілька зображень у різних форматах.
image1 = imread('peppers.png');
image2 = imread('cameraman.tif');
image3 = imread('coins.png');

% Відображення зображень
figure;
subplot(1,3,1); imshow(image1); title('Peppers');
subplot(1,3,2); imshow(image2); title('Cameraman');
subplot(1,3,3); imshow(image3); title('Coins');

%% 2. Завантажити зображення, що зберігається в довільному каталозі (з безпосередньою вказівкою шляху до нього).
% Завантаження зображення з вказаного шляху
image4 = imread('C:\MATLAB\lab1_kodrianu\cat.jpg');

% Відображення зображення
figure;
imshow(image4);

%% 3. Одержати інформацію про завантажені зображення.
% Інформація про зображення image1
whos image1

% Інформація про зображення image2
whos image2

% Інформація про зображення image3
whos image3

% Інформація про зображення image4
whos image4

%% 4. Зберегти завантажені зображення в заданому каталозі з указівкою шляху до нього.
% Зберегти зображення в форматі JPEG
imwrite(image1, 'C:\MATLAB\lab1_kodrianu\Pictures\new_peppers.png', 'JPEG');
imwrite(image2, 'C:\MATLAB\lab1_kodrianu\Pictures\new_cameraman.jpg', 'JPEG');
imwrite(image3, 'C:\MATLAB\lab1_kodrianu\Pictures\new_coins.jpg', 'JPEG');
imwrite(image4, 'C:\MATLAB\lab1_kodrianu\Pictures\new_cat.jpg', 'JPEG');

%% 5. З використанням процедури imhist(I) знайти гістограми розподілу яскравостей завантажених зображень і відобразити їх на екрані ПК.
figure;
subplot(2,2,1); imhist(image1); title('Histogram of Peppers');
subplot(2,2,2); imhist(image2); title('Histogram of Cameraman');
subplot(2,2,3); imhist(image3); title('Histogram of Coins');
subplot(2,2,4); imhist(image4); title('Histogram of Your Image');

%% 6. З використанням процедури imadjust(I); виконати контрастування зображень.
image1_adjusted_color = imadjust(image1, [], [], []);
image2_adjusted = imadjust(image2);
image3_adjusted = imadjust(image3);
image4_adjusted = imadjust(image4, [], [], []); 

%% 7. Відобразити зображення з підвищеною контрастністю на екрані ПК.
figure;
subplot(2,2,1); imshow(image1_adjusted); title('Adjusted Peppers (Grayscale)');
subplot(2,2,2); imshow(image2_adjusted); title('Adjusted Cameraman');
subplot(2,2,3); imshow(image3_adjusted); title('Adjusted Earth');
subplot(2,2,4); imshow(image4_adjusted); title('Adjusted Your Image');

%% 8. Відобразити негатив зображення I.
figure;
subplot(2,2,1); imshow(imcomplement(image1)); title('Negative of Peppers');
subplot(2,2,2); imshow(imcomplement(image2)); title('Negative of Cameraman');
subplot(2,2,3); imshow(imcomplement(image3)); title('Negative of Coins');
subplot(2,2,4); imshow(imcomplement(image4)); title('Negative of Your Image');

% Зберегти негативи зображень у вказану папку
imwrite(imcomplement(image1), 'C:\MATLAB\lab1_kodrianu\Negative_Pictures\negative_peppers.jpg', 'JPEG');
imwrite(imcomplement(image2), 'C:\MATLAB\lab1_kodrianu\Negative_Pictures\negative_cameraman.jpg', 'JPEG');
imwrite(imcomplement(image3), 'C:\MATLAB\lab1_kodrianu\Negative_Pictures\negative_coins.jpg', 'JPEG');
imwrite(imcomplement(image4), 'C:\MATLAB\lab1_kodrianu\Negative_Pictures\negative_your_image.jpg', 'JPEG');

%% 9. З використанням Help MATLAB ознайомитися більш детально з особливостями процедури контрастування зображень imadjust.
doc imadjust

%% 10. Відповісти на наступні питання:
%-	що таке “гістограма розподілу яскравостей”?
%-	що таке “контрастність зображення”?
%-	як при контрастуванні змінюється гістограма розподілу яскравостей зображення?
%-	як за необхідності зменшити контрастність зображення?
%-	як одержати негативне зображення?

%% Відповіді:

%1. Гістограма розподілу яскравостей - це графічне представлення кількості 
% пікселів у зображенні залежно від їхніх значень яскравості. 
% Вона показує, скільки пікселів мають певне значення яскравості.

%2. Контрастність зображення - це міра різниці між найтемнішими 
% і найсвітлішими областями зображення. Висока контрастність означає 
% широкий діапазон значень яскравості, а низька - обмежений.

%3. Після контрастування гістограма розподілу яскравостей зображення 
% розтягується від мінімального до максимального значення, 
% що робить зображення більш контрастним.

%4. Щоб зменшити контрастність зображення, можна застосувати методи згладжування,
% такі як розмиття або розрідження гістограми, щоб зменшити різницю між 
% найсвітлішими і найтемнішими областями.

%5. Негативне зображення можна отримати, інвертуючи значення яскравості 
% кожного пікселя: якщо піксель мав значення 0, то стане 255, якщо 255, 
% то стане 0, а всі інші значення між ними також інвертуються.

