% Electron Energization version 3

% tau_loss = 0;
% t_delay = 0;
% alpha_I = 1;
% alpha_d = 2;

step_time = 18;
tau_loss = 5;
t_delay = 7;
alpha_I = 1;
alpha_d = 4;
c3 = 2;
Input_X_V3 = [Inputx',y_sim'];
[~,~,e_total1] = sim('Electron_Energization_Index_v3');

step_time = 15;
tau_loss = 6;
t_delay = 12;
alpha_I = 1;
alpha_d =  4;
c3 = 2;
Input_X_V3 = [Inputx',y_sim'];
[~,~,e_total2] = sim('Electron_Energization_Index_v3');

step_time = 12;
tau_loss = 8;
t_delay = 17;
alpha_I = 1;
alpha_d =  4;
c3 = 2;
Input_X_V3 = [Inputx',y_sim'];
[~,~,e_total3] = sim('Electron_Energization_Index_v3');

step_time = 8;
tau_loss = 10;
t_delay = 30;
alpha_I = 1;
alpha_d =  4;
c3 = 2;
Input_X_V3 = [Inputx',y_sim'];
[~,~,e_total4] = sim('Electron_Energization_Index_v3');

step_time = 5;
tau_loss = 15;
t_delay = 35;
alpha_I = 1;
alpha_d =  4;
c3 = 2;
Input_X_V3 = [Inputx',y_sim'];
[y1v3,y2v3,e_total5] = sim('Electron_Energization_Index_v3');
% Plot %
% figure(1222);
% subplot(5,1,1)
% plot(y1v3)
% subplot(5,1,2)
% plot(y2v3)
% subplot(5,1,3)
% plot(e_total1(:,1))
% subplot(5,1,4)
% plot(e_total1(:,2))
% subplot(5,1,5)
% plot(e_total1(:,3))
% End Plot %

% Plot%
figure(1223);
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
ylabel('E Index');
xlim([0,length(x0)]);
% END PLOT
