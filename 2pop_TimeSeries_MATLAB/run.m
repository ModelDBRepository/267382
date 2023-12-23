% By Liang Chen, May 12, 2021
% Updated on May 20, 2022
% 
%
% Simulation of the two-population network of Izhikevich neurons
% dimensional form of eqs.
% heterogeneous parameters with the Cauchy/Lorentzian distribution
%
%
% ref: Liang Chen, Sue Ann Campbell, Exact mean-field models for spiking
%         neural networks with adaptation
% preprint: https://arxiv.org/abs/2203.08341
%
%
%=========================================================
tic
clc
clear
%% values of the parameters
parameters

a2 = 10*a1; % for dimensionless model
%but if from dimensionanl model, 10 times changes because of numerical error

vpeak = 200; vreset = -vpeak;
vinf = 200; 


%% Euler integration parameters 
dt = 10^(-3); 
tend =1200;
time = 0:dt:tend;
Tend = tend/(k1*abs(VR)/C);% Total simulation time, dimensional time (ms)

%% heterogeneous parameter, Lorentzian distribution
 
mu1 = 0.05;                   mu2 = 0.05; % centre                                                  
hw1 = 0.02;                   hw2 = 0.02; % half width 

% random generation
eta1 = cauchyrnd(mu1,hw1,N1,1);  
eta2 = cauchyrnd(mu2,hw2,N2,1);  

% % deterministic generation, typo in [Montbrio2015], "tan", not "atan"
% eta1 = zeros(N1,1);
% for j = 1:N1
%     eta1(j) = mu1 + hw1*tan(pi/2*(2*j-N1-1)/(N1+1)); 
% end
% 
% eta2 = zeros(N2,1);
% for j = 1:N2
%     eta2(j) = mu2 + hw2*tan(pi/2*(2*j-N2-1)/(N2+1)); 
% end


%% mean-field model

%Izh_SAWA_mf;   % Euler method to integrate ODEs

Izh_SAWA_mf_ode % ODE45

%% network model (see details in run.m of the folder Simulation_QIF)

Izh_SAWA_network

%% save data

save('Izh_mf_network_SAWA.mat');

%% plot figures

fig_plot2

toc
%% ============= The end ============


