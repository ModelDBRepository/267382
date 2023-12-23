% Combine figures of different windows into one window
% Liang Chen
% Jan. 26, 2022

%% ===========================================
% run step by step
clc; clear; close all

%% load *.dat obtained from XPPAUT

plotxppaut4p4 % load mu-hw-cusp1.dat, set fig.1 as the current figure

plotxppaut4p4 % load mu-hw-cusp2.dat, set fig.3 as the current figure

%% combine fig.1 and fig.3 in fig.3

L = findobj(1,'type','line'); 
copyobj(L,findobj(3,'type','axes'));

%% continue combine the modified fig.3 with new fig.5

plotxppaut4p4  % load mu-hw-HB.dat, set fig.5 as the current figure

L = findobj(3,'type','line'); 
copyobj(L,findobj(5,'type','axes'));

saveas(gcf,'bif_mu_hw.fig')

%% save to *.fig
xlim([0 0.1]);
ylim([0 0.05])

xlabel('$\bar \eta_p = \bar \eta_q = \bar \eta$','FontSize',14,'Interpreter','LaTeX')
ylabel('$\Delta^\eta_p = \Delta^\eta_q =  \Delta^\eta$','FontSize',14,'Interpreter','LaTeX')


%% plot the particular horizontal line

yline(0.02,'--',LineWidth=1)

%% show partial legend in figure
% MathWorks: How to show partial legend in figure
% https://www.mathworks.com/matlabcentral/answers/25381-how-to-show-partial-legend-in-figure

f=get(gca,'Children');
legend([f(9),f(6)],'HP','SN')
% how to choose f(# No): see Fig, Insert - Legend, count from the lowest

saveas(gcf,'bif_mu_hw.fig')
saveas(gcf,'bif_mu_hw.svg')

%% ======= The end ============