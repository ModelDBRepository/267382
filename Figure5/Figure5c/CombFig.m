% Combine figures of different windows into one window
% Liang Chen
% Jan. 26, 2022

%% ===========================================
% run step by step
clc; clear; close all

%% load *.dat obtained from XPPAUT

plotxppaut4p4 % load *.dat, set fig.1 as the current figure

xlim([0 0.1]);
ylim([0 0.15])

xlabel('$\bar \eta_p = \bar \eta_q = \bar \eta$','FontSize',14,'Interpreter','LaTeX')
ylabel('$r_p$','FontSize',14,'Interpreter','LaTeX')


saveas(gcf,'bif_mu_hw.fig')


%% ======= The end ============