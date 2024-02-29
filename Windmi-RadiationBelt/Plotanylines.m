% fileName = 'RBSPA_REL03_ECT-REPT-SCI-L2_5447.txt'
% array = load(fileName);
% array_of_data = load(fileName);
load Flux.mat 
load GOES_40_data.mat
load GOES_75_data.mat
load GOES_150_data.mat 
load GOES_275_data.mat
load GOES_475_data.mat
%load Flux4.mat


array_of_data = Flux_data;
size_of_array = size(array_of_data);
columnCount = size_of_array(2);
PlotArray = [];
for index = 3:columnCount
    CleanArray = Convert_Nans_to_Average(array_of_data(:,index));
    PlotArray = [PlotArray CleanArray];
end
array_of_data = GOES_40_data;
size_of_array = size(array_of_data);
columnCount = size_of_array(2);
GOES40PlotArray = [];
for index = 3:columnCount
    CleanArray = Convert_Nans_to_Average(array_of_data(:,index));
    GOES40PlotArray = [GOES40PlotArray CleanArray];
end
array_of_data = GOES_75_data;
size_of_array = size(array_of_data);
columnCount = size_of_array(2);
GOES75PlotArray = [];
for index = 3:columnCount
    CleanArray = Convert_Nans_to_Average(array_of_data(:,index));
    GOES75PlotArray = [GOES75PlotArray CleanArray];
end
array_of_data = GOES_150_data;
size_of_array = size(array_of_data);
columnCount = size_of_array(2);
GOES150PlotArray = [];
for index = 3:columnCount
    CleanArray = Convert_Nans_to_Average(array_of_data(:,index));
    GOES150PlotArray = [GOES150PlotArray CleanArray];
end
array_of_data = GOES_275_data;
size_of_array = size(array_of_data);
columnCount = size_of_array(2);
GOES275PlotArray = [];
for index = 3:columnCount
    CleanArray = Convert_Nans_to_Average(array_of_data(:,index));
    GOES275PlotArray = [GOES275PlotArray CleanArray];
end
array_of_data = GOES_475_data;
size_of_array = size(array_of_data);
columnCount = size_of_array(2);
GOES475PlotArray = [];
for index = 3:columnCount
    CleanArray = Convert_Nans_to_Average(array_of_data(:,index));
    GOES475PlotArray = [GOES475PlotArray CleanArray];
end
% array_of_data = Flux_data4;
% size_of_array = size(array_of_data);
% columnCount = size_of_array(2);
% PlotArray4 = [];
% for index = 3:columnCount
%     CleanArray = Convert_Nans_to_Average(array_of_data(:,index));
%     PlotArray4 = [PlotArray4 CleanArray];
% end
save clean_GOES_40.mat GOES40PlotArray
save clean_GOES_75.mat GOES75PlotArray
save clean_GOES_150.mat GOES150PlotArray
save clean_GOES_275.mat GOES275PlotArray
save clean_GOES_475.mat GOES475PlotArray
save clean_RBSP.mat PlotArray
%save clean_RBSP4.mat PlotArray4

%figure(1)
%subplot(611)
%view([90 -90])
%plot([1:23962]*11/3600,PlotArray)
%semilogy([1:118796]*11/3600,PlotArray(:,1))
% subplot(612)
% semilogy([1:23757]*11/3600,PlotArray(:,5))
% subplot(613)
% semilogy([1:23757]*11/3600,PlotArray(:,7))
% 
% 
% fileName = 'RBSPB_REL03_ECT-REPT-SCI-L2_5447.txt'
% array = load(fileName);
% array_of_data = load(fileName);
% size_of_array = size(array_of_data);
% columnCount = size_of_array(2);
% PlotArray = [];
% for index = 3:columnCount
%     CleanArray = Convert_Nans_to_Average(array_of_data(:,index));
%     PlotArray = [PlotArray CleanArray];
%    
% end
% subplot(614)
% view([90 -90])  
% semilogy([1:23962]*11/3600,PlotArray(:,1))
% subplot(615)
% semilogy([1:23962]*11/3600,PlotArray(:,5))
% subplot(616)
% semilogy([1:23962]*11/3600,PlotArray(:,7))
% 
