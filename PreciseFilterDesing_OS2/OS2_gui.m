function varargout = OS2_gui(varargin)
% OS2_GUI MATLAB code for OS2_gui.fig
%      OS2_GUI, by itself, creates a new OS2_GUI or raises the existing
%      singleton*.
%
%      H = OS2_GUI returns the handle to a new OS2_GUI or the handle to
%      the existing singleton*.
%
%      OS2_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OS2_GUI.M with the given input arguments.
%
%      OS2_GUI('Property','Value',...) creates a new OS2_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before OS2_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to OS2_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help OS2_gui

% Last Modified by GUIDE v2.5 04-Jul-2017 20:48:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @OS2_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @OS2_gui_OutputFcn, ...
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


% --- Executes just before OS2_gui is made visible.
function OS2_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to OS2_gui (see VARARGIN)

% Choose default command line output for OS2_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes OS2_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = OS2_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in analogFilterChooser.
function analogFilterChooser_Callback(hObject, eventdata, handles)
% hObject    handle to analogFilterChooser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
analogType=get(handles.analogFilterChooser,'Value');
if (analogType==1)
    set(handles.passbandRipple,'Enable','on');
    set(handles.stopbandRipple,'Enable','on');
elseif(analogType==2)
     set(handles.passbandRipple,'Enable','on');
    set(handles.stopbandRipple,'Enable','off');
elseif(analogType==3)
     set(handles.passbandRipple,'Enable','off');
    set(handles.stopbandRipple,'Enable','on');
elseif(analogType==4)
     set(handles.passbandRipple,'Enable','off');
    set(handles.stopbandRipple,'Enable','off');
end;

% Hints: contents = cellstr(get(hObject,'String')) returns analogFilterChooser contents as cell array
%        contents{get(hObject,'Value')} returns selected item from analogFilterChooser


% --- Executes during object creation, after setting all properties.
function analogFilterChooser_CreateFcn(hObject, eventdata, handles)
% hObject    handle to analogFilterChooser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function analogFilterOrder_Callback(hObject, eventdata, handles)
% hObject    handle to analogFilterOrder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.analogFilterOrder,'BackgroundColor','red');
set(handles.filterExist,'Value',0);
set(handles.aproxFilterExist,'Value',0);
set(handles.denominator,'BackgroundColor','red');
set(handles.numerator,'BackgroundColor','red');
set(handles.inputOutput,'BackgroundColor','red');
set(handles.samplingFrequency,'BackgroundColor','red');
% Hints: get(hObject,'String') returns contents of analogFilterOrder as text
%        str2double(get(hObject,'String')) returns contents of analogFilterOrder as a double


% --- Executes during object creation, after setting all properties.
function analogFilterOrder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to analogFilterOrder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function passbandRipple_Callback(hObject, eventdata, handles)
% hObject    handle to passbandRipple (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.passbandRipple,'BackgroundColor','red');
set(handles.filterExist,'Value',0);
set(handles.aproxFilterExist,'Value',0);
set(handles.denominator,'BackgroundColor','red');
set(handles.numerator,'BackgroundColor','red');
set(handles.inputOutput,'BackgroundColor','red');
set(handles.samplingFrequency,'BackgroundColor','red');
% Hints: get(hObject,'String') returns contents of passbandRipple as text
%        str2double(get(hObject,'String')) returns contents of passbandRipple as a double


% --- Executes during object creation, after setting all properties.
function passbandRipple_CreateFcn(hObject, eventdata, handles)
% hObject    handle to passbandRipple (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function stopbandRipple_Callback(hObject, eventdata, handles)
% hObject    handle to stopbandRipple (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.stopbandRipple,'BackgroundColor','red');
set(handles.filterExist,'Value',0);
set(handles.aproxFilterExist,'Value',0);
set(handles.denominator,'BackgroundColor','red');
set(handles.numerator,'BackgroundColor','red');
set(handles.inputOutput,'BackgroundColor','red');
set(handles.samplingFrequency,'BackgroundColor','red');
% Hints: get(hObject,'String') returns contents of stopbandRipple as text
%        str2double(get(hObject,'String')) returns contents of stopbandRipple as a double


% --- Executes during object creation, after setting all properties.
function stopbandRipple_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stopbandRipple (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in typeFilterChooser.
function typeFilterChooser_Callback(hObject, eventdata, handles)
% hObject    handle to typeFilterChooser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filterType=get(handles.typeFilterChooser,'Value');
if (filterType==1)
    set(handles.freq1,'Enable','on');
    set(handles.freq2,'Enable','on');
elseif(filterType==2)
     set(handles.freq1,'Enable','on');
    set(handles.freq2,'Enable','on');
elseif(filterType==3)
     set(handles.freq1,'Enable','on');
    set(handles.freq2,'Enable','off');
elseif(filterType==4)
     set(handles.freq1,'Enable','on');
    set(handles.freq2,'Enable','off');
end;
% Hints: contents = cellstr(get(hObject,'String')) returns typeFilterChooser contents as cell array
%        contents{get(hObject,'Value')} returns selected item from typeFilterChooser


% --- Executes during object creation, after setting all properties.
function typeFilterChooser_CreateFcn(hObject, eventdata, handles)
% hObject    handle to typeFilterChooser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function freq1_Callback(hObject, eventdata, handles)
% hObject    handle to freq1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of freq1 as text
%        str2double(get(hObject,'String')) returns contents of freq1 as a double
set(handles.freq1,'BackgroundColor','red');
set(handles.filterExist,'Value',0);
set(handles.aproxFilterExist,'Value',0);
set(handles.denominator,'BackgroundColor','red');
set(handles.numerator,'BackgroundColor','red');
set(handles.inputOutput,'BackgroundColor','red');
set(handles.samplingFrequency,'BackgroundColor','red');


% --- Executes during object creation, after setting all properties.
function freq1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freq1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function freq2_Callback(hObject, eventdata, handles)
% hObject    handle to freq2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.freq2,'BackgroundColor','red');
set(handles.filterExist,'Value',0);
set(handles.aproxFilterExist,'Value',0);
set(handles.denominator,'BackgroundColor','red');
set(handles.numerator,'BackgroundColor','red');
set(handles.inputOutput,'BackgroundColor','red');
set(handles.samplingFrequency,'BackgroundColor','red');
% Hints: get(hObject,'String') returns contents of freq2 as text
%        str2double(get(hObject,'String')) returns contents of freq2 as a double


% --- Executes during object creation, after setting all properties.
function freq2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freq2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in createFilter.
function createFilter_Callback(hObject, eventdata, handles)
% hObject    handle to createFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function denominator_Callback(hObject, eventdata, handles)
% hObject    handle to denominator (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.denominator,'BackgroundColor','red');
set(handles.aproxFilterExist,'Value',0);
% Hints: get(hObject,'String') returns contents of denominator as text
%        str2double(get(hObject,'String')) returns contents of denominator as a double


% --- Executes during object creation, after setting all properties.
function denominator_CreateFcn(hObject, eventdata, handles)
% hObject    handle to denominator (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function numerator_Callback(hObject, eventdata, handles)
% hObject    handle to numerator (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.numerator,'BackgroundColor','red');
set(handles.aproxFilterExist,'Value',0);
% Hints: get(hObject,'String') returns contents of numerator as text
%        str2double(get(hObject,'String')) returns contents of numerator as a double


% --- Executes during object creation, after setting all properties.
function numerator_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numerator (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inputOutput_Callback(hObject, eventdata, handles)
% hObject    handle to inputOutput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.inputOutput,'BackgroundColor','red');
set(handles.aproxFilterExist,'Value',0);
% Hints: get(hObject,'String') returns contents of inputOutput as text
%        str2double(get(hObject,'String')) returns contents of inputOutput as a double


% --- Executes during object creation, after setting all properties.
function inputOutput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputOutput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function samplingFrequency_Callback(hObject, eventdata, handles)
% hObject    handle to samplingFrequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.samplingFrequency,'BackgroundColor','red');
set(handles.aproxFilterExist,'Value',0);
% Hints: get(hObject,'String') returns contents of samplingFrequency as text
%        str2double(get(hObject,'String')) returns contents of samplingFrequency as a double


% --- Executes during object creation, after setting all properties.
function samplingFrequency_CreateFcn(hObject, eventdata, handles)
% hObject    handle to samplingFrequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fileName_Callback(hObject, eventdata, handles)
% hObject    handle to fileName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fileName as text
%        str2double(get(hObject,'String')) returns contents of fileName as a double


% --- Executes during object creation, after setting all properties.
function fileName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fileName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in saveFile.
function saveFile_Callback(hObject, eventdata, handles)
% hObject    handle to saveFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
name=get(handles.fileName,'String');
if (strcmp(name,'Name of .mat file'))
    set(handles.errorTextFile,'String','Change the name of a file!');
else
    if(length(name)>12)
        set(handles.errorTextFile,'String','Name of file is too long');
    else
        set(handles.errorTextFile,'String',' ');        
        b_found=handles.b_found;
        a_found=handles.a_found;
        coefs=[a_found; b_found];
        save(name,'coefs');
    end;
end;
% --- Executes on button press in fdlsFilter.
function fdlsFilter_Callback(hObject, eventdata, handles)
% hObject    handle to fdlsFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
D=str2num(get(handles.denominator,'String'));
N=str2num(get(handles.numerator,'String'));
M=str2num(get(handles.inputOutput,'String'));
fs=str2num(get(handles.samplingFrequency,'String'));


if(get(handles.filterExist,'Value')~=0)
    set(handles.errorText,'String',' ');
    b=handles.b;
    a=handles.a;
    [h_analog,w]=freqs(b,a,M);
    handles.h_analog=h_analog;
    guidata(hObject,handles);
    handles.w=w;
    guidata(hObject,handles);
    frequency=w/(2*pi);
    handles.frequency=frequency;
    guidata(hObject,handles);
    [b_found,a_found]=FDLS(h_analog,w,D,N,M,fs);
    handles.b_found=b_found;
    guidata(hObject,handles);
    handles.a_found=a_found;
    guidata(hObject,handles);
    %plotting
    plotOption=get(handles.plotChooser,'Value');
    
    h_found=freqz(b_found,a_found,frequency,str2num(get(handles.samplingFrequency,'String')));
    handles.h_found=h_found;
    guidata(hObject,handles);
    set(handles.denominator,'BackgroundColor','green');
    set(handles.numerator,'BackgroundColor','green');
    set(handles.inputOutput,'BackgroundColor','green');
    set(handles.samplingFrequency,'BackgroundColor','green');
    if(plotOption==3)
        semilogx(handles.freqResponse,frequency,20*log10(abs(h_found)),'r');
        hold on;
        semilogx(handles.freqResponse,frequency,20*log10(abs(h_analog)),'k');
        xlabel('f(Hz)');
        ylabel('magnitude(dB)');
        legend('FDLS','analog');
        grid;
        hold off;
    elseif(plotOption==4)
        phase_found=angle(h_found);
    for i=1:M
        while(phase_found(i) < -pi)
            phase_found(i)=phase_found(i)+2*pi;
        end;
        while(phase_found(i) > pi)
            phase_found(i)=phase_found(i)-2*pi;
        end;
    end;
    phase_found=phase_found*180/pi;
    phase=angle(h_analog);
    phase=phase*180/pi;    
    semilogx(handles.freqResponse,frequency,phase_found,'r');
    hold on;
    semilogx(handles.freqResponse,frequency,phase,'k'),legend('FDLS','analog'),ylabel('phase[degrees]'),xlabel('f[Hz]');
    grid;
    hold off;
    end;
    set(handles.aproxFilterExist,'Value',1);
else
    set(handles.errorText,'String','Make an analog filter first!');
    set(handles.aproxFilterExist,'Value',0);
end;



% --- Executes on selection change in plotChooser.
function plotChooser_Callback(hObject, eventdata, handles)
% hObject    handle to plotChooser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plotType=get(handles.plotChooser,'Value');
if(get(handles.filterExist,'Value')~=0)
h_analog=handles.h_analog;
frequency=handles.frequency;
if(plotType==1)
    plot(handles.freqResponse,abs(h_analog));
elseif(plotType==2)
    plot(handles.freqResponse,20*log10(abs(h_analog)));
elseif(plotType==3)
        if(get(handles.aproxFilterExist,'Value')~=0)
        h_found=handles.h_found;
        semilogx(handles.freqResponse,frequency,20*log10(abs(h_found)),'r');
        hold on;
        semilogx(handles.freqResponse,frequency,20*log10(abs(h_analog)),'k');
        xlabel('f(Hz)');
        ylabel('magnitude(dB)');
        legend('FDLS','analog');
        grid;
        hold off;
        else
            plot(handles.freqResponse,0);
        end;
elseif(plotType==4)
    if(get(handles.aproxFilterExist,'Value')~=0)
    h_found=handles.h_found;
    phase_found=angle(h_found);
    M=str2num(get(handles.inputOutput,'String'));
    for i=1:M
        while(phase_found(i) < -pi)
            phase_found(i)=phase_found(i)+2*pi;
        end;
        while(phase_found(i) > pi)
            phase_found(i)=phase_found(i)-2*pi;
        end;
    end;
    phase_found=phase_found*180/pi;
    phase=angle(h_analog);
    phase=phase*180/pi;
    semilogx(handles.freqResponse,frequency,phase_found,'r');
    hold on;
    semilogx(handles.freqResponse,frequency,phase,'k'),legend('FDLS','analog'),ylabel('phase[degrees]'),xlabel('f[Hz]');
    grid;
    hold off;
    else
        plot(handles.freqResponse,0);
    end;
end;
else
    plot(handles.freqResponse,0);
end;

% Hints: contents = cellstr(get(hObject,'String')) returns plotChooser contents as cell array
%        contents{get(hObject,'Value')} returns selected item from plotChooser


% --- Executes during object creation, after setting all properties.
function plotChooser_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plotChooser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in createFilterButton.
function createFilterButton_Callback(hObject, eventdata, handles)
% hObject    handle to createFilterButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
analogType=get(handles.analogFilterChooser,'Value');
n=str2num(get(handles.analogFilterOrder,'String'));
if (analogType==1)
    Rp=str2num(get(handles.passbandRipple,'String'));
    Rs=str2num(get(handles.stopbandRipple,'String'));
    [z,p,k]=ellipap(n,Rp,Rs);
elseif(analogType==2)
    Rp=str2num(get(handles.passbandRipple,'String'));
    [z,p,k]=cheb1ap(n,Rp);
elseif(analogType==3)   
    Rs=str2num(get(handles.stopbandRipple,'String'));
    [z,p,k]=cheb2ap(n,Rs);
elseif(analogType==4)
    [z,p,k]=buttap(n);
end;
[b,a]=zp2tf(z,p,k);
filterType=get(handles.typeFilterChooser,'Value');
if (filterType==1)%passband
    f1=str2num(get(handles.freq1,'String'));
    f2=str2num(get(handles.freq2,'String'));
    w1=2*pi*f1;
    w2=2*pi*f2;
    [b,a]=lp2bp(b,a,w1,w2);
elseif(filterType==2)%stopband
    f1=str2num(get(handles.freq1,'String'));
    f2=str2num(get(handles.freq2,'String'));
    w1=2*pi*f1;
    w2=2*pi*f2;
    [b,a]=lp2bs(b,a,w1,w2);
elseif(filterType==3)%low-pass
     f1=str2num(get(handles.freq1,'String'));
     w1=2*pi*f1;
     [b,a]=lp2lp(b,a,w1);
elseif(filterType==4)%high-pass
     f1=str2num(get(handles.freq1,'String'));
     w1=2*pi*f1;
     [b,a]=lp2hp(b,a,w1);
end;
handles.b=b;
guidata(hObject,handles);
handles.a=a;
guidata(hObject,handles);
M=str2num(get(handles.inputOutput,'String'));
[h,w]=freqs(b,a,M);
handles.h_analog=h;
guidata(hObject,handles);
handles.w=w;
guidata(hObject,handles);
frequency=w/(2*pi);
handles.frequency=frequency;
guidata(hObject,handles);
%plotting
plotOption=get(handles.plotChooser,'Value');
if(plotOption==1)
    plot(handles.freqResponse,abs(h));
elseif(plotOption==2)
    plot(handles.freqResponse,20*log10(abs(h)));
elseif(plotOption==3)
    plot(handles.freqResponse,0);
elseif(plotOption==4)
    plot(handles.freqResponse,0);
end;
set(handles.filterExist,'Value',1);
set(handles.aproxFilterExist,'Value',0);
set(handles.analogFilterOrder,'BackgroundColor','green');
set(handles.passbandRipple,'BackgroundColor','green');
set(handles.stopbandRipple,'BackgroundColor','green');
set(handles.freq1,'BackgroundColor','green');
set(handles.freq2,'BackgroundColor','green');
set(handles.errorText,'String',' ');
% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in filterExist.
function filterExist_Callback(hObject, eventdata, handles)
% hObject    handle to filterExist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of filterExist


% --- Executes on button press in aproxFilterExist.
function aproxFilterExist_Callback(hObject, eventdata, handles)
% hObject    handle to aproxFilterExist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of aproxFilterExist
