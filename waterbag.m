
org=imread('G:\w4.jpg');
org=imresize(org,[256 256]);
noisy= imnoise(org,'gaussian',0,0.001);%  % add noise of mean 0, variance 0.005
%subplot(3,3,1), imshow(org,[]), title('Original Image');
%subplot(3,3,2), imshow(noisy,[]), title('Noisy Image');

% start of calling normal shrink denoising algorithm

ns_r = normal_shrink(noisy(:,:,1)); 
ns_g = normal_shrink(noisy(:,:,2));
ns_b = normal_shrink(noisy(:,:,3));
ns_r= uint8(ns_r);
ns_g= uint8(ns_g);
ns_b= uint8(ns_b);
ns = cat(3, ns_r, ns_g, ns_b);
%subplot(3,3,4), imshow(ns,[]), title('normal shrink');

% end of calling normal shrink denoising algorithm

% start of calling bilateral filter

ns2gray = rgb2gray(ns);
ns2gray = double(ns2gray);
B = bilateral(ns2gray);
%subplot(3,3,5), imshow(B,[]), title('bilateral');

% end of calling bilateral filter

%enhanced image
enha_imadj = imadjust(uint8(B));
enha_histeq = histeq(uint8(B));
enha_adapthisteq = adapthisteq(uint8(B));

% start of edge based segmentation

%kirsch operator
kris = krisch(B);
%subplot(3,3,7), imshow(kris,[]), title('krisch');
%extended kirsch operator
kris55 = krisch55(B);
%subplot(3,3,8), imshow(kris55,[]), title('krisch55');
%extended sobel operator
sob55 = sobel55(B);
%subplot(3,3,9), imshow(sob55,[]), title('sobel 5*5');
figure,imshow(sob55,[])

% end of  edge based segmentation



