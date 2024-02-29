load Flux.mat 

array_of_data = Flux_data;
size_of_array = size(array_of_data);
columnCount = size_of_array(2);
PlotArray = [];
for index = 1:columnCount
    CleanArray = Convert_Nans_to_Average(array_of_data(:,index));
    PlotArray = [PlotArray CleanArray];
end

save clean_RBSP.mat PlotArray