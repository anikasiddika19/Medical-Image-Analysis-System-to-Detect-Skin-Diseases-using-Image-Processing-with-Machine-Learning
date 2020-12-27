function varargout = Skin_disease_detection_system(varargin)
% SKIN_DISEASE_DETECTION_SYSTEM MATLAB code for Skin_disease_detection_system.fig
%      SKIN_DISEASE_DETECTION_SYSTEM, by itself, creates a new SKIN_DISEASE_DETECTION_SYSTEM or raises the existing
%      singleton*.
%
%      H = SKIN_DISEASE_DETECTION_SYSTEM returns the handle to a new SKIN_DISEASE_DETECTION_SYSTEM or the handle to
%      the existing singleton*.
%
%      SKIN_DISEASE_DETECTION_SYSTEM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SKIN_DISEASE_DETECTION_SYSTEM.M with the given input arguments.
%
%      SKIN_DISEASE_DETECTION_SYSTEM('Property','Value',...) creates a new SKIN_DISEASE_DETECTION_SYSTEM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Skin_disease_detection_system_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Skin_disease_detection_system_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Skin_disease_detection_system

% Last Modified by GUIDE v2.5 28-Feb-2020 13:10:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Skin_disease_detection_system_OpeningFcn, ...
                   'gui_OutputFcn',  @Skin_disease_detection_system_OutputFcn, ...
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


% --- Executes just before Skin_disease_detection_system is made visible.
function Skin_disease_detection_system_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Skin_disease_detection_system (see VARARGIN)

% Choose default command line output for Skin_disease_detection_system
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Skin_disease_detection_system wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Skin_disease_detection_system_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

run main.m
% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run query.m

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run queryforclassification.m