function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 30-Sep-2019 00:40:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


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
axes(handles.axes2);
imshow(im2)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global a
h=rgb2gray(a)
axes(handles.axes3);
imhist(h)


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.

function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


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

ostu_img = ostu(B);
figure;imshow(ostu_img,[]),title('Otsu Thresholding')


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



 

% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
