clear ;org=imread('G:\IMD003.jpg');
org=imresize(org,[256 256]);
noisy= imnoise(org,'gaussian',0,0.001);%  % add noise of mean 0, variance 0.005

% start of calling normal shrink denoising algorithm

ns_r = normal_shrink(noisy(:,:,1)); 
ns_g = normal_shrink(noisy(:,:,2));
ns_b = normal_shrink(noisy(:,:,3));
ns_r= uint8(ns_r);
ns_g= uint8(ns_g);
ns_b= uint8(ns_b);
ns = cat(3, ns_r, ns_g, ns_b);

% end of calling normal shrink denoising algorithm

% start of calling bilateral filter

ns2gray = rgb2gray(ns);
ns2gray = double(ns2gray);
B = bilateral(ns2gray);


% end of calling bilateral filter



% start of threshold based segmentation

%ostu threshold
ostu_img = ostu(B);
figure;imshow(ostu_img,[]),title('ostu');

% end of threshold based segmentation

% kmeans clustering
figure;
 [k, class, img_vect]= kmeans(ostu_img, 5);
 for clust = 1:k
    cluster = reshape(class(1:length(img_vect),clust:clust), [256,256] );
    subplot(1,k,clust), imshow(cluster,[]), title('k-means cluster ');
 end

 