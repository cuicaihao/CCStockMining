% Download all the Stock Market Data for Analysis
% Author Caihao CUI
% Time 1/05/2015
% clear;
close all;
%load('CStock.mat');
%DEBUG = true;
DEBUG = false;
% how many rows you want from the CStock list, for debug I use 100
% Number = 100;
%datatype = 'd';% d w m 

%backtime = 100;

% '00xxxx' and '30xxxx' SZ
% '60xxxx' SS
if DEBUG % debug/testing mode
%% Test the Download Function 
% Take one name list from the CStock list
    A_Stock = CC_OneStock;
    %A_Stock.Index = 1428;% 'SZ'
    A_Stock.Index = 956;% 'SS'
    stockNameS1 = CStock{A_Stock.Index,2};
    if strcmp(stockNameS1(1),'6')
        stockNameS2 = '.SS';
    else
        stockNameS2 = '.SZ';
    end
    A_Stock.Name = strcat(stockNameS1,stockNameS2);
    A_Stock.CName = CStock{A_Stock.Index,3};
    % today : return with a number of the days
    A_Stock.StartDate = today - backtime;
    A_Stock.EndDate = today;
    A_Stock.Freq = datatype;
    [DataYahoo,Date_datenum , ~]=CC_YahooData(A_Stock.Name, A_Stock.StartDate, A_Stock.EndDate, A_Stock.Freq);
    A_Stock.Data = DataYahoo;
    A_Stock.Date_datenum = Date_datenum;
    % Save the Data.
    f = fopen([A_Stock.Name,'.txt'],'w');
    for i = 1:size(DataYahoo,1)
    fprintf(f,'%10d\t%5.5f\t%5.5f\t%5.5f\t%5.5f\t%5.5f\t%5.5f\t\n', DataYahoo(i,:)); 
    end
    fclose(f);

else % runing code 
% search all the stock market
% Download all the data
    tic;
    A_Stock = CC_InitStock(Number);
    fprintf('%10s\t%10s\t%10s\t%10s\t\n','Progress:','Index','Number','Name');
    for k = 1:Number;
        A_Stock(k).Index = k;
        stockNameS1 = CStock{A_Stock(k).Index,2};
        if strcmp(stockNameS1(1),'6')
            stockNameS2 = '.SS';
        else
            stockNameS2 = '.SZ';
        end
        A_Stock(k).Name = strcat(stockNameS1,stockNameS2);
        A_Stock(k).CName = CStock{A_Stock(k).Index,3};
        % today : return with a number of the days
        A_Stock(k).StartDate = today - backtime;
        A_Stock(k).EndDate = today;
        A_Stock(k).Freq = datatype;% week
        [DataYahoo, Date_datenum, Head]=CC_YahooData(A_Stock(k).Name, A_Stock(k).StartDate, A_Stock(k).EndDate, A_Stock(k).Freq);
        pause(0.01);
        A_Stock(k).Data = DataYahoo;
        A_Stock(k).Date_datenum = Date_datenum;     
        % Save the Data.  
        file = strcat('./StockData/',A_Stock(k).Name,'.txt');
        %f = fopen([A_Stock(k).Name,'.txt'],'w');
        f = fopen(file,'w');
        for i = 1:size(DataYahoo,1)
            fprintf(f,'%10d\t%5.5f\t%5.5f\t%5.5f\t%5.5f\t%5.5f\t%5.5f\t\n', DataYahoo(i,:)); 
        end
        fclose(f); 
        
%         file = './StockData/';
%         datanames = strcat(A_Stock(k).Name,'.txt');
%         movefile(datanames,file);
        %clc
        fprintf('%10.2f%%\t%10d\t%10s\t%10s\t\n',k*100/Number,k, A_Stock(k).Name, A_Stock(k).CName);
        %disp(['Download Data:',num2str(k),A_Stock(k).Name, A_Stock(k).CName]);
    end
    t=toc;
    fprintf('Update Data cost %10.2f minutes\n',t/60);
    save('StockSample.mat','A_Stock');
end
disp('PASS..');














