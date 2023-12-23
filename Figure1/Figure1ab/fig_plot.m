

clc; clear; close all

plotxppaut4p4  % load diagram.dat obtained from XPPAUT using mf_izh.ode

xlim([0,0.3])
ylim([0,0.18])

xlabel('$\bar \eta$','FontSize',14,'Interpreter','LaTeX')
ylabel('$r$','FontSize',14,'Interpreter','LaTeX')

%% for time evolution:PO 

plot(0.12,0.1520,'^k','MarkerSize',10,'LineWidth',2)
plot(0.12,0.0099,'^k','MarkerSize',10,'LineWidth',2)

text(0.12-0.004,0.1520+0.01,'$s_2$','FontSize',20,'Interpreter','LaTeX')
text(0.12-0.004,0.0099+0.01,'$s_2$','FontSize',20,'Interpreter','LaTeX')


%% for time evolution:EP

plot(0.25,0.1165,'^k','MarkerSize',10,'LineWidth',2)

text(0.25-0.004,0.1165+0.01,'$s_1$','FontSize',20,'Interpreter','LaTeX')

%% ========= The End =============
