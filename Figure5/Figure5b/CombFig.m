% Combine figures of different windows into one window
% Liang Chen
% Jan. 26, 2022

%% ===========================================
% run step by step
clc; clear; close all

%% load *.dat obtained from XPPAUT

plotxppaut4p4 % load diagram1.dat, set fig.1 as the current figure

plotxppaut4p4 % load diagram2.dat, set fig.3 as the current figure

%% combine fig.1 and fig.3 in fig.3

L = findobj(1,'type','line'); 
copyobj(L,findobj(3,'type','axes'));

%% save to *.fig
xlim([0 0.16]);
ylim([0,1])

xlabel('$\bar \eta_p = \bar \eta_q = \bar \eta$','FontSize',14,'Interpreter','LaTeX')
ylabel('$\kappa$','FontSize',14,'Interpreter','LaTeX')
% ylabel('$\Delta^\eta_p = \Delta^\eta_q =  \Delta^\eta$','FontSize',14,'Interpreter','LaTeX')


%% plot two particular horizontal lines

yline(0.8,'--',LineWidth=1)
yline(0.5,'--',LineWidth=1)

%% show partial legend in figure
% MathWorks: How to show partial legend in figure
% https://www.mathworks.com/matlabcentral/answers/25381-how-to-show-partial-legend-in-figure

f=get(gca,'Children');
legend([f(3),f(6)],'HP','SN')
% how to choose f(# No): see Fig, Insert - Legend, 

saveas(gcf,'bif_mu_kappa.fig')

%% ======= The end ============