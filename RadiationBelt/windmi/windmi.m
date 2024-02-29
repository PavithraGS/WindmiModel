% Reference model
% load Target storm data
clear;
clc
load ACE_data.mat
%load Wind_data.mat

%Vx = Vx_W;
%Bz = Bz_W;

number_of_days = 5;
%Shue formula for subsolar point location
time_substorm = 1:660; % not same as below. need to change.... es 6/28/2012
Dp = 0.5*Np(time_substorm).*(1.0*Vx(time_substorm).^2);
R_subsolar = 10.22 + 1.29*tanh(0.184*(Bz(time_substorm)+8.14)).*(Dp.^(-1/6.6));

t_delay = -(250*6380)/mean(1.0*Vx)

%---------------------------
% New input voltages

% VBs Formula
Bz_abs = abs(Bz);
Bz_data = 0.5*(Bz_abs - Bz);
Ly = 10*6380e3;
Vsw00 = abs(Ly*1e-9*1e3*Vx.*Bz_data);
Vsw0 = 4000 + Vsw00;

% Siscoe-Hill Formulas
M_p = 1.673e-27;
C0 = 0.77;
F107 = 172.42; % range 71.5 to 235.4
SigmaP = C0*sqrt(F107);
B_abs = sqrt(By.^2 + Bz.^2);
theta = acos(Bz./B_abs);
Esw = -1e3*1e-9*Vx.*sqrt(By.^2 + Bz.^2).*sin(0.5*theta);
Psw = M_p*1e6*Np.*((1e3*Vx).^2);
Phi_M = 3 + 57.6*1e3*Esw.*((1e9*Psw).^(-1/6));
Vsw1 = 1e3*Phi_M;


%d(phi_MP)/dt: Newell et al. 2007
B_abs = sqrt(By.^2 + Bz.^2 + Bx.^2);
Dphi_mp = (abs(Vx).^(4/3)).*(B_abs.^(2/3)).*(sin(theta/2)).^(8/3);
Vsw2 = 4000 + (mean(Vsw0)/mean(Dphi_mp))*Dphi_mp;


% Combine all formulas
VSW = [Vsw0;Vsw1;Vsw2];
VSW_in = VSW(1:1,:);
%-----------------------------

% Pre-allocating memory for the WINDMI variables

dst_sim = zeros(size(VSW_in,1),size(t_stamp,2));
y_sim = zeros(size(VSW_in,1),size(t_stamp,2));
VSW_delay = zeros(size(VSW_in,1),size(t_stamp,2));
I_geotail = zeros(size(VSW_in,1),size(t_stamp,2));
p_cps = zeros(size(VSW_in,1),size(t_stamp,2));

% Evaluate WINDMI for different inputs

for Vsw_case = 1:size(VSW_in,1)

% Filter Input data and prepare for input to model
Inputx = t_stamp;
Inputy = VSW_in(Vsw_case,:);

Input = [Inputx',Inputy'];

%----------------------------------------------
R_Earth = 6380e3;

L = 90; %100; %97.4; %3.553900e+01;
L1 = 40; %19; %5.078018e+00;
M = 0.1; %2/3; %8.364571e-01;
C = 8000; %1000; %5.593295e+03;
Sigma = 5; %7.8; %1.063949e+01;
Omega = 10000*R_Earth^3; %4.273530e+24;
mu0 = 4.2e-9; %1.466905e-09;
Ic = 2e7; %5e6 to turn on substorm ;             %4.4e6; %1.78e+7;
alpha = 7.550246e+11;
taup = 0.01*600; %5.989938e+02;
tauE = 1*3600; %0.5*3600; %1.928020e+03;
C1 = 500; %800; %7.839420e+02;
SigmaI = 3; %3; %5.256917e+00;
beta = 1.1;
alpha_F = 100; % Used only with no K parallel

A_eff = 2*(R_Earth^2);
R_prc = 0.1;
L_y = 5*R_Earth; %10*R_Earth;
tau_rc = 12*3600;
L2 = 8;
R_A2 = 0.3;
B_tr = 5e-9;

del_I = 1.25e5;
A = (L1*L-M^2)^(-1);
inv_dI = (del_I)^(-1);
B_E = 3.1e-5;
dst_f = -(2*1e-7)*(1/(B_E*(R_Earth^3)));
%pf = 3500; % Specify from calling program
%arh_0 = 1/sqrt(log(2));


%-----------------------------------
% Call simulink and run windmi model
tspan = Inputx(size(Inputx,2));   
sim('windmi_8_n',tspan);
%-----------------------------------

dst_sim(Vsw_case,:) = dst_f*interp1(tout',yout(:,7)',Inputx);
y_sim(Vsw_case,:) = interp1(tout',yout(:,2)',Inputx);
VSW_delay(Vsw_case,:) = interp1(tout',yout(:,10)',Inputx);
I_geotail(Vsw_case,:) = interp1(tout',yout(:,1)',Inputx);
p_cps(Vsw_case,:) = interp1(tout',yout(:,5)',Inputx);

