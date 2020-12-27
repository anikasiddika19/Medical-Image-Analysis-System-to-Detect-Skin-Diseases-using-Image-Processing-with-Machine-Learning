rgb = imread('G:\im.jpg');
I = rgb2gray(rgb);
%imshow(I)

gmag = imgradient(I);
%imshow(gmag,[])
%title('Gradient Magnitude')

L = watershed(gmag);
Lrgb = label2rgb(L);
%figure,imshow(Lrgb),title('Watershed Transform of Gradient Magnitude')

se = strel('disk',20);
Io = imopen(I,se);
%imshow(Io),title('Opening')

se = strel('disk',20);
Io = imopen(I,se);
%imshow(Io),title('Opening')

Ie = imerode(I,se);
Iobr = imreconstruct(Ie,I);
%imshow(Iobr),title('Opening-by-Reconstruction')

Ioc = imclose(Io,se);
%imshow(Ioc),title('Opening-Closing')

Iobrd = imdilate(Iobr,se);
Iobrcbr = imreconstruct(imcomplement(Iobrd),imcomplement(Iobr));
Iobrcbr = imcomplement(Iobrcbr);
%imshow(Iobrcbr),title('Opening-Closing by Reconstruction')

fgm = imregionalmax(Iobrcbr);
%imshow(fgm),title('Regional Maxima of Opening-Closing by Reconstruction')

I2 = labeloverlay(I,fgm);
imshow(I2),title('Regional Maxima Superimposed on Original Image')