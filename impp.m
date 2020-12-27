rgb = imread('G:\im.jpg');
imm=imadjust(rgb,[.2 .3 0; .6 .7 1],[]);
imshow(imm);
I = rgb2gray(imm);    
figure,imshow(I),title('gray image')

text(732,501,'Image courtesy of Corel(R)', 'FontSize',7,'HorizontalAlignment','right')
gmag = imgradient(I);
figure,imshow(gmag,[]),title('Gradient Magnitude')

se = strel('disk', 6);
Io = imopen(I, se);
figure, imshow(Io), title('Opening (Io)')

Ie = imerode(I, se);
figure,imshow(Ie),title('erosion')
Iobr = imreconstruct(Ie, I);

figure, imshow(Iobr), title('Opening-by-reconstruction (Iobr)')

Ioc = imclose(Io, se);

figure, imshow(Ioc), title('Opening-closing (Ioc)')

Iobrd = imdilate(Iobr, se);

Iobrcbr = imreconstruct(imcomplement(Iobrd), imcomplement(Iobr));

Iobrcbr = imcomplement(Iobrcbr);

figure, imshow(Iobrcbr), title('Opening-closing by reconstruction (Iobrcbr)')

fgm = imregionalmax(Iobrcbr);

figure, imshow(fgm), title('Regional maxima of opening-closing by reconstruction (fgm)')

I2 = I;

I2(fgm) = 255;

figure, imshow(I2), title('Regional maxima superimposed on original image (I2)')

se2 = strel(ones(5,5));

fgm2 = imclose(fgm, se2);

fgm3 = imerode(fgm2, se2);
fgm4 = bwareaopen(fgm3, 20);

I3 = I;

I3(fgm4) = 255;

figure, imshow(I3),title('Modified regional maxima superimposed on original image (fgm4)')

%bw = im2bw(Iobrcbr, graythresh(Iobrcbr));
bw=imbinarize(Iobrcbr);

figure, imshow(bw), title('Thresholded opening-closing by reconstruction (bw)')


imm=imadjust(rgb,[.2 .3 0; .6 .7 1],[]);

im1=rgb2gray(imm);

%imwrite(im1, 'grey.JPG');

%imshow(im1);

[x,y] = size(im1);
im2 = zeros(x,y);

for i=1:x
   for j=1:y
      if im1(i,j)< 75
          im2(i,j) = 0;
      elseif im1(i,j) < 100
          im2(i,j) = 132;
      elseif im1(i,j) < 135
          im2(i,j) = 200;
      else
          im2(i,j) = 255;
      end
   end
end

%disp(im2)
figure,imshow(mat2gray(im2)),title('boundary regioning')

%D = bwdist(bw);

DL = watershed(bw);

bgm = DL == 0;

figure, imshow(bgm), title('Watershed ridge lines (bgm)')
gradmag2 = imimposemin(gmag, bgm | fgm4);
L = watershed(gradmag2);
figure,imshow(L),title('L')

I4 = I;

I4(imdilate(L == 0, ones(3, 3)) | bgm | fgm4) = 255;

figure, imshow(I4)

title('Markers and object boundaries superimposed on original image (I4)')

Lrgb = label2rgb(L, 'jet', 'w', 'shuffle');

figure, imshow(Lrgb)

title('Colored watershed label matrix (Lrgb)')
figure, imshow(I), hold on

himage = imshow(Lrgb);

set(himage, 'AlphaData', 0.3);

title('Lrgb superimposed transparently on original image')

