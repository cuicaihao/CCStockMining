% Stock Mining Program.
% Auther : C.Cui, D.Wang, M.Li
% Time : 7/05/2015
% ------------------------------------------------------------------------
% version : 1.0 Beta
% Copyright (C) 2015 Caihao Cui - All Rights Reserved
% You may use, distribute and modify this code under the
% terms of the MIT license.
% ------------------------------------------------------------------------
clc;clear;close all;

disp('********************************************************************')
disp('****************************** WARNING  ****************************')
disp('Stock Market has high rish for investment.');
disp('Anyone who make decisions based on this program should be cautious!');
disp('Auhtors take no responsibility of any loss of the users!');
disp('You may use, distribute and modify this code under the');
disp('terms of the MIT license.');
disp('********************************************************************')


datatype = 'w';% d w m 
timewindow = 30; % number for time serious timewindow*datatype < backtime
backtime = 360; % days
Number = 0; % how mang stock form the CStock.csv will be downloaded.

run('CCStockMining/StockMining.m');