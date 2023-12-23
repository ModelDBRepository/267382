% Combine figures of different windows into one window
% Liang Chen
% Jan. 26, 2022

%%
plotxppaut4p4 % fig.1


plotxppaut4p4 % fig.3

%% combine fig.1 and fig.3 in fig.3
L = findobj(1,'type','line'); 
copyobj(L,findobj(3,'type','axes'));

%% continue combine the modified fig.3 with new fig.5
plotxppaut4p4 % fig.5
L = findobj(3,'type','line'); 
copyobj(L,findobj(5,'type','axes'));

saveas(gcf,'bif_mu_hw_p1.fig')

%%
xlabel('$\bar \eta_p = \bar \eta_q = \bar \eta$','FontSize',14,'Interpreter','LaTeX')
ylabel('$\Delta^\eta_p = \Delta^\eta_q =  \Delta^\eta$','FontSize',14,'Interpreter','LaTeX')
%
text(0.03,0.048,'$\kappa=0.6$','FontSize',14,'Interpreter','LaTeX')
text(0.047,0.053,'$\kappa=0.7$','FontSize',14,'Interpreter','LaTeX')
text(0.09,0.057,'$\kappa=0.8$','FontSize',14,'Interpreter','LaTeX')

plot(0.08,0.04,'^k','MarkerSize',10,'LineWidth',2)
text(0.08-0.002,0.04-0.002,'$s_3$','FontSize',20,'Interpreter','LaTeX')

%% =======  The end ============