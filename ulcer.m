function varargout = ulcer(varargin)
% ULCER MATLAB code for ulcer.fig
%      ULCER, by itself, creates a new ULCER or raises the existing
%      singleton*.
%
%      H = ULCER returns the handle to a new ULCER or the handle to
%      the existing singleton*.
%
%      ULCER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ULCER.M with the given input arguments.
%
%      ULCER('Property','Value',...) creates a new ULCER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ulcer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ulcer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ulcer

% Last Modified by GUIDE v2.5 19-Dec-2019 23:12:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ulcer_OpeningFcn, ...
                   'gui_OutputFcn',  @ulcer_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before ulcer is made visible.
function ulcer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ulcer (see VARARGIN)

% Choose default command line output for ulcer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ulcer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ulcer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a
%img = imread('G:\ul2.jpg');
%im=imresize(img, [300 300]);
gray=rgb2gray(a);
axes(handles.axes41);
imshow(gray);

I_eq= adapthisteq(gray);
axes(handles.axes42);
imshow(I_eq);

bw= imbinarize(I_eq, graythresh(I_eq));
axes(handles.axes43);
imshow(bw);

%bw2 = imfill(bw,'holes');
bw3 = imopen(bw, ones(3,3));
%figure,imshow(bw3);
bw4 = bwareaopen(bw3, 20);
%figure,imshow(bw4);
bw4_perim = bwperim(bw4);
overlay1 = imoverlay(I_eq, bw4_perim, [.3 1 .3]);
axes(handles.axes44);
imshow(overlay1);


mask_em = imregionalmax(~bw4); %fgm
axes(handles.axes45);
imshow(mask_em);
fgm = labeloverlay(a,mask_em);
axes(handles.axes46);
imshow(fgm);

mask_em = imclose(mask_em, ones(3,3));
%mask_em = imfill(mask_em, 'holes');
mask_em = imerode(mask_em, ones(3,3));
mask_em = bwareaopen(mask_em, 30);
overlay2 = imoverlay(I_eq, bw4_perim | mask_em, [.3 1 .3]);
axes(handles.axes47);
imshow(overlay2);

D = bwdist(mask_em);
DL = watershed(D);
bgm = DL == 0;
axes(handles.axes48);
imshow(bgm);

gmag=imgradient(gray);
axes(handles.axes49);
imshow(gmag,[]);

gmag2 = imimposemin(gmag, bgm | mask_em);
L = watershed(gmag2);
labels = imdilate(L==0,ones(3,3)) + 2*bgm + 3*mask_em;
I4 = labeloverlay(gray,labels);
axes(handles.axes50);
imshow(I4);

figure,imshow(I4),title('markers and object boundaries superimposed')

label = imdilate(L==0,ones(3,3)) + 2*mask_em;
bb= imbinarize(label, graythresh(label));
figure,imshow(bb),title('Markercontrolled and clustered segmentation');

Lrgb = label2rgb(L,'jet','w','shuffle');
axes(handles.axes51);
imshow(Lrgb);


axes(handles.axes52);
imshow(a)
hold on
himage = imshow(Lrgb);
himage.AlphaData = 0.4;



im1=rgb2gray(a);
im1=adapthisteq(im1);
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






% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a
org=imresize(a,[256 256]);
org=rgb2gray(org);
%noisy= imnoise(org,'gaussian',0,0.001);%  % add noise of mean 0, variance 0.005
noisy=imnoise(org,'salt & pepper',0.02);
ns=medfilt2(noisy);
% start of calling normal shrink denoising algorithm

%ns_r = normal_shrink(noisy(:,:,1)); 
%ns_g = normal_shrink(noisy(:,:,2));
%ns_b = normal_shrink(noisy(:,:,3));
%ns_r= uint8(ns_r);
%ns_g= uint8(ns_g);
%ns_b= uint8(ns_b);
%ns = cat(3, ns_r, ns_g, ns_b);

% end of calling normal shrink denoising algorithm

% start of calling bilateral filter


