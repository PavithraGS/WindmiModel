% Load Data Files and prepare Input Matrix, storm_In, write to file
% AEI are given over 1 minute intervals AEI = [time AL AU AE]
% MFI is over 16 second intervals B_Field = [day time Bx By Bz X Y Z]
% SWE is over 64 second intervals S_Wind = [day time Np Vx Vy Vz X Y Z] 
% DST is Hourly DST = [day DST{col2-col25}]

clear
%load aei;
load MFI.mat;
load SWE.mat;
%DST_I = load(DST_File);
%return
% Extract time and AL only from AEI
%AL_I = AEI(:,1:2);
%cd ..
%cd ..
%cd code;
%----------------------------------

% Correct MFI times and bad data

day0 = B_Field(1,1);
day_num = B_Field(:,1)-day0;
max_day = max(day_num);

for i = 1:size(day_num,1)
    if day_num(i) < 0
        day_num(i) = day0+day_num(i)+max_day;
    end
end
time_of_day = B_Field(:,2);
time = day_num*86400 + time_of_day;
B_Field(:,2) = time;
B_Field(:,1) = day_num;

i = 1;
if abs(B_Field(1,3)) >= 1e10
    B_Field(1,3) = 0;
end
if abs(B_Field(1,4)) >= 1e10
    B_Field(1,4) = 0;
end
if abs(B_Field(1,5)) >= 1e10
    B_Field(1,5) = 0;
end

for i = 2:size(B_Field,1)
    if abs(B_Field(i,3)) >= 1e10
        B_Field(i,3) = B_Field(i-1,3);
    end
    if abs(B_Field(i,4)) >= 1e10
        B_Field(i,4) = B_Field(i-1,4);
    end
    if abs(B_Field(i,5)) >= 1e10
        B_Field(i,5) = B_Field(i-1,5);
    end
end
%-----------------------------------

%Correct SWE times and bad data

day0 = S_Wind(1,1);
day_num = S_Wind(:,1)-day0;
max_day = max(day_num);

for i = 1:size(day_num,1)
    if day_num(i) < 0
        day_num(i) = day0+day_num(i)+max_day;
    end
end
time_of_day = S_Wind(:,2);
time = day_num*86400 + time_of_day;
S_Wind(:,2) = time;
S_Wind(:,1) = day_num;

i = 1;
if abs(S_Wind(1,3)) >= 1e10
    S_Wind(1,3) = 0;
end
if abs(S_Wind(1,4)) >= 1e10
    S_Wind(1,4) = 0;
end
if abs(S_Wind(1,5)) >= 1e10
    S_Wind(1,5) = 0;
end
if abs(S_Wind(1,6)) >= 1e10
    S_Wind(1,6) = 0;
end

for i = 2:size(S_Wind,1)
    if abs(S_Wind(i,3)) >= 1e10
        S_Wind(i,3) = S_Wind(i-1,3);
    end
    if abs(S_Wind(i,4)) >= 1e10
        S_Wind(i,4) = S_Wind(i-1,4);
    end
    if abs(S_Wind(i,5)) >= 1e10
        S_Wind(i,5) = S_Wind(i-1,5);
    end
    if abs(S_Wind(i,6)) >= 1e10
        S_Wind(i,6) = S_Wind(i-1,6);
    end
end
%------------------------------------

% Interpolate all data to same time stamps

day0 = S_Wind(1,1);
day_last = S_Wind(size(S_Wind,1),1);
num_of_days = day_last - day0 + 1;

t_stamp = 0:60:num_of_days*24*3600;

%AL = interp1(AL_I(:,1),AL_I(:,2),t_stamp,'linear','extrap');
Bx = interp1(B_Field(:,2),B_Field(:,3),t_stamp,'linear','extrap');
By = interp1(B_Field(:,2),B_Field(:,4),t_stamp,'linear','extrap');
Bz = interp1(B_Field(:,2),B_Field(:,5),t_stamp,'linear','extrap');
%X = interp1(B_Field(:,2),B_Field(:,6),t_stamp,'linear','extrap');
Vx = interp1(S_Wind(:,2),S_Wind(:,4),t_stamp,'linear','extrap');
Vy = interp1(S_Wind(:,2),S_Wind(:,5),t_stamp,'linear','extrap');
Vz = interp1(S_Wind(:,2),S_Wind(:,6),t_stamp,'linear','extrap');
Np = interp1(S_Wind(:,2),S_Wind(:,3),t_stamp,'linear','extrap');
%------------------------------------

% Np and Vx,Vy,Vz data has to be corrected again after interpolation
% Really for the first or last point, but do it all over anyway

for i = 1:size(Np,2)
    if Np(i) < 0
        Np(i) = mean(Np);
    end
end

for i = 1:size(Vx,2)
    if Vx(i) > 0
        Vx(i) = mean(Vx);
    end
end

for i = 1:size(Vy,2)
    if Vy(i) > 0
        Vy(i) = mean(Vy);
    end
end

for i = 1:size(Vz,2)
    if Vz(i) > 0
        Vz(i) = mean(Vz);
    end
end
%------------------------------------
% Calculate time delay
%a = 1.496e8;
%T0 = 25.4*24*60;
%RE = 6380;

%t0 = (X-10*RE)/60./Vx;

%t1 = (mean(X)-10*RE)/(60*mean(Vx))
%t2 = mean(B_Field(:,7))*T0/(2*pi*a);

%t_delay = -60*mean(t0)

%-----------------------------------


%Plot some data for examination
show_data_plots = 1;

if show_data_plots == 1

figure(1)

subplot('position',[0.1 0.1 0.8 0.25])
plot((1/3600)*t_stamp,Vx)

ylabel('v_x [km/s]', 'FontSize', 18)
xlabel('Time [Hrs]', 'FontSize', 18)
subplot('position',[0.1 0.35 0.8 0.25])
plot((1/3600)*t_stamp,Np)

ylabel('n_{sw} [cm^{-3}]', 'FontSize', 18)

subplot('position',[0.1 0.6 0.8 0.25 ])
plot((1/3600)*t_stamp,Bz)
ylabel('B_z [nT]', 'FontSize', 18)
title('Solar Wind Parameters from ACE ','FontSize', 18)

figure(6)
subplot(3,1,1)
plot((1/3600)*t_stamp,Vx)
title('Solar Wind Velocity from ACE ')
ylabel('Vx')
subplot(3,1,2)
plot((1/3600)*t_stamp,Vy)
ylabel('Vy')
subplot(3,1,3)
plot((1/3600)*t_stamp,Vz)
ylabel('Vz')
xlabel('Time [Hrs]')

figure(7)
subplot(3,1,1)
plot((1/3600)*t_stamp,Bx)
title('IMF from ACE')
ylabel('Bx')
subplot(3,1,2)
plot((1/3600)*t_stamp,By)
ylabel('By')
subplot(3,1,3)
plot((1/3600)*t_stamp,Bz)
ylabel('Bz')
xlabel('Time [Hrs]')
end
%------------------------------------

%Save some data

save ACE_data t_stamp Bx By Bz Np Vx Vy Vz
clear;