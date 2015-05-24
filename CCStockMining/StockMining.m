% StockMining search project
% 
% Author: C.CUI, J.Wang, M.Li
% TIme: 04/05/2015
% note: add your idear
% clc;
% clear;
% close all;
%%
load('CStock.mat');
fprintf('Start Time:');
disp(datetime('now','TimeZone','local','Format','d-MMM-y HH:mm:ss'));
disp('-------------Stocking Mining software beta 1.0----------------------');

% datatype = 'w';% d w m 
% timewindow = 20; % number for time serious timewindow*datatype < backtime
% backtime = 150; % days
% Number = 0; % how mang stock form the CStock.csv will be downloaded.

% if number == 0 means full stock will be updated.
if Number > length(CStock) || Number == 0
    Number = length(CStock);
end
switch datatype
    case 'd'
        if timewindow > backtime
           timewindow = backtime;
        end
    case 'w' 
        if timewindow*7 > backtime
           timewindow = floor(backtime/7);
        end
    case 'm'
        if timewindow*7 > backtime
           timewindow = floor(backtime/7);
        end
    otherwise
        disp('Something is wrong!');
        exit;
end
%% Process
disp(' ');
s = input('Do you want to update the data?\n Yes/No:  ','s');
if strcmpi(s,'yes')
    disp('Starting update the data...')
    CC_Download_StockData;
    CC_RUN_StockData;
elseif strcmpi(s,'no')
    CC_RUN_StockData;
end
fprintf('End Time:');
disp(datetime('now','TimeZone','local','Format','d-MMM-y HH:mm:ss'));