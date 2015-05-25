classdef CC_OneStock
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here  
    properties
        Index % 1,2,3,4,.... form the CStock.mat/csv
        Name  % stock number like '000123.SZ'
        CName % Chinese Name like '????'
        StartDate % digital number 
        EndDate   % digital number
        Freq  % string 'd', 'w', 'm' denotes the download tabel type
        Data  % data matrix form the web
        Date_datenum % digital number of all the rows
        Rate  % temper avariable for searching
    end
    methods
        %% Algorithm 1 by J.Wang
        function r = Search(obj, n)
            % get all the volume
            Vol= obj.Data(:,6);
            WeekNow = Vol(end);
            %  if today's volume equals to zero.
            if WeekNow == 0
                r = 0;
            else               
                % remove all the zeros values
                list= find(Vol>0);% avoid the zero value
                Vol = Vol(list,:);
                if length(Vol)<= 1% only one is out 
                    r = 0;
                    return ;
                else
                    if nargin >0 % keep in timewindow range
                        if n > length(Vol)
                            %n = length(Vol);
                            r =0;
                            return;
                        end                 
                    end
                end
                % reverse the order
                % find the stock whose volume changes most 
                Vol = Vol(end:-1:1);
                v1 = Vol(1:n-1);
                v2 = Vol(2:n);
                dv = v1./v2;
                list = find(dv >= 1); 
                if isempty(list)
                    r = 0;
                else
                    dvm = dv(list,:);
                    r =  sum(dvm)/length(dvm);
                end
            end
        end
        
        function plot(obj)
            % Plot the 1 st Figure;
            h = figure(1);
            scrsz = get(0,'ScreenSize');
            set(h,'Position',[scrsz(3)*0.55, scrsz(4)*0.6, scrsz(3)*2/5 scrsz(4)*3/10]);           
            % plot the data
            % subplot(2,1,1)
            Open = obj.Data(:,2);
            High = obj.Data(:,3);
            Low = obj.Data(:,4);
            Close = obj.Data(:,5);
            MT_candle(High,Low,Close,Open,[],obj.Date_datenum);
            xlim( [0 length(Open)+1] );                
            title([obj.Name,' : ', obj.CName]);
            % plot the volume
            % subplot(2,1,2)
            h = figure(2);
            scrsz = get(0,'ScreenSize');
            set(h,'Position',[scrsz(3)*0.55, scrsz(4)*2/15, scrsz(3)*2/5 scrsz(4)*3/10]);   
            AvgVol= obj.Data(:,6);
            bar(AvgVol);
            xlim( [0 length(Open)+1] );                
            title([obj.Name,' : ', obj.CName]);
        end
    end
    
end

