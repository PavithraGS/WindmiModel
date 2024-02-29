function [] = ArrangeSubplot(subplot_handle,y_label, y_label_offset, xlim_max, ylim_max)
%ARRANGESUBPLOT Called to arrange the subplots in the radiation belt
%average.m folder
%   Detailed explanation goes here
grid off;
yAxisLabel = ylabel(y_label,'FontSize',10);
yAxisLabel.Position(1) = yAxisLabel.Position(1) + y_label_offset;
if ~isnan(xlim_max)
    xlim([0,xlim_max]);
end
if ~isnan(ylim_max)
    ylim([0,ylim_max]);
end
subplot_handle.Position = subplot_handle.Position + [0 0.02 0 0.02];
ax = gca;
ax.XAxis.Exponent = 0;
end

