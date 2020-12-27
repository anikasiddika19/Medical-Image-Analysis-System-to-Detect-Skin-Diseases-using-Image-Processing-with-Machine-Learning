im=imread('G:\im2.jpg'); 
im1=rgb2gray(im);
im1=adapthisteq(im1);

figure,imshow(im1)



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
figure,imshow(mat2gray(im2));