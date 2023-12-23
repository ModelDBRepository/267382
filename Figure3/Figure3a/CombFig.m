% Combine figures of different windows into one window
% Liang Chen
% Jan. 25, 2022

%%
plotxppaut4p4 % load I=0.dat, set fig.1 as the current figure

plotxppaut4p4 % load I-01.dat, set fig.3 as the current figure

%% combine fig.1 and fig.3 in fig.3
L = findobj(1,'type','line'); 
copyobj(L,findobj(3,'type','axes')); 

saveas(gcf,'bif_mu_I.fig')

%%
xlabel('$\bar \eta$','FontSize',14,'Interpreter','LaTeX')
ylabel('$\Delta_\eta$','FontSize',14,'Interpreter','LaTeX')
%
text(-0.01,0.071,'$I_{\mathrm{ext}}=0.1$','FontSize',20,'Interpreter','LaTeX')
text(0.1,0.071,'$I_{\mathrm{ext}}=0$','FontSize',20,'Interpreter','LaTeX')
%
plot(0.12,0.02,'^k','MarkerSize',10,'LineWidth',2)
text(0.12-0.01,0.02+0.005,'$s_3$','FontSize',20,'Interpreter','LaTeX')

%% The end