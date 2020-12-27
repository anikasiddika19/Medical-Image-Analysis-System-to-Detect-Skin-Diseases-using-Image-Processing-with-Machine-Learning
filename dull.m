im=imread('G:\IMD038.jpg');
im=rgb2gray(im);
figure,imshow(im),title('Gray image')

se = strel('disk',5);
im2=imclose(im,se);
figure,imshow(im2),title('Closing operation')

bi=imbilatfilt(im2);
figure,imshow(bi),title('Bilateral filtering')
im3=medfilt2(bi);
figure,imshow(im3),title('Median filtering')






