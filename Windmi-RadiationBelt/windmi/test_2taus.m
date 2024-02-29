clear;

Gain_factor_I1 = 1;
t_delay_E_index = 10;
tau_loss1 = 100;
tau_loss2 = 10;

t_in = 0:1:1000;
E_in = heaviside(t_in-200) - heaviside(t_in-600);

Input_E_index = [t_in' E_in'];