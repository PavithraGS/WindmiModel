load clean_RBSP.mat PlotArray
load clean_GOES_40.mat GOES40PlotArray
load clean_GOES_75.mat GOES75PlotArray
load clean_GOES_150.mat GOES150PlotArray 
load clean_GOES_275.mat GOES275PlotArray
load clean_GOES_475.mat GOES475PlotArray


windowSize = 1000;
%test_ave_RBSP_band1 = filter(ones(1,windowSize)/windowSize,1,sum(PlotArray(:,1:3)')/3);
figure(1)
subplot(411)

%Get number of lines from file


ROOT_DIR = "data/"
GOES_FILE_NAME = ls(ROOT_DIR+ '* 40kev.txt');
GOES_FILE_NAME = ROOT_DIR + GOES_FILE_NAME 
fid0 = fopen(GOES_FILE_NAME);


count = 0;
strt_data = 0;
    while isequal(feof(fid0),0);
        data_line = fgetl(fid0);
        count = count+1;
        if (isempty(data_line) == 0) && (size(data_line,2) >= 10)&& strcmp(data_line(1:10),'dd-mm-yyyy')
                strt_data = count + 1;
        end
    end
    end_data = count - 3;
fclose(fid0);

data_length = end_data - strt_data + 1;
%%%%%%%%%%%%% 
%Test Code
%%%%%%%%%%%%%

% [numRows,numCols] = size(GOES40PlotArray);
% lineSpace = numRows;
% 
% for col = 1:numCols
% subplot(13,1,1);
% semilogy(1:data_length, GOES40PlotArray(:,col));
% hold on;
% end
% 
% grid on
% ylabel('40kev')
% hold off;
% xlim([0,lineSpace]);
% 
% [numRows,numCols] = size(GOES75PlotArray);
% lineSpace = numRows;
% 
% for col = 1:numCols
% subplot(13,1,2);
% semilogy(1:data_length, GOES75PlotArray(:,col));
% hold on;
% end
% 
% grid on
% ylabel('75kev')
% hold off;
% xlim([0,lineSpace]);
% 
% [numRows,numCols] = size(GOES150PlotArray);
% lineSpace = numRows;
% 
% for col = 1:numCols
% subplot(13,1,3);
% semilogy(1:data_length, GOES150PlotArray(:,col));
% hold on;
% end
% 
% grid on
% ylabel('150kev')
% hold off;
% xlim([0,lineSpace]);
% 
% [numRows,numCols] = size(GOES275PlotArray);
% lineSpace = numRows;
% 
% for col = 1:numCols
% subplot(13,1,4);
% semilogy(1:data_length, GOES275PlotArray(:,col));
% hold on;
% end
% 
% grid on
% ylabel('275kev')
% hold off;
% xlim([0,lineSpace]);
% 
%  [numRows,numCols] = size(GOES475PlotArray);
%  lineSpace = numRows;
% 
% for col = 1:numCols
% subplot(13,1,5);
% semilogy(1:data_length, GOES475PlotArray(:,col));
% hold on;
% end
% 
% grid on
% ylabel('475kev')
% hold off;
% xlim([0,lineSpace]);

[numRows,numCols] = size(PlotArray);
lineSpace=numRows;
[tWidth,tLength] = size(t_stamp);
xAxis = 0:tLength/lineSpace:tLength;
lineSpace=tLength;
xlim([0,lineSpace]);

%s_hand = subplot(13,1,6);
%pos = get(s_hand, 'Position'); % gives the position of current sub-plot
%new_pos = pos +[0 0.03 0 0.05];
%set(s_hand, 'Position',new_pos ) % set new position of current sub - plot
subplot(8,1,1);

semilogy(xAxis(1:end-1), PlotArray(:,1));
grid on
ylabel('1.8MeV')
xlim([0,lineSpace]);

% s_hand = subplot(13,1,2);
% pos = get(s_hand, 'Position'); % gives the position of current sub-plot
% new_pos = pos +[0 0.000 0 0.05];
% %set(s_hand, 'Position',new_pos ) % set new position of current sub - plot
% 
% plot([1:length(t_stamp)],E_Index_1_8/1e10,'*')
% grid on;
% axis tight;
% ylabel('E Index 1.8')
% xlim([0,lineSpace]);

s_hand = subplot(8,1,2);
pos = get(s_hand, 'Position'); % gives the position of current sub-plot
new_pos = pos +[0 -0.019 0 0.05];
%set(s_hand, 'Position',new_pos ) % set new position of current sub - plot

semilogy(xAxis(1:end-1), PlotArray(:,2));
grid on
ylabel('2.10MeV')
xlim([0,lineSpace]);

% s_hand = subplot(13,1,8);
% pos = get(s_hand, 'Position'); % gives the position of current sub-plot
% new_pos = pos +[0 -0.019 0 0.05];
%set(s_hand, 'Position',new_pos ) % set new position of current sub - plot

% plot([1:length(t_stamp)],E_Index_2_1/1e10)
% grid on;
% axis tight;
% ylabel('E Index 2.1')
% 
% xlim([0,lineSpace]);
subplot(8,1,3);

semilogy(xAxis(1:end-1), PlotArray(:,3));
grid on
ylabel('2.60MeV')

xlim([0,lineSpace]);
% subplot(13,1,6);
% 
% plot([1:length(t_stamp)],E_Index_2_6/1e10)
% grid on;
% axis tight;
% ylabel('E Index 2.6')
% 
% xlim([0,lineSpace]);
subplot(8,1,4);

semilogy(xAxis(1:end-1), PlotArray(:,4));
grid on
ylabel('3.40MeV')

xlim([0,lineSpace]);
% subplot(13,1,10);

% plot([1:length(t_stamp)],E_Index_3_4/1e10)
% grid on;
% axis tight;
% ylabel('E Index 3.4')
% 
% xlim([0,lineSpace]);
subplot(8,1,5);

semilogy(xAxis(1:end-1), PlotArray(:,5));
grid on
ylabel('4.20MeV')

xlim([0,lineSpace]);
% subplot(13,1,11);
% 
% plot([1:length(t_stamp)],E_Index_4_2/1e10)
% grid on;
% axis tight;
% ylabel('E Index 4.2')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%semilogy(1:data_length, PlotArray(:,1)')


%semilogy(1:7975, PlotArray(:,1)')

%ylabel('1.8MeV')
%subplot(412)
%semilogy(1:118796, test_ave_RBSP_band1)
%grid on;axis tight;
%ylabel('1.8MeV - 2.6MeV averaged')
% xlim([0,lineSpace]);

s_hand = subplot(8,1,6);
pos = get(s_hand, 'Position'); % gives the position of current sub-plot
new_pos = pos +[0 -0.019 0 0.05];
%set(s_hand, 'Position',new_pos ) % set new position of current sub - plot
plot([1:length(t_stamp)], Vsw0, [1:length(t_stamp)], VSW_delay)
grid on;axis tight;
ylabel('Vsw')
xlim([0,lineSpace]);

s_hand = subplot(8,1,7);
pos = get(s_hand, 'Position'); % gives the position of current sub-plot
new_pos = pos +[0 -0.075 0 0.05];
%set(s_hand, 'Position',new_pos ) % set new position of current sub - plot
plot([1:length(AL_data)], AL_data(:,6), [1:length(AL_data)], SML_data(:,7), [1:length(y_sim)], -y_sim/3500);
grid on; axis tight;
%hold on;plot([1:21601]/60, -y_sim/2000, 'r')
%hold off;
ylabel('AL and SML')
xlim([0,lineSpace]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NEW CODE
% MULTIPLE AL AND SML PLOTS OFFSET BY USER INPUT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% s_hand = subplot(13,1,13);
% pos = get(s_hand, 'Position'); % gives the position of current sub-plot
% new_pos = pos +[0 -0.075 0 0.05];
% xOffset = 2000;
% %set(s_hand, 'Position',new_pos ) % set new position of current sub - plot
% y1_data = AL_data(:,6);
% y2_data = SML_data(:,7);
% plot( [xOffset:length(AL_data)], y1_data(xOffset:length(y1_data)), [xOffset:length(AL_data)], y2_data(xOffset:length(y2_data)));
% grid on; axis tight;
% %hold on;plot([1:21601]/60, -y_sim/2000, 'r')
% %hold off;
% ylabel('AL and SML')
% xlim([0,lineSpace]);


subplot(8,1,8)
yStart = 1;
xOffset0 = 0;
xOffset1 = 0;
xOffset2 = 0;
xOffset3 = 0;
xOffset4 = 0;


%plot( [xOffset:length(AL_data)], y1_data(xOffset:length(y1_data)), [xOffset:length(AL_data)], y2_data(xOffset:length(y2_data)));
%Replace with output from EEI v3_0_paremeters.m simulink 12/1/2022
y_data = e_total1(:,3);
y0 = y_data(yStart:(length(y_data) - xOffset0));
y_data = e_total2(:,3);
y1 = y_data(yStart:(length(y_data) - xOffset1));
y_data = e_total3(:,3);
y2 = y_data(yStart:(length(y_data) - xOffset2));
y_data = e_total4(:,3);
y3 = y_data(yStart:(length(y_data) - xOffset3));
y_data = e_total5(:,3);
y4 = y_data(yStart:(length(y_data) - xOffset4));
x0=[(xOffset0+yStart):(length(y0))];
x1=[(xOffset1+yStart):(length(y1))];
x2=[(xOffset2+yStart):(length(y2))];
x3=[(xOffset3+yStart):(length(y3))];
x4=[(xOffset4+yStart):(length(y4))];

%plot(x0,y0,x1,y1*max(y0)/max(y1),x2,y2*max(y0)/max(y2),x3,y3*max(y0)/max(y3),x4,y4*max(y0)/max(y4));
plot(x0,y0,x1,y1,x2,y2,x3,y3,x4,y4);
grid on;
axis tight;
ylabel('E Index')
xlim([0,length(x0)]);

% NEW CODE 6/20/2021
% E-INDEXES PLOT
figure (7)

subplot(10,1,1);

semilogy(xAxis(1:end-1), PlotArray(:,1));
grid on
ylabel('1.8MeV')
xlim([0,length(t_stamp)]);
%ylim([-1.5,1.5]);
ax = gca;
ax.XAxis.Exponent = 0;

subplot(10,1,2);
plot([1:length(t_stamp)],E_Index_1_8/1e10)
grid on;
ylabel('E Index 1.8')
xlim([0,length(t_stamp)]);
%ylim([-1.5,1.5]);
%axis([0 length(t_stamp) 0 0.01]);
ax = gca;
ax.XAxis.Exponent = 0;
subplot(10,1,3);

semilogy(xAxis(1:end-1), PlotArray(:,2));
grid on
ylabel('2.10MeV')
xlim([0,length(t_stamp)]);
ax = gca;
ax.XAxis.Exponent = 0;
subplot(10,1,4);

plot([1:length(t_stamp)],E_Index_2_1/1e10)
grid on;
axis tight;
ylabel('E Index 2.1')

xlim([0,length(t_stamp)]);
ax = gca;
ax.XAxis.Exponent = 0;
subplot(10,1,5);

semilogy(xAxis(1:end-1), PlotArray(:,3));
grid on
ylabel('2.60MeV')

xlim([0,length(t_stamp)]);
ax = gca;
ax.XAxis.Exponent = 0;
subplot(10,1,6);

plot([1:length(t_stamp)],E_Index_2_6/1e10)
grid on;
axis tight;
ylabel('E Index 2.6')

xlim([0,length(t_stamp)]);
ax = gca;
ax.XAxis.Exponent = 0;
subplot(10,1,7);

semilogy(xAxis(1:end-1), PlotArray(:,4));
grid on
ylabel('3.40MeV')

xlim([0,length(t_stamp)]);
ax = gca;
ax.XAxis.Exponent = 0;
subplot(10,1,8);

plot([1:length(t_stamp)],E_Index_3_4/1e10)
grid on;
axis tight;
ylabel('E Index 3.4')

xlim([0,length(t_stamp)]);
ax = gca;
ax.XAxis.Exponent = 0;
subplot(10,1,9);

semilogy(xAxis(1:end-1), PlotArray(:,5));
grid on
ylabel('4.20MeV')

xlim([0,length(t_stamp)]);
ax = gca;
ax.XAxis.Exponent = 0;
subplot(10,1,10);

plot([1:length(t_stamp)],E_Index_4_2/1e10)
grid on;
axis tight;
ylabel('E Index 4.2')
xlim([0,length(t_stamp)]);
ax = gca;
ax.XAxis.Exponent = 0;
%plot([1:length(t_stamp)],E_Index_4_2/1e10)
%grid on;
%axis tight;
%ylabel('E Index 4.2')
%subplot(5,1,1);
%plot([1:length(t_stamp)],E_Index_1_8/1e10)
%grid on;
%axis tight;
%ylabel('E Index 1.8')
%
%subplot(5,1,2);
%plot([1:length(t_stamp)],E_Index_2_1/1e10)
%grid on;
%axis tight;
%ylabel('E Index 2.1')
%
%subplot(5,1,3);
%plot([1:length(t_stamp)],E_Index_2_6/1e10)
%grid on;
%axis tight;
%ylabel('E Index 2.6')
%
%subplot(5,1,4);
%plot([1:length(t_stamp)],E_Index_3_4/1e10)
%grid on;
%axis tight;
%ylabel('E Index 3.4')
%
%subplot(5,1,5);
%plot([1:length(t_stamp)],E_Index_4_2/1e10)
%grid on;
%axis tight;
%ylabel('E Index 4.2')

% windowSize = 1000;
% %test_ave_RBSP_band1 = filter(ones(1,windowSize)/windowSize,1,sum(PlotArray(:,4:5)')/2);
% figure(2)
% subplot(411)
% semilogy(1:118796, PlotArray(:,4)')
% grid on
% ylabel('3.4MeV')
% %subplot(512)
% %semilogy(1:118796, test_ave_RBSP_band1)
% %grid on;axis tight;
% %ylabel('3.4MeV - 4.2MeV averaged')
% subplot(412)
% plot(t_stamp/3600, Vsw0, t_stamp/3600, VSW_delay)
% grid on;axis tight;
% ylabel('Vsw')
% subplot(413)
% plot([1:21600]/60, AL_data(:,6), [1:21600]/60, SML_data(:,7), [1:21601]/60, -y_sim/3500);
% grid on; axis tight;
% %hold on;plot([1:21601]/60, -y_sim/2000, 'r')
% %hold off;
% ylabel('AL and SML')
% subplot(414)
% plot(t_stamp/3600,E_Index/1e10)
% grid on;
% axis tight;
% ylabel('E Index')
% 
% windowSize = 1000;
% test_ave_RBSP_band1 = filter(ones(1,windowSize)/windowSize,1,sum(PlotArray(:,6:10)')/7);
% figure(3)
% subplot(511)
% semilogy(1:118796, PlotArray(:,6:10)', '--')
% grid on
% ylabel('5.2MeV - 20.0MeV')
% subplot(512)
% semilogy(1:118796, test_ave_RBSP_band1)
% grid on;axis tight;
% ylabel('5.2MeV - 20.0MeV averaged')
% subplot(513)
% plot(t_stamp/3600, Vsw0, t_stamp/3600, VSW_delay)
% grid on;axis tight;
% ylabel('Vsw')
% subplot(514)
% plot([1:21600]/60, AL_data(:,6), [1:21600]/60, SML_data(:,7), [1:21601]/60, -y_sim/3500);
% grid on; axis tight;
% %hold on;plot([1:21601]/60, -y_sim/2000, 'r')
% %hold off;
% ylabel('AL and SML')
% subplot(515)
% plot(t_stamp/3600,E_Index/1e10)
% grid on;
% axis tight;
% ylabel('E Index')
% 
% % subplot(312)
% % test_ave_RBSP = filter(ones(1,windowSize)/windowSize,1,PlotArray(:,4:6)');
% % semilogy(1:118796, [test_ave_RBSP; PlotArray(:,4:6)']) 
% % grid on;axis tight;
% % ylabel('3.4MeV - 5.2MeV')
% % 
% % subplot(313)
% % test_ave_RBSP = filter(ones(1,windowSize)/windowSize,1,PlotArray(:,7:10)');
% % semilogy(1:118796, [test_ave_RBSP; PlotArray(:,7:10)']) 
% % grid on;axis tight;
% % ylabel('6.3MeV - 20.0MeV')
% % % interp1(1
