function varargout = comparison(varargin)
% COMPARISON MATLAB code for comparison.fig
%      COMPARISON, by itself, creates a new COMPARISON or raises the existing
%      singleton*.
%
%      H = COMPARISON returns the handle to a new COMPARISON or the handle to
%      the existing singleton*.
%
%      COMPARISON('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COMPARISON.M with the given input arguments.
%
%      COMPARISON('Property','Value',...) creates a new COMPARISON or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before comparison_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to comparison_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help comparison

% Last Modified by GUIDE v2.5 27-Dec-2019 02:51:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @comparison_OpeningFcn, ...
                   'gui_OutputFcn',  @comparison_OutputFcn, ...
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


% --- Executes just before comparison is made visible.
function comparison_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to comparison (see VARARGIN)

% Choose default command line output for comparison
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes comparison wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = comparison_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%a = read("D:".pathname(Root, "TEMP"),);
[filename,pathname]=uigetfile('*.jpg','File Selector');
name=strcat(pathname,filename);
global im1
im1=imread(name);

h1=rgb2gray(im1)
axes(handles.axes1);
imhist(h1)

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename,pathname]=uigetfile('*.jpg','File Selector');
name=strcat(pathname,filename);
global im2
im2=imread(name);
h2=rgb2gray(im2)
axes(handles.axes2);
imhist(h2)
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uigetfile('*.jpg','File Selector');
name=strcat(pathname,filename);
global im3
im3=imread(name);
h=rgb2gray(im3)
axes(handles.axes3);
imhist(h)

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uigetfile('*.jpg','File Selector');
name=strcat(pathname,filename);
global im4
im4=imread(name);
h=rgb2gray(im4)
axes(handles.axes4);
imhist(h)






% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global im1
global im2
global im3
global im4
axes(handles.axes5);

imhist(im2);
hold on
imhist(im4); 
hold on
imhist(im3);
hold on
imhist(im1);
grid on;
