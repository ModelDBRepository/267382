
xlabel('$\bar \eta_p = \bar \eta_q = \bar \eta$','FontSize',14,'Interpreter','LaTeX')
ylabel('$r_p$','FontSize',14,'Interpreter','LaTeX')

%% for time evolution:PO 
plot(0.08,0.1366,'^k','MarkerSize',10,'LineWidth',2)
plot(0.08,0.0102,'^k','MarkerSize',10,'LineWidth',2)
%
%% for time evolution:EP
plot(0.18,0.1022,'^k','MarkerSize',10,'LineWidth',2)
%
%% to stop legend, the line in plotxppaut4p4.m 
% set(hlegend,'FontSize',14);
% is modified by
% set(hlegend,'FontSize',14,'AutoUpdate','off');

%% write text on the curve
% PO
text(0.08,0.1366-0.005,'$s_2$','FontSize',20,'Interpreter','LaTeX')
text(0.08,0.0102+0.007,'$s_2$','FontSize',20,'Interpreter','LaTeX')
% EP
text(0.18,0.1022+0.007,'$s_1$','FontSize',20,'Interpreter','LaTeX')
%% zoom in one
text(0.14,0.08,'HP','FontSize',20)
text(0.14,0.13,'SNLC','FontSize',20)
% %% zoom in two
% text(3.745,1.5,'HP','FontSize',20)
% text(3.725,2.3,'SNLC','FontSize',20)