% By Liang Chen
% Updated on Jan. 27, 2022
%
% The external current I is changed to see two steady state: EP-> PO->EP
%
% Simulation of the network of Izhikevich neurons
% dimensional form of eqs.
% heterogeneous parameters with the Cauchy/Lorentzian distribution
%
% the dimensionless model eq.(50)-(53) in [NicolaCampbell2013bif]: 
%        v_i' = v_i*(v_i-alpha)- w_i + I + g*(e_r - v_i)s;
%        w_i' = a*(b*v_i - w_i)
%          s' = -s/tau_s + s_jump*j(t)
%        + the resetting rules
%
% the dimensional form of the model eq.(46)-(49) in [NicolaCampbell2013bif]:
%     C*V_i' = k*(V_i - V_T)*(V_i-V_R) - W_i + I_app + g_syn*(e_r - V_i)s;
%     W_i'   = [\eta*(V_i - V_R) - W_i]/tau_W;
%     s'     = -s/tau_syn + s_jump*j(t)
%     + the resetting rules   
%
% ref. [NicolaCampbell2013bif]: Bifurcation of large networks of
%          two-dimensional integrate and fire neurons
%      [NicolaCampbell2013heter]: Mean-field models for heterogeneous networks
%      of two-dimensional integrate and fire neurons
%      [Montbrio2015]: Macroscopic description for networks of spiking
%      neurons
%      [DumontErmentrout]: Macroscopic phase-resetting curves for spiking
%      neural networks
%
% the mean-field model:
%   rm' = hw/pi + 2*rm*vm - rm*(g*sm + alpha);
%   vm' = vm^2 - alpha*vm + g*sm*(er - vm) - wm + mu - pi^2*rm^2
%   wm' = a*(b*vm - wm) + wjump*rm
%   sm' = -sm/tsyn + sjump*rm 
%
%=========================================================
clc
clear
close all
%% ======================================
% First round when I = 0, PO
%% values of the parameters
parameters
vpeak = 200; vreset = -vpeak;vinf = 200; 
%
I1=0; I=I1; % dimensionless external current
%
%% Euler integration parameters 
dt = 10^(-3); 
tend = 650;
time = 0:dt:tend;
%
%% ICs of variables
IC
%
%% mean-field model
tic
Izh_mf_ode45  % the current must be small enough to limit s in [0,1]                   
toc
%% network model (see details in run.m of the folder Simulation_QIF)
tic
Izh_network3
toc 
%
%%
assign1 % rm1=rm, etc
%
%% =======================================
% Second round when I = 0.1, EP
%% Euler integration parameters 
dt = 10^(-3); 
tend = 500;
time = 0:dt:tend;
%%
I2=0.1;I=I2;
IC2
%
tic
Izh_mf_ode45
toc
%
tic
Izh_network3
toc
%
%%
assign2 % rm2=rm, etc
assign12  % rm=[rm1;rm2], etc
save('Izh_mf_network.mat');
%fig_plot  % raster, r, v_mean, w_mean
fig_plot_I % raster, r, I
%
%
%% =======================================
% % Third round when I = 0, PO (something wrong with the following code)
% %% Euler integration parameters 
% dt = 10^(-3); 
% tend = 500;
% time = 0:dt:tend;
% %%
% I=0;
% IC
% %
% tic
% Izh_mf_ode45
% toc
% %
% tic
% Izh_network3
% toc
% %
% %%
% assign3 % rm3=rm, etc
% assign123  % rm=[rm1;rm2;rm3], etc
% %
% %% save data
% save('Izh_mf_network2.mat');
% fig_plot
% %
%% The end

