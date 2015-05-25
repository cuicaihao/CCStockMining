# CCStockMining
**StockMining Framework of CHINA by Caihao Cui**
**Time: 25-May-2015 **

This beta version project using Matlab Scripts is a framework to develop algorithms/methods for finding a good prediction of stock markets in China.
It using data from Yahoo Finance websit, one could update all the data using very basic commands, saving a lot of time try to get the raw data.

It contains 2272 stocks like ***'00XXXX','30XXXX' and '60XXXX'***. 
One could change the stock list in **CStock.mat** in matlab.

## Code Structure

***StockMining.m***

This is the top file, change the datatype to update the data for your methods.

* d = day
* w = week
* m = month
* timewindow = how many data you will use in your algorithm.
* backtime = how many days of the stock data you want to download.
* Number = how many stock you want to update in the list. 0 denotes all the stocks.

In the ***CCStockMining*** folder, there are three subfolders, ***StockData*** keep all the downloaded data in txt files, you could using these files for all the other programming tools to process the data. ***SearchResult*** folder save the original methods results. You can change the method in **CC_OneStock**.

It is a matlab class file keep the data and the methods. One could change the ***search*** method to see if they could get a better results for the prediciton.


The Urlreadwrite function is provided by
 
* Matthew J. Simoneau, June 2005
* Sharath Prabhal,     September 2012
* Copyright 1984-2012 The MathWorks, Inc.
* This function requires Java.

Thanks a lot for making all of these easier.
##Example
In matlab, change the path to the folder and type 

```
>>StockMining
```
Then you will see as follows:

```
********************************************************************
****************************** WARNING  ****************************
Stock Market has high rish for investment.
Anyone who make decisions based on this program should be cautious!
Auhtors take no responsibility of any loss of the users!
You may use, distribute and modify this code under the
terms of the MIT license.
********************************************************************
Start Time:   25-May-2015 10:49:37

-------------Stocking Mining software beta 1.0----------------------
 
Do you want to update the data?
 Yes/No:  
 
```

If you type 'Yes', the program will running like this, if you type 'no' the program will skip the download the section and jump to the search part. You could change your methods and repeat this process to debug.

```
-------------Stocking Mining software beta 1.0----------------------
 
Do you want to update the data?
 Yes/No:  Yes
Starting update the data...
 Progress:	     Index	    Number	      Name	
      0.04%	         1	 000001.SZ	      深发展Ａ	
      0.09%	         2	 000002.SZ	      万 科Ａ	
      0.13%	         3	 000004.SZ	      国农科技	
      0.18%	         4	 000005.SZ	      世纪星源	
      0.22%	         5	 000006.SZ	      深振业Ａ	
      0.26%	         6	 000007.SZ	      零七股份	
      0.31%	         7	 000008.SZ	     ST宝利来	
      0.35%	         8	 000009.SZ	      中国宝安	
      0.40%	         9	 000010.SZ	    S ST华新	
      0.44%	        10	 000011.SZ	      深物业A	
      0.48%	        11	 000012.SZ	      南 玻Ａ	
      0.53%	        12	 000014.SZ	      沙河股份	
      0.57%	        13	 000016.SZ	      深康佳Ａ	
      0.62%	        14	 000017.SZ	    *ST中华A	
      0.66%	        15	 000018.SZ	     ST中冠A	
      0.70%	        16	 000019.SZ	      深深宝Ａ	
      0.75%	        17	 000020.SZ	      深华发Ａ	   
      ......
```

After the downloading is over, it will automatically run the **search** method, and show you the top 15 stocks you find by this methods. All the rank result of 2272 stocks will be found in ***SearchResults/WeekResults.txt ( DayResults.txt or MonthResults.txt)***.

```
     99.96%	      2271	 603123.SS	      翠微股份	
    100.00%	      2272	 603333.SS	      明星电缆	
Update Data cost       9.81 minutes
PASS..
Loading the data, Start Searching...
--------------------------------------------------------------------
Display Top 15 stocks
     Index	       Code	       Name	       Rate
        80	  000410.SZ	       沈阳机床	    81.7811
       204	  000636.SZ	       风华高科	    77.0234
       755	  002312.SZ	       三泰电子	    74.6944
      1142	  300030.SZ	       阳普医疗	    73.5230
      1165	  300053.SZ	        欧比特	    60.6409
       357	  000887.SZ	       中鼎股份	    59.1219
      1192	  300081.SZ	       恒信移动	    55.7903
      1312	  300201.SZ	        海伦哲	    54.4254
      1184	  300073.SZ	       当升科技	    52.7676
       384	  000920.SZ	       南方汇通	    51.0239
      1427	  300316.SZ	        N晶盛	    49.1928
      1075	  002637.SZ	       赞宇科技	    46.9206
      1990	  600745.SS	       中茵股份	    46.1568
       671	  002227.SZ	      奥 特 迅	    40.5625
       482	  002037.SZ	       久联发展	    40.1901
--------------------------------------------------------------------
Congratulation !
 Now, You have 2272 stocks in Database
Do you want to see the the plot?
 Yes/No: 

```

If you want to see the plot of your prefered stock, type 'Yes':
(Thanks LiYang for providing **MT_candle** function, Email:farutoliyang@gmail.com.)

```
-------------Stocking Mining software beta 1.0----------------------
Display Top 15 stocks
     Index	       Code	       Name	       Rate
        80	  000410.SZ	       沈阳机床	    81.7811
       204	  000636.SZ	       风华高科	    77.0234
       755	  002312.SZ	       三泰电子	    74.6944
      1142	  300030.SZ	       阳普医疗	    73.5230
      1165	  300053.SZ	        欧比特	    60.6409
       357	  000887.SZ	       中鼎股份	    59.1219
      1192	  300081.SZ	       恒信移动	    55.7903
      1312	  300201.SZ	        海伦哲	    54.4254
      1184	  300073.SZ	       当升科技	    52.7676
       384	  000920.SZ	       南方汇通	    51.0239
      1427	  300316.SZ	        N晶盛	    49.1928
      1075	  002637.SZ	       赞宇科技	    46.9206
      1990	  600745.SS	       中茵股份	    46.1568
       671	  002227.SZ	      奥 特 迅	    40.5625
       482	  002037.SZ	       久联发展	    40.1901
--------------------------------------------------------------------
 * Type Esc to quit. *
--------------------------------------------------------------------
Please Typy in one Index Number:
```

Then you are asked for the ***index number***, type a number form the top list, you will see two figures showing all the data on the right side of your screen.

Then you could choose another number or just to type 'Esc' to quit the program.

```
      1990	  600745.SS	       中茵股份	    46.1568
       671	  002227.SZ	      奥 特 迅	    40.5625
       482	  002037.SZ	       久联发展	    40.1901
--------------------------------------------------------------------
 * Type Esc to quit. *
--------------------------------------------------------------------
Please Typy in one Index Number:Esc
--------------------------------------------------------------------
Simulation END
--------------------------------------------------------------------
End Time:   25-May-2015 11:06:10
```

All the stock data is in ***StockSample.mat***, if you want to move it or use it for all the other purposes. 


** Edit Time : Mon 25 May 11:14:05 a.m. in Melbourne AU. **
