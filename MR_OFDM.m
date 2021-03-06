clear all
close all
clc

%% Input Parameters
opt_STF = 4; % 1, 2, 3 or 4


%% Load Data
Rates_Info = table2cell(readtable('Table_Rates_OFDM.txt'));
        
        
switch opt_STF
    case 1
        
        fid = fopen('STF_Table1.txt','r');
        Table_STF = cell2mat(textscan(fid, '', 'headerlines', 0));  
        fid=fclose(fid);  
        N=128;
        
    case 2
        
        fid = fopen('STF_Table2.txt','r');
        Table_STF = cell2mat(textscan(fid, '', 'headerlines', 0));  
        fid=fclose(fid);  
        N=64;
        
    case 3
        
        fid = fopen('STF_Table3.txt','r');
        Table_STF = cell2mat(textscan(fid, '', 'headerlines', 0));  
        fid=fclose(fid); 
        N=32;
        
    case 4
        
        fid = fopen('STF_Table4.txt','r');
        Table_STF = cell2mat(textscan(fid, '', 'headerlines', 0));  
        fid=fclose(fid); 
        N=16;
        
end


STF_Time = ifft(Table_STF(:,2),N);

for i=1:4
    switch opt_STF        
        case 1
            symbol_STF = repmat(STF_Time,10,1);
      
        case 2
            symbol_STF = repmat(STF_Time,5,1);          
            
        case 3
             symbol_STF = repmat(STF_Time,5,1);
                    
        case 4
             symbol_STF = [repmat(STF_Time,2,1); STF_Time(1:length(STF_Time/2))];                            
    end
end





