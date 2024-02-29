load clean_RBSP.mat PlotArray



windowSize = 1000;
%test_ave_RBSP_band1 = filter(ones(1,windowSize)/windowSize,1,sum(PlotArray(:,1:3)')/3);
figure(1)

%Get number of lines from file


ROOT_DIR = "data/"


[numRows,numCols] = size(PlotArray);
lineSpace=numRows;
[tWidth,tLength] = size(t_stamp);
tLengthHours = tLength/60;
xAxis = 0:tLengthHours/lineSpace:tLengthHours;
lineSpace=tLengthHours;
xlim([0,lineSpace]);
max_plot_arr = max(max(PlotArray));


s_hand = subplot(11,1,1);
%pos = get(s_hand, 'Position'); % gives the position of current sub-plot
%new_pos = pos +[0 0.03 0 0.05];
%set(s_hand, 'Position',new_pos ) % set new position of current sub - plot

semilogy(xAxis(1:end-1), PlotArray(:,1));
ArrangeSubplot(s_hand,'1.8',0,lineSpace,nan);
title("25th - 28th August 2018 Storm Event with Solar Wind Data",'FontSize',14);



s_hand = subplot(11,1,2);
% pos = get(s_hand, 'Position'); % gives the position of current sub-plot
% new_pos = pos +[0 -0.019 0 0.05];

semilogy(xAxis(1:end-1), PlotArray(:,2));
ArrangeSubplot(s_hand,'2.1',0.1,lineSpace,nan);

s_hand = subplot(11,1,3);
semilogy(xAxis(1:end-1), PlotArray(:,3));
ArrangeSubplot(s_hand,'2.6',0,lineSpace,nan);


xlim([0,lineSpace]);

s_hand = subplot(11,1,4);

semilogy(xAxis(1:end-1), PlotArray(:,4));
ArrangeSubplot(s_hand,'3.4',0.1,lineSpace,nan);

s_hand = subplot(11,1,5);

semilogy(xAxis(1:end-1), PlotArray(:,5));
ArrangeSubplot(s_hand,'4.2',0,lineSpace,nan);

s_hand = subplot(11,1,6);

semilogy(xAxis(1:end-1), PlotArray(:,6));
ArrangeSubplot(s_hand,'5.2',0.1,lineSpace,nan);

s_hand = subplot(11,1,7);

semilogy(xAxis(1:end-1), PlotArray(:,7));
ArrangeSubplot(s_hand,'6.3',0,lineSpace,nan);


s_hand = subplot(11,1,8);

semilogy(xAxis(1:end-1), PlotArray(:,8));
ArrangeSubplot(s_hand,'7.7',0.1,lineSpace,nan);


s_hand = subplot(11,1,9);
% pos = get(s_hand, 'Position'); % gives the position of current sub-plot
% new_pos = pos +[0 -0.019 0 0.05];
xAxis = 0:1/60:length(t_stamp)/60;
xAxis = xAxis(1:end-1);
plot(xAxis, Vsw0, xAxis, VSW_delay,'LineWidth',1.5)
ArrangeSubplot(s_hand,'Vsw',0.1,lineSpace,nan);

% grid on;axis tight;
% ylabel('Vsw')
% xlim([0,lineSpace]);

s_hand = subplot(11,1,10);
% pos = get(s_hand, 'Position'); % gives the position of current sub-plot
% new_pos = pos +[0 -0.075 0 0.05];
smlAxis = (1:1/60:length(SML_data(:,7))/60+1);
smlAxis = smlAxis(1:end-1);
plot(smlAxis, AL_data(:,6),smlAxis, SML_data(:,7), xAxis, -y_sim/3500,'LineWidth',1.5);
ArrangeSubplot(s_hand,'AL & SML',0.1,lineSpace,nan);

% grid on; axis tight;
% ylabel('AL and SML')
% xlim([0,lineSpace]);


s_hand = subplot(11,1,11);
yStart = 1;
xOffset0 = 1;
xOffset1 = 1;
xOffset2 = 1;
xOffset3 = 1;
xOffset4 = 1;
xOffset5 = 1;
xOffset6 = 1;
xOffset7 = 1;
x0=[(xOffset0+yStart):(length(t_stamp))];
x1=[(xOffset1+yStart):(length(t_stamp))];
x2=[(xOffset2+yStart):(length(t_stamp))];
x3=[(xOffset3+yStart):(length(t_stamp))];
x4=[(xOffset4+yStart):(length(t_stamp))];
x5=[(xOffset5+yStart):(length(t_stamp))];
x6=[(xOffset6+yStart):(length(t_stamp))];
x7=[(xOffset7+yStart):(length(t_stamp))];

% Convert to minutes
x0 = x0/60;
x1 = x1/60;
x2 = x2/60;
x3 = x3/60;
x4 = x4/60;
x5 = x5/60;
x6 = x6/60;
x7 = x7/60;

%plot( [xOffset:length(AL_data)], y1_data(xOffset:length(y1_data)), [xOffset:length(AL_data)], y2_data(xOffset:length(y2_data)));
y_data = E_Index_1_8;
y0 = y_data(yStart:(length(y_data) - xOffset0));
y_data = E_Index_2_1;
y1 = y_data(yStart:(length(y_data) - xOffset1));
y_data = E_Index_2_6;
y2 = y_data(yStart:(length(y_data) - xOffset2));
y_data = E_Index_3_4;
y3 = y_data(yStart:(length(y_data) - xOffset3));
y_data = E_Index_4_2;
y4 = y_data(yStart:(length(y_data) - xOffset4));
y_data = E_Index_5_2;
y5 = y_data(yStart:(length(y_data) - xOffset5));
y_data = E_Index_6_3;
y6 = y_data(yStart:(length(y_data) - xOffset6));
y_data = E_Index_7_7;
y7 = y_data(yStart:(length(y_data) - xOffset7));


%plot(x0,y0,x1,y1*max(y0)/max(y1),x2,y2*max(y0)/max(y2),x3,y3*max(y0)/max(y3),x4,y4*max(y0)/max(y4),x5,y5*max(y0)/max(y5),x6,y6*max(y0)/max(y6),x7,y7*max(y0)/max(y7));
plot(x0,y0,x1,y1,x2,y2,x3,y3,x4,y4,x5,y5,x6,y6,x7,y7,'LineWidth',1.5);
xl = xlim;
yl = ylim;
xlabel("Time [Hours]",'FontSize',12);
ArrangeSubplot(s_hand,'E Index',0,lineSpace,nan);
grid off;
axis tight;
ylabel('E Index')
xlim([0,lineSpace]);

% NEW CODE 6/20/2021
% E-INDEXES PLOT
figure (7)
lineSpace=numRows;
[tWidth,tLength] = size(t_stamp);
tLengthHours = tLength/60;
xAxis = 0:tLengthHours/lineSpace:tLengthHours;

shand = subplot(16,1,1);
semilogy(xAxis(1:end-1), PlotArray(:,1),'LineWidth',1.75);
ArrangeSubplot(shand,'1.8',0,max(xAxis),max_plot_arr);
title("25th - 28th August 2018 Storm Event with Separate E-Indices Corresponding with RBSP Data",'FontSize',14)


%sfh1.Position = sfh1.Position + [0 0.02 0 0.02];
E_Index_Axis_Hours = 0:1/60:length(t_stamp)/60;
E_Index_Axis_Hours = E_Index_Axis_Hours(1:end-1);
shand = subplot(16,1,2);
plot(E_Index_Axis_Hours,E_Index_1_8/1e10,'LineWidth',2,'Color','#FF0000');
axis([1 E_Index_Axis_Hours(end) 0 6.5])%height adjustment
ArrangeSubplot(shand,'',0,max(xAxis),nan);

shand = subplot(16,1,3);
semilogy(xAxis(1:end-1), PlotArray(:,2),'LineWidth',1.75);
ArrangeSubplot(shand,'2.1',0,max(xAxis),max_plot_arr);

shand = subplot(16,1,4);
plot(E_Index_Axis_Hours,E_Index_2_1/1e10,'LineWidth',2,'Color','#FF0000')
axis([1 E_Index_Axis_Hours(end) 0 7])%height adjustment
ArrangeSubplot(shand,'',0,max(xAxis),nan);

shand = subplot(16,1,5);

semilogy(xAxis(1:end-1), PlotArray(:,3),'LineWidth',1.75);
ArrangeSubplot(shand,'2.6',0,max(xAxis),max_plot_arr);

shand = subplot(16,1,6);
plot(E_Index_Axis_Hours,E_Index_2_6/1e10,'LineWidth',2,'Color','#FF0000')
axis([1 E_Index_Axis_Hours(end) 0 8.5])%height adjustment
ArrangeSubplot(shand,'',0,max(xAxis),nan);

shand = subplot(16,1,7);
semilogy(xAxis(1:end-1), PlotArray(:,4),'LineWidth',1.75);
ArrangeSubplot(shand,'3.4',0,max(xAxis),max_plot_arr);

shand = subplot(16,1,8);
plot(E_Index_Axis_Hours,E_Index_3_4/1e10,'LineWidth',2,'Color','#FF0000')
axis([1 E_Index_Axis_Hours(end) 0 8.5])%height adjustment
ArrangeSubplot(shand,'',0,max(xAxis),nan);
pos = get(gcf, 'Position'); %// gives x left, y bottom, width, height
txt = 'Energy levels(MeV)';
text(-8,0,txt,'Rotation',90,'HorizontalAlignment', 'center','FontSize',12)

shand = subplot(16,1,9);
semilogy(xAxis(1:end-1), PlotArray(:,5),'LineWidth',1.75);
ArrangeSubplot(shand,'4.2',0,max(xAxis),max_plot_arr);

shand = subplot(16,1,10);
plot(E_Index_Axis_Hours,E_Index_4_2/1e10,'LineWidth',2,'Color','#FF0000')
axis([1 E_Index_Axis_Hours(end) 0 14])%height adjustment
ArrangeSubplot(shand,'',0,max(xAxis),nan);

shand = subplot(16,1,11);
semilogy(xAxis(1:end-1), PlotArray(:,6),'LineWidth',1.75);
ArrangeSubplot(shand,'5.2',0,max(xAxis),max_plot_arr);

shand = subplot(16,1,12);
plot(E_Index_Axis_Hours,E_Index_5_2/1e10,'LineWidth',2,'Color','#FF0000')
axis([1 E_Index_Axis_Hours(end) 0 16])%height adjustment
ArrangeSubplot(shand,'',0,max(xAxis),nan);

shand = subplot(16,1,13);
semilogy(xAxis(1:end-1), PlotArray(:,7),'LineWidth',1.75);
ArrangeSubplot(shand,'6.3',0,max(xAxis),max_plot_arr);

shand = subplot(16,1,14);
plot(E_Index_Axis_Hours,E_Index_6_3/1e10,'LineWidth',2,'Color','#FF0000')
axis([1 E_Index_Axis_Hours(end) 0 20])%height adjustment
ArrangeSubplot(shand,'',0,max(xAxis),nan);

shand = subplot(16,1,15);

semilogy(xAxis(1:end-1), PlotArray(:,8),'LineWidth',1.75);
ArrangeSubplot(shand,'7.7',0,max(xAxis),max_plot_arr);

shand = subplot(16,1,16);
plot(E_Index_Axis_Hours,E_Index_7_7/1e10,'LineWidth',2,'Color','#FF0000')
axis([1 E_Index_Axis_Hours(end) 0 24])%height adjustment
ArrangeSubplot(shand,'',0,max(xAxis),nan);
xlabel("Time [Hours]",'FontSize',12);
pos = get(gcf, 'Position'); %// gives x left, y bottom, width, height
width = pos(3);
height = pos(4);
%text(-100, 15, 'Energy Levels', 'FontSize',18,'Rotation',90, 'VerticalAlignment','bottom', 'HorizontalAlignment','center')



