img = imread('G:\ul2.jpg');
%im=imresize(img, [300 300]);
gray=rgb2gray(img);
figure,imshow(gray);
I_eq= adapthisteq(gray);
figure,imshow(I_eq),title('ieq')

bw= imbinarize(I_eq, graythresh(I_eq));
figure,imshow(bw),title('bw');

%bw2 = imfill(bw,'holes');
bw3 = imopen(bw, ones(3,3));
%figure,imshow(bw3);
bw4 = bwareaopen(bw3, 20);
%figure,imshow(bw4);
bw4_perim = bwperim(bw4);
overlay1 = imoverlay(I_eq, bw4_perim, [.3 1 .3]);
figure,imshow(overlay1),title('bw_perim');


mask_em = imregionalmax(~bw4); %fgm
figure,imshow(mask_em),title('Regional Maxima');
fgm = labeloverlay(img,mask_em);
figure,imshow(fgm)
title('Regional Maxima Superimposed on Original Image')

mask_em = imclose(mask_em, ones(3,3));
%mask_em = imfill(mask_em, 'holes');
mask_em = imerode(mask_em, ones(3,3));
mask_em = bwareaopen(mask_em, 30);
overlay2 = imoverlay(I_eq, bw4_perim | mask_em, [.3 1 .3]);
figure,imshow(overlay2),title('Modified Regional Maxima');

D = bwdist(mask_em);
DL = watershed(D);
bgm = DL == 0;
figure,imshow(bgm)
title('Watershed Ridge Lines)')

gmag=imgradient(gray);
figure,imshow(gmag,[]),title('Gradient image')

gmag2 = imimposemin(gmag, bgm | mask_em);
L = watershed(gmag2);
labels = imdilate(L==0,ones(3,3)) + 2*bgm + 3*mask_em;
I4 = labeloverlay(gray,labels);
figure,imshow(I4)
title('Markers and Object Boundaries Superimposed on Original Image')

Lrgb = label2rgb(L,'jet','w','shuffle');
figure,imshow(Lrgb)
title('Colored Watershed Label Matrix')


figure
imshow(img)
hold on
himage = imshow(Lrgb);
himage.AlphaData = 0.4;
title('Colored Labels Superimposed Transparently on Original Image')



%I_eq_c = imcomplement(I_eq);
%I_mod = imimposemin(I_eq_c, ~bw4 | mask_em);
%L = watershed(I_mod);
%figure,imshow(L);
%L2=imbinarize(L);
%figure,imshow(L2);

%L2=bwareaopen(L,138);
%Lrgb=label2rgb(L);
%figure,imshow(Lrgb);

%figure, imshow(img), hold on
%himage = imshow(Lrgb);
%set(himage, 'AlphaData', 0.4);










