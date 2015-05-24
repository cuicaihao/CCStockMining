% Show the results and plot the top 10 figure
%clear;
close all;
pause(1);
load('StockSample.mat')
disp('Loading the data, Start Searching...')
pause(3);
disp('--------------------------------------------------------------------');
%% Get the Stock Number 
StockNum = length(A_Stock);
% Get the Stock Rate and sort out the stock index
% timewindow = 10;
Ratelist = zeros(1,StockNum);
for i = 1:StockNum
    A_Stock(i).Rate = A_Stock(i).Search(timewindow);
    Ratelist(i) = A_Stock(i).Rate;
end
% Sort out the Top list
[~,indexlist] = sort(Ratelist,'descend');
%% save the results
switch datatype
    case 'd' 
        ResultsType = 'DayResults';
    case 'w'
        ResultsType = 'WeekResults';
    case 'm'
        ResultsType = 'MonthResults';
    otherwise
        ResultsType = 'none';
end
file = strcat('./SearchResults/',ResultsType,'.txt');
%f = fopen([A_Stock(k).Name,'.txt'],'w');
f = fopen(file,'w');
fprintf(f,'%10s\t %10s\t %10s\t %10s\n', 'Index','Code','Name','Rate');
%fprintf('%10s\t %10s\t %10s\t %10s\n', 'Index','Code','Name','Rate');
for i = 1:length(indexlist)
    fprintf(f,'%10d\t %10s\t %10s\t %10.4f\n',A_Stock(indexlist(i)).Index,...
        A_Stock(indexlist(i)).Name, A_Stock(indexlist(i)).CName,...
        A_Stock(indexlist(i)).Rate );  
%     fprintf('%10d\t %10s\t %10s\t %10.4f\n',A_Stock(indexlist(i)).Index,...
%         A_Stock(indexlist(i)).Name, A_Stock(indexlist(i)).CName,...
%         A_Stock(indexlist(i)).Rate ); 
end
fclose(f); 
%%
top =15;
disp('Display Top 15 stocks');
fprintf('%10s\t %10s\t %10s\t %10s\n', 'Index','Code','Name','Rate');
for i = 1:top
    fprintf('%10d\t %10s\t %10s\t %10.4f\n',A_Stock(indexlist(i)).Index,...
        A_Stock(indexlist(i)).Name, A_Stock(indexlist(i)).CName,...
        A_Stock(indexlist(i)).Rate ); 
end

disp('--------------------------------------------------------------------');
l= length(indexlist);
if l>0
    fprintf('Congratulation !\n Now, You have %d stocks in Database\n',length(indexlist));
    %disp('Tpye A_Stock(Index).plot() to see the result');
    Flag = true;
    s = input('Do you want to see the the plot?\n Yes/No: ','s');
    if strcmpi(s,'yes')
        while(Flag)
            clc;
disp('-------------Stocking Mining software beta 1.0----------------------');            
            disp('Display Top 15 stocks');
            fprintf('%10s\t %10s\t %10s\t %10s\n', 'Index','Code','Name','Rate');
            for i = 1:top
                fprintf('%10d\t %10s\t %10s\t %10.4f\n',A_Stock(indexlist(i)).Index,...
                A_Stock(indexlist(i)).Name, A_Stock(indexlist(i)).CName,...
                A_Stock(indexlist(i)).Rate ); 
                pause(0.01);
            end
disp('--------------------------------------------------------------------');           
            disp(' * Type Esc to quit. *')
disp('--------------------------------------------------------------------');
            ii = input('Please Typy in one Index Number:','s');
disp('--------------------------------------------------------------------');
            if strcmpi(ii,'esc')
                Flag = false;
            else
                ii = str2double(ii);
                if any(indexlist == ii)
                    A_Stock(ii).plot();
                else
                    disp('Wrong Index, Type again:');
                end
            end
        end 
    elseif strcmpi(s,'no')
disp('--------------------------------------------------------------------');       
        disp('No plots will be show.');
disp('--------------------------------------------------------------------');  
        disp('The Full Rank List is in ./SerchResults/xxx.txt.');
disp('--------------------------------------------------------------------');          
        fprintf('* Note: Type command : \t\tA_Stock(number).plot()\n* See any stock plot\n');
disp('--------------------------------------------------------------------');
    else
        disp('Wrong inputs, please type Yes/No');
    end
else
    disp('Sorry, there is no stock fit your Timetable!');
end

%% isp(indexlist); 
disp('Simulation END')
disp('--------------------------------------------------------------------');  


