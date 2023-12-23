% Combine figures of different windows into one window
% Liang Chen
% Jan. 25, 2022

%% run step by step
clc; clear; close all
plotxppaut4p4 % load diagram1.dat, set fig.1 as cf

plotxppaut4p4 % load diagram2.dat, set fig.3 as cf

%% combine fig.1 and fig.3 in fig.3

L = findobj(1,'type','line'); 
copyobj(L,findobj(3,'type','axes')); 

%%
xlim([0,0.07])
ylim([2,10]*1e-3)

xlabel('$\bar \eta$','FontSize',14,'Interpreter','LaTeX')
ylabel('$w_\mathrm{jump}$','FontSize',14,'Interpreter','LaTeX')

f=get(gca,'Children');
legend([f(1)],'HP')

saveas(gcf,'bif_mu_wjump.fig')

%% ========== The End ============