ns2gray=adapthisteq(ns);
ns2gray = double(ns2gray);
B = imbilatfilt(ns2gray);


% end of calling bilateral filter



% start of threshold based segmentation

%ostu threshold
%lebel=graythresh(org);
%BW=imbinarize(org,lebel);
%figure;imshow(BW),title('Otsu Thresholding')
I = ostu(B);
%ostu_img=ostu(B)
%figure,imshow(ostu_img,[]), title
figure,imshow(I),title('Otsu Thresholding')
I=double(I);
I = reshape(I.',1,[]);
e=entropy(I);
m=mean(I);
s=std(I);
v=var(I);
k=kurtosis(I);
sk=skewness(I);
%%array te kore dile hbe
gg=graycomatrix(I);
 
 
 
 
 
 
 
 
 



% end of threshold based segmentation

% kmeans clustering
figure;
 [k, class, img_vect]= kmeans(B, 5);
 for clust = 1:k
    cluster = reshape(class(1:length(img_vect),clust:clust), [256,256] );
    subplot(1,k,clust), imshow(cluster,[]), title(['cluster ',num2str(clust)]);
 end
 
 figure;
 clust=2;
 cluster = reshape(class(1:length(img_vect),clust:clust), [256,256] );
 h = mean2(cluster);
 
 clust = 3;
 cluster = reshape(class(1:length(img_vect),clust:clust), [256,256] );
 t = mean2(cluster);
 if(h<t)
     clust=3;
    cluster = reshape(class(1:length(img_vect),clust:clust), [256,256] );
    subplot(1,3,2), imshow(cluster,[]), title('Segmented image');
 elseif(h>t)
     clust = 2;
     cluster = reshape(class(1:length(img_vect),clust:clust), [256,256] );
    subplot(1,3,2), imshow(cluster,[]), title('Segmented image');
 end

 
 
% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a
org=imresize(a,[256 256]);
org=rgb2gray(org);
%noisy= imnoise(org,'gaussian',0,0.001);%  % add noise of mean 0, variance 0.005
noisy=imnoise(org,'salt & pepper',0.02);

ns=medfilt2(noisy);
% start of calling normal shrink denoising algorithm

%ns_r = normal_shrink(noisy(:,:,1)); 
%ns_g = normal_shrink(noisy(:,:,2));
%ns_b = normal_shrink(noisy(:,:,3));
%ns_r= uint8(ns_r);
%ns_g= uint8(ns_g);
%ns_b= uint8(ns_b);
%ns = cat(3, ns_r, ns_g, ns_b);
%subplot(3,3,4), imshow(ns,[]), title('normal shrink');

% end of calling normal shrink denoising algorithm

% start of calling bilateral filter


ns2gray = double(ns);
B = imbilatfilt(ns2gray);
%subplot(3,3,5), imshow(B,[]), title('bilateral');

% end of calling bilateral filter

%enhanced image
enha_imadj = imadjust(uint8(B));
enha_histeq = histeq(uint8(B));
enha_adapthisteq = adapthisteq(uint8(B));

% start of edge based segmentation

%kirsch operator
%kris = krisch(B);
%subplot(3,3,7), imshow(kris,[]), title('krisch');
%extended kirsch operator
%kris55 = krisch55(B);
%subplot(3,3,8), imshow(kris55,[]), title('krisch55');
%extended sobel operator
sob55 = sobel55(B);
%subplot(3,3,9), imshow(sob55,[]), title('sobel 5*5');
figure,imshow(sob55,[]),title('Waterbag or pus')

% end of  edge based segmentation


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a
%a = read("D:".pathname(Root, "TEMP"),);
[filename,pathname]=uigetfile('*.jpg','File Selector');
name=strcat(pathname,filename);
a=imread(name);
axes(handles.axes1);
imshow(a);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a
%%bw=rgb2gray(a);
im2=imadjust(a,[.2 .3 0; .6 .7 1],[]);
%%im2=imadjust(a);
axes(handles.axes3);
imshow(im2)

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a
h=rgb2gray(a)
axes(handles.axes4);
imhist(h)
