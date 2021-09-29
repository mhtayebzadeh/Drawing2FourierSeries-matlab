
function varargout = test23(varargin)
% TEST23 MATLAB code for test23.fig
%      TEST23, by itself, creates a new TEST23 or raises the existing
%      singleton*.
%
%      H = TEST23 returns the handle to a new TEST23 or the handle to
%      the existing singleton*.
%
%      TEST23('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEST23.M with the given input arguments.
%
%      TEST23('Property','Value',...) creates a new TEST23 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before test23_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to test23_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help test23

% Last Modified by GUIDE v2.5 25-Nov-2017 20:46:02

% Begin initialization code - DO NOT EDIT


gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @test23_OpeningFcn, ...
                   'gui_OutputFcn',  @test23_OutputFcn, ...
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


% --- Executes just before test23 is made visible.
function test23_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to test23 (see VARARGIN)

% Choose default command line output for test23
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes test23 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = test23_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in button.
function button_Callback(hObject, eventdata, handles)
% hObject    handle to button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.ax1);
set(handles.ax1,'xlim',[-1,1]);
global min_val max_val xy a
a=0;
xy= zeros(3,2001);
xy(1,:)=-1:0.001:1;
min_val=str2double(get(handles.edit1,'string'));
max_val=str2double(get(handles.edit2,'string'));
if isnumeric(max_val)&& isnumeric(min_val) && (min_val<max_val)
    set(handles.ax1,'ylim',[min_val,max_val]);
    set(handles.ax1,'Visible','On')
    set(handles.button2,'Visible','On')
    set(handles.edit3,'Visible','On')
    
    set(gcf,'windowbuttonmotionfcn',@draw);
    set(gcf,'windowbuttondownfcn',@check);
    set(gcf,'Pointer','crosshair','doublebuffer','on');
    set(handles.text2,'Visible','On')
    cla;

else
    msgbox('Try again !')
end


function draw(varargin)
    loc=get(gca,'currentpoint');
    x=loc(1,1);
    y=loc(1,2);
    global a min_val max_val xy
    if a==1
        if (x>=-1)&&(x<=1)&&(y>=min_val)&&(y<=max_val)
            hold on
            plot(gca,x,y,'*')
            for i=1:2001
                if (x<=(xy(1,i)))
                    i=i-1;
                    yy=y+xy(3,i)*xy(2,i);
                    xy(3,i)=xy(3,i)+1;
                    xy(2,i)=yy/xy(3,i);
                    break;
                end
            end
        end
    end
function check(varargin)
    global a
    if(strcmp(get(gcf,'SelectionType'),'open'))
        a=1;
    else
        a=0;
    end


% --- Executes during object creation, after setting all properties.
function button_CreateFcn(hObject, eventdata, handles)
% hObject    handle to button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global ii;
ii=0;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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


% --- Executes on button press in button2.
function button2_Callback(hObject, eventdata, handles)
% hObject    handle to button2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.ax2,'Visible','On')

axes(handles.ax2)
set(gcf,'windowbuttonmotionfcn',@d);
set(gcf,'windowbuttondownfcn',@dd);
set(gcf,'Pointer','crosshair','doublebuffer','on');
cla;
global xy min_val max_val

n = nnz(xy(3,:))% returns the number of nonzero elements in matrix X.
x=zeros(1,n);
y=zeros(1,n);
j=0;
for i=1:2001
    if xy(3,i)~=0
        j=j+1;
        x(j)=xy(1,i);
        y(j)=xy(2,i);
    end
end
plot(x,y)
% % % % % % % % % % % % % % % % % % 
n_max=round(n/4-2);
n_max=round(str2double(get(handles.edit3,'string')));

    b=zeros(2*n_max+1,1);
    z=[ones(n,1)];
    for i=1:n_max
        z=[z sin(i*pi*x')];
    end
    for i=1:n_max
        z=[z cos(i*pi*x')];
    end
    b=(z'*z)\(z'*y');
    y2=(z*b)';
    
    hold on
    plot(x,y2)
    set(handles.a_0,'string',mat2str(b(1),6))
    set(handles.sin_text,'string',mat2str(b(2:n_max+1),4))
    set(handles.cos_text,'string',mat2str(b(n_max+2:2*n_max+1),4))
% % % % % % % % % % % % % % % % % % 
set(handles.ax2,'xlim',[-1,1]);
set(handles.ax2,'ylim',[min_val,max_val]);
    

function d(varargin) 

function dd(varargin) 



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
clc;
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on mouse press over axes background.
function ax1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to ax1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on mouse press over axes background.
function ax2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to ax1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function ax1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ax1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate ax1
grid on

% --- Executes during object creation, after setting all properties.
function ax2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ax2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate ax2
ax2.grid = 'On'
grid On
