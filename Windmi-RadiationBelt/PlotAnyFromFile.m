%fileName = input('Please input File location: ','s');
fileName = 'RBSPA_REL03_ECT-REPT-SCI-L2_5447.txt'
array = load(fileName);
array_of_data = load(fileName);
size_of_array = size(array_of_data);
columnCount = size_of_array(2);
PlotArray = [];

for index = 3:columnCount
    %figure(999 + index - 2);
    %subplot(311);
    CleanArray = Convert_Nans_to_Average(array_of_data(:,index));
    PlotArray = [PlotArray CleanArray];
    
    %subplot(312);
    %spectrogram(cleanArray,hamming(50),30,1000,0.25);
    %view([90 -90]) 
    %subplot(313)
    %spectrogram(cleanArray,hamming(200),199,1000,0.25);
    %view([90 -90])
end
figure(1000)
plot(PlotArray)

% fileName = 'RBSPB_REL03_ECT-REPT-SCI-L2_5447.txt'
% array = load(fileName);
% array_of_data = load(fileName);
% size_of_array = size(array_of_data);
% columnCount = size_of_array(2);
% 
% for index = 3:columnCount
%     figure(999 + index - 2);
%     subplot(311);
%     cleanArray = Convert_Nans_to_Average(array_of_data(:,index));
%     plot(cleanArray);
%     subplot(312);
%     spectrogram(cleanArray,hamming(50),30,1000,0.25);
%     view([90 -90]) 
%     subplot(313)
%     spectrogram(cleanArray,hamming(200),199,1000,0.25);
%     view([90 -90])
% end