theta = interp1(tout',yout(:,9)',Inputx); % Should be based on VSW_case, but I use only one VSW most of the time.
V_ct = interp1(tout',yout(:,3)',Inputx);
K_parallel = interp1(tout',yout(:,6)',Inputx);
end

%--------------------------------------
% Generate E_Index
%--------------------------------------
%EL=energy levels
%1.8Mev
 Gain_factor_EL= 1;
 tau_loss_EL =14*3600;% 80*3600;
 t_delay_E_index_EL = 4*3600;
 Input_E_index_EL = [Inputx' y_sim'];
 tspan_EL = Inputx(size(Inputx,2)); 
 E0_EL =1e6;
 sim('Electron_Energization_For_Energy_Levels', tspan_EL);
 E_Index_1_8 = interp1(tout_E',yout_E',Inputx);
 
 %....To make the curve go straight after onset/jumps up
 [val,index]=max(E_Index_1_8);
 for ii=index+1:size(E_Index_1_8,2)
     E_Index_1_8(ii)=val;
 end
  
 
%2.1MeV
 Gain_factor_I1_EL = 1;
 tau_loss_EL = 16*3600;%75*3600;
 t_delay_E_index_EL =8*3600;%20*3600;
 Input_E_index_EL = [Inputx' y_sim'];
 tspan_EL = Inputx(size(Inputx,2));   
 E0_EL=1e6;
 sim('Electron_Energization_For_Energy_Levels', tspan_EL);
 E_Index_2_1 = interp1(tout_E',yout_E',Inputx);
 
  %....
 [val,index]=max(E_Index_2_1);
 for ii=index+1:size(E_Index_2_1,2)
     E_Index_2_1(ii)=val;
 end
 
 %....
 
 %2.6MeV
 Gain_factor_EL = 1;
 tau_loss_EL = 18*3600;%70*3600;
 t_delay_E_index_EL =11*3600; %5*3600;
 Input_E_index_EL = [Inputx' y_sim'];
 tspan_EL = Inputx(size(Inputx,2));   
 E0=1e6;
 sim('Electron_Energization_For_Energy_Levels', tspan_EL);
 E_Index_2_6 = interp1(tout_E',yout_E',Inputx);
 
 %....
 [val,index]=max(E_Index_2_6);
 for ii=index+1:size(E_Index_2_6,2)
     E_Index_2_6(ii)=val;
 end
 
 %....
  
 %3.4MeV
 Gain_factor_EL = 1;
 tau_loss_EL = 20*3600;%65*3600;
 t_delay_E_index_EL = 11*3600;%10*3600;
 Input_E_index_EL = [Inputx' y_sim'];
 tspan_EL = Inputx(size(Inputx,2));   
 E0_EL=1e6;
 sim('Electron_Energization_For_Energy_Levels', tspan_EL);
 E_Index_3_4 = interp1(tout_E',yout_E',Inputx);
 
 %....
 [val,index]=max(E_Index_3_4);
 for ii=index+1:size(E_Index_3_4,2)
     E_Index_3_4(ii)=val;
 end
 
 %....
 
 %4.2MeV
 Gain_factor_EL = 1;
 tau_loss_EL = 22*3600;%60*3600;
 t_delay_E_index_EL = 12*3600; %15*3600;
 Input_E_index_EL = [Inputx' y_sim'];
 tspan_EL = Inputx(size(Inputx,2)); 
 E0_EL=1e6;
 sim('Electron_Energization_For_Energy_Levels', tspan_EL);
 E_Index_4_2 = interp1(tout_E',yout_E',Inputx);
 
 %....
 [val,index]=max(E_Index_4_2);
 for ii=index+1:size(E_Index_4_2,2)
     E_Index_4_2(ii)=val;
 end
 
 %....
 
 
 %5.2MeV
 Gain_factor_EL = 1;
 tau_loss_EL = 24*3600;
 t_delay_E_index_EL = 14*3600; %15*3600;
 Input_E_index_EL = [Inputx' y_sim'];
 tspan_EL = Inputx(size(Inputx,2)); 
 E0_EL=1e6;
 sim('Electron_Energization_For_Energy_Levels', tspan_EL);
 E_Index_5_2 = interp1(tout_E',yout_E',Inputx);
 
 %....
 [val,index]=max(E_Index_5_2);
 for ii=index+1:size(E_Index_5_2,2)
     E_Index_5_2(ii)=val;
 end
 
 %....

 %6.3MeV
 Gain_factor_EL = 1;
 tau_loss_EL = 26*3600;
 t_delay_E_index_EL = 18*3600; %15*3600;
 Input_E_index_EL = [Inputx' y_sim'];
 tspan_EL = Inputx(size(Inputx,2)); 
 E0_EL=1e6;
 sim('Electron_Energization_For_Energy_Levels', tspan_EL);
 E_Index_6_3 = interp1(tout_E',yout_E',Inputx);
 
 %....
 [val,index]=max(E_Index_6_3);
 for ii=index+1:size(E_Index_6_3,2)
     E_Index_6_3(ii)=val;
 end
 
 %....
 
 %7.7MeV
 Gain_factor_EL = 1;
 tau_loss_EL = 28*3600;%20*3600;
 t_delay_E_index_EL =24*3600; %15*3600;
 Input_E_index_EL = [Inputx' y_sim'];
 tspan_EL = Inputx(size(Inputx,2)); 
 E0_EL=100;
 sim('Electron_Energization_For_Energy_Levels', tspan_EL);
 E_Index_7_7 = interp1(tout_E',yout_E',Inputx);
 
 %....
 [val,index]=max(E_Index_7_7);
 for ii=index+1:size(E_Index_7_7,2)
     E_Index_7_7(ii)=val;
 end
 
 %....

 
Gain_factor_I1 = 1;
% %t_delay_E_index = 5;
% tau_loss1 = 1;
% tau_loss2 = 1;
% t_in = 0:1:1000;
% E_in = heaviside(t_in-200) - heaviside(t_in-600);
% Input_E_index = [t_in' E_in'];
%Gain_factor_I1 = 1;
tau_loss1 = 1*3600;

%--------------------------------------
% This was the current E_index used 
% in the master before adding all of
% the additional E indexes 6/20/2021

t_delay_E_index = 5*3600;
Input_E_index = [Inputx' y_sim'];
tspan = Inputx(size(Inputx,2));   
sim('Electron_Energization_Model_1', tspan);
E_Index = interp1(tout_E',yout_E',Inputx);
%--------------------------------------


% Some fundamental resonances to guide parameter selection

T = 2*pi*sqrt(L*C)/60
T1 = 2*pi*sqrt(L1*C1)/60

ROOT_DIR = "../data/";
AL_data = load(ROOT_DIR+'AL.txt');
SML_data = load(ROOT_DIR+'SML.txt');

figure(1000)
subplot(12,1,1)
plot(t_stamp/18000, Vsw0, t_stamp/18000, VSW_delay)
grid on;axis tight;
ylabel('Vsw')

subplot(12,1,2)
plot(t_stamp/18000, y_sim)
grid on;axis tight;
ylabel('I1')

[numRows,numCols] = size(AL_data);

subplot(12,1,3)
plot([1:numRows]/60, AL_data(:,6), [1:numRows]/60, SML_data(:,7));
grid on; axis tight;
%hold on;plot([1:21601]/60, -y_sim/2000, 'r')
hold off;


subplot(12,1,4)
plot(t_stamp/18000,E_Index/1e10)
grid on;
axis tight;
ylabel('E Index')

subplot(12,1,5)
plot(t_stamp/18000,E_Index_1_8/1e10)
grid on;
axis tight;
ylabel('E Index 1.8')

subplot(12,1,6)
plot(t_stamp/18000,E_Index_2_1/1e10)
grid on;
axis tight;
ylabel('E Index 2.1')

subplot(12,1,7)
plot(t_stamp/18000,E_Index_2_6/1e10)
grid on;
axis tight;
ylabel('E Index 2.6')

subplot(12,1,8)
plot(t_stamp/18000,E_Index_3_4/1e10)
grid on;
axis tight;
ylabel('E Index 3.4')

subplot(12,1,9)
plot(t_stamp/18000,E_Index_4_2/1e10)
grid on;
axis tight;
ylabel('E Index 4.2')

subplot(12,1,10)
plot(t_stamp/18000,E_Index_5_2/1e10)
grid on;
axis tight;
ylabel('E Index 5.2')

subplot(12,1,11)
plot(t_stamp/18000,E_Index_6_3/1e10)
grid on;
axis tight;
ylabel('E Index 6.3')

subplot(12,1,12)
plot(t_stamp/18000,E_Index_7_7/1e10)
grid on;
axis tight;
ylabel('E Index 7.7')

figure(2)
subplot(311)
plot(t_stamp/3600, Vx)
grid on;axis tight;
subplot(312)
plot(t_stamp/3600, By)
grid on;axis tight;
subplot(313)
plot(t_stamp/3600, Bz)
grid on;axis tight;

figure(3)
subplot(511)
plot(t_stamp/18000, theta)
grid on;axis tight;
ylabel('\theta')
subplot(512)
plot(t_stamp/18000, p_cps)
grid on;axis tight;
ylabel('P_{cps}')
subplot(513)
plot(t_stamp/18000, I_geotail)
grid on;axis tight;
ylabel('I_{gt}')
subplot(514)
plot(t_stamp/18000, V_ct)
grid on;axis tight;
ylabel('V_{ct}')
subplot(515)
plot(t_stamp/18000, K_parallel)
grid on;axis tight;
ylabel('K_{||}')


