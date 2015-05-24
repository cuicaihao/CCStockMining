function [Data, Date_datenum, Head]=CC_YahooData(StockName, StartDate, EndDate, Freq)

startdate=StartDate;
enddate=EndDate;

ms=num2str(str2double(datestr(startdate, 'mm'))-1);
ds=datestr(startdate, 'dd');
ys=datestr(startdate, 'yyyy');

me=num2str(str2double(datestr(enddate, 'mm'))-1);
de=datestr(enddate, 'dd');
ye=datestr(enddate, 'yyyy');

url2Read=sprintf(...
    'http://real-chart.finance.yahoo.com/table.csv?s=%s&a=%s&b=%s&c=%s&d=%s&e=%s&f=%s&g=%s&ignore=.csv', StockName, ms, ds, ys, me, de, ye, Freq);
% http://real-chart.finance.yahoo.com/table.csv?s=000001.SS&a=11&b=19&c=1990&d=04&e=2&f=2015&g=d&ignore=.csv
% http://real-chart.finance.yahoo.com/table.csv?s=000001.SS&a=11&b=19&c=1990&d=04&e=1&f=2015&g=m&ignore=.csv
% http://real-chart.finance.yahoo.com/table.csv?s=000001.SS&a=11&b=19&c=1990&d=04&e=2&f=2015&g=w&ignore=.csv

% url2Read=sprintf(...
%     'http://real-chart.finance.yahoo.com/table.csv?s=%s&a=%s&b=%s&c=%s&d=%s&e=%s&f=%s&g=%s&ignore=.csv', StockName, ms, ds, ys, me, de, ye, Freq);
% s is going to be csv file.

s = urlread_General(url2Read);

Head = 'Date Open High Low Close Volume AdjClose';
Result = textscan(s, '%s %s %s %s %s %s %s', 'delimiter',',');

temp = Result{1,1};
Date_datestr = temp(2:end);
Date_datestr = Date_datestr(end:(-1):1);

temp = Result{1,2};
temp = cellfun(@str2double, temp(2:end));
temp = temp(end:(-1):1);
Open = temp;

temp = Result{1,3};
temp = cellfun(@str2double, temp(2:end));
temp = temp(end:(-1):1);
High = temp;

temp = Result{1,4};
temp = cellfun(@str2double, temp(2:end));
temp = temp(end:(-1):1);
Low = temp;

temp = Result{1,5};
temp = cellfun(@str2double, temp(2:end));
temp = temp(end:(-1):1);
Close = temp;

temp = Result{1,6};
temp = cellfun(@str2double, temp(2:end));
temp = temp(end:(-1):1);
Volume = temp;

temp = Result{1,7};
temp = cellfun(@str2double, temp(2:end));
temp = temp(end:(-1):1);
AdjClose = temp;

Date_datenum = datenum(Date_datestr);
Date_double = str2num( datestr(Date_datenum, 'yyyymmdd') ); %#ok<ST2NM>

Data = [Date_double, Open, High, Low, Close, Volume, AdjClose];

end