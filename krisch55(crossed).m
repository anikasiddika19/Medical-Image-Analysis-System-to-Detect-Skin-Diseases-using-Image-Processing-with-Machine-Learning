

 function img=krisch55(i);

i=imresize(i,[256 256]);
% figure, imshow(i,[])
[r c]=size(i);
e=zeros(r+4,c+4);
for m=3:r+2
    for n=3:c+2
        e(m,n)=i(m-2,n-2);
        
    end
end
% figure, imshow(e,[])
gx=zeros(r,c);
gy=zeros(r,c);

for m=3:r+2
    for n=3:c+2
        gx(m-2,n-2)=(e(m-1,n-1)*5)+(e(m-1,n)*5)+(e(m-1,n+1)*5)+(e(m,n-1)*-3)+(e(m,n)*0)+(e(m,n+1)*-3)+(e(m+1,n-1)*-3)+(e(m+1,n)*-3)+(e(m+1,n+1)*-3)+(e(m-2,n-2)*9)+(e(m-2,n-1)*9)+(e(m-2,n)*9)+(e(m-2,n+1)*9)+(e(m-2,n+2)*9)+(e(m-1,n-2)*9)+(e(m-1,n+2)*9)+(e(m,n-2)*-7)+(e(m,n+2)*-7)+(e(m+1,n-2)*-7)+(e(m+1,n+2)*-7)+(e(m+2,n-2)*-7)+(e(m+2,n-1)*-7)+(e(m+2,n)*-7)+(e(m+2,n+1)*-7)+(e(m+2,n+2)*-7);
                    
        gy(m-2,n-2)=(e(m-1,n-1)*-3)+(e(m-1,n)*-3)+(e(m-1,n+1)*5)+(e(m,n-1)*-3)+(e(m,n)*0)+(e(m,n+1)*5)+(e(m+1,n-1)*-3)+(e(m+1,n)*-3)+(e(m+1,n+1)*5)+(e(m-2,n-2)*-7)+(e(m-2,n-1)*-7)+(e(m-2,n)*-7)+(e(m-2,n+1)*9)+(e(m-2,n+2)*9)+(e(m-1,n-2)*-7)+(e(m-1,n+2)*9)+(e(m,n-2)*-7)+(e(m,n+2)*9)+(e(m+1,n-2)*-7)+(e(m+1,n+2)*9)+(e(m+2,n-2)*-7)+(e(m+2,n-1)*-7)+(e(m+2,n)*-7)+(e(m+2,n+1)*9)+(e(m+2,n+2)*9);
        end
end
img=double((gx.^2 + gy.^2).^(0.5));