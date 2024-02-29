fileName = 'RBSPA_REL03_ECT-REPT-SCI-L2_13084.txt'
array = load(fileName);
array_of_data = load(fileName);
size_of_array = size(array_of_data);
columnCount = size_of_array(2);
PlotArray = [];

for index = 3:columnCount
    CleanArray = Convert_Nans_to_Average(array_of_data(:,index));
    PlotArray = [PlotArray CleanArray];
   
end
figure(1)
subplot(211)
view([90 -90])
%plot([1:23962]*11/3600,PlotArray)
semilogy([1:79200]*11/3600,PlotArray)

fileName = 'RBSPB_REL03_ECT-REPT-SCI-L2_13084.txt'
array = load(fileName);
array_of_data = load(fileName);
size_of_array = size(array_of_data);
columnCount = size_of_array(2);
PlotArray = [];

for index = 3:columnCount
    CleanArray = Convert_Nans_to_Average(array_of_data(:,index));
    PlotArray = [PlotArray CleanArray];
   
end
subplot(212)
view([90 -90])  
semilogy([1:78138]*11/3600,PlotArray)