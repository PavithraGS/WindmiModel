ROOT_DIR = "data/";
    
EXCEL_FILE_NAME = ls(ROOT_DIR + '*.xlsx');
EXCEL_FILE_PATH = ROOT_DIR + EXCEL_FILE_NAME;
opts = detectImportOptions(EXCEL_FILE_PATH);
sheet_list = [];
sheet_list{1} = readtable(EXCEL_FILE_PATH,'Sheet','Sheet2');
sheet_list{2} = readtable(EXCEL_FILE_PATH,'Sheet','Sheet3');
sheet_list{3} = readtable(EXCEL_FILE_PATH,'Sheet','Sheet4');
sheet_list{4} = readtable(EXCEL_FILE_PATH,'Sheet','Sheet5');
sheet_list{5} = readtable(EXCEL_FILE_PATH,'Sheet','Sheet6');
f = xlsread(EXCEL_FILE_PATH);


sheet_count = max(size(sheet_list));
titleNames = ["Tauloss with respect to energy levels"
    "Time delay with respect to energy levels"
    "Tauloss without the outliers with respect to energy levels"
    "Time delay without the outliers with respect to energy levels"
    "Electron flux saturation level with respect to energy levels"
    "Tauloss with respect to time"
    "Time delay with respect to time"
    "Tauloss without the outliers with respect to time"
    "Time delay without the outliers with respect to time"
    "Electron flux saturation level with respect to time"];
yLabels = ["Tau loss [Hours]" "Time Delay [Hours]" "Tau Loss without outliers [Hours]" "Time Delay without outliers [Hours]" "Electron saturation flux"];
for i = 1:sheet_count
    figure;
    PlotExcelSheetAmountVsLevels(sheet_list{i},titleNames{i},"Energy Levels [MeV]",yLabels(i));
end

for i = 1:sheet_count
    figure;
    PlotExcelSheetAmountVsTime(sheet_list{i},titleNames{5+i},"Events [Years]",yLabels(i));
end


function a = PlotExcelSheetAmountVsLevels(sheet,plotTitle,xLabel,yLabel)
% PlotExcelSheet Local function that plots excel sheet.
[~,storm_count] = size(sheet);
names = sheet.Properties.VariableNames(2:end);
%date_axis = [];
line_series_labels = names;
for index = 1:max(size(names)) 
    modDateStr = erase(names(index),'x');
    line_series_labels(index) = strrep(modDateStr,'_','/');
end
% Start from two because first index is the energy levels 1.8, 2.1 etc,
x_axis = sheet{(1:end),1}';
x_ticks_normal = [0 1 2 3 4 5 6 7 8];
new_x_ticks = [x_ticks_normal x_axis];
new_x_ticks = sort(new_x_ticks);
%xticks(new_x_ticks);
for storm_index = 2:storm_count
    plot(x_axis,sheet{(1:end),storm_index},'*-','DisplayName',line_series_labels{storm_index-1},'LineWidth',1);
    %xticks(new_x_ticks
    hold on;
end

mean_plot = [];
for energy_index = 1:max(size(x_axis))
   mean_plot(energy_index) = mean(sheet{energy_index,2:end});
end
plot(x_axis,mean_plot,'-*','LineWidth',4,'DisplayName','Mean');
ax = gca;
ax.FontSize = 12; 
legend;
hold off;
title(plotTitle);
xlabel(xLabel,'FontSize',14,'fontweight','bold'); 
ylabel(yLabel,'FontSize',14,'fontweight','bold');
end

function a = PlotExcelSheetAmountVsTime(sheet, plotTitle, xLabel, yLabel)
    % PlotExcelSheet Local function that plots excel sheet.
    [energy_levels,~] = size(sheet);
    % Start from two because first index is the energy levels 1.8, 2.1 etc,

    x_axis = sheet.Properties.VariableNames(2:end);
    %date_axis = [];
    x_tick_labels = x_axis;
    line_series_labels = sheet{:,1};
    for index = 1:max(size(x_axis)) 
        modDateStr = erase(x_axis(index),'x');
        x_tick_labels(index) = strrep(modDateStr,'_','/');
        %date_axis(index) = datenum(datetime(erase(x_axis(index),'x'),'format', 'mm_dd_yyyy'));
    end
    for energy_level_index = 1:energy_levels
        % Start with two because energy level is the first column
        plot(sheet{energy_level_index,(2:end)},'*-','DisplayName',num2str(line_series_labels(energy_level_index)),'LineWidth',2);
        %plot(date_axis, sheet{energy_level_index,(2:end)}, '*-')
        %datetick('x', 'dd-mm-yyyy')
        xticklabels(x_tick_labels)
        hold on;
    end

    mean_plot = [];
    for storm_index = 1:max(size(x_axis))
       % Add one cause first column is the energy levels
       mean_plot(storm_index) = mean(sheet{1:end,storm_index+1});
    end
    plot(mean_plot,'-*','LineWidth',4,'DisplayName','Mean');
    ax = gca;
    ax.FontSize = 12; 
    legend;
    hold off;
    xlabel(xLabel,'FontSize',12,'fontweight','bold'); 
    ylabel(yLabel,'FontSize',12,'fontweight','bold');
    title(plotTitle);
    %plot(sheet{1,2:end});
end