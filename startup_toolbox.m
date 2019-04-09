disp('Indy Toolbox: Neuromeka 2013-2019 http://www.neuromeka.com')

tboxpath = fileparts( mfilename('fullpath') );

corepath = fullfile(tboxpath, 'core');
if exist(corepath, 'dir')
    addpath(corepath);
end

srtcmdpath = fullfile(tboxpath, 'simplecommand');
if exist(srtcmdpath, 'dir')
    addpath(srtcmdpath);
end

lngcmdpath = fullfile(tboxpath, 'mediumcommand');
if exist(lngcmdpath, 'dir')
    addpath(lngcmdpath);
end

getdatapath = fullfile(tboxpath, 'getcommand');
if exist(getdatapath, 'dir')
    addpath(getdatapath);
end

excommandpath = fullfile(tboxpath, 'extendedcommand');
if exist(excommandpath, 'dir')
    addpath(excommandpath);
end

examplepath = fullfile(tboxpath, 'example');
if exist(examplepath, 'dir')
    addpath(examplepath);
end