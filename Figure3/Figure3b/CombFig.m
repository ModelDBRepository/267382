% Combine figures of different windows into one window
% Liang Chen
% Jan. 26, 2022


clc; clear; close all

% run step by step
plotxppaut4p4 % load *.dat, set fig.1 as cf

plotxppaut4p4 % loat *.dat, set fig.3 as cf

%% combine fig.1 and fig.3 in fig.3

L = findobj(1,'type','line'); 
copyobj(L,findobj(3,'type','axes'));

%% continue combine the modified fig.3 with new fig.5

plotxppaut4p4 % load *.dat, set fig.5 as cf
L = findobj(3,'type','line'); 
copyobj(L,findobj(5,'type','axes'));

saveas(gcf,'bif_mu_hw_wjump.fig')

%%
xlabel('$\bar \eta$','FontSize',14,'Interpreter','LaTeX')
ylabel('$\Delta_\eta$','FontSize',14,'Interpreter','LaTeX')
%
text(0.01,0.071,'$w_{\mathrm{jump}}=0.015$','FontSize',14,'Interpreter','LaTeX')
text(0.10,0.073,'$w_{\mathrm{jump}}=0.0189$','FontSize',14,'Interpreter','LaTeX')
text(0.22,0.071,'$w_{\mathrm{jump}}=0.03$','FontSize',14,'Interpreter','LaTeX')

%% ========= The End ===============