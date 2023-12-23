% By Liang Chen
% May 13, 2022
% updated, May 27, 2022
%
% Sample bifurcation of the network of two Izhikevich populations
% Sample points obtained by runing code in folder "TimeSeries_MATLAB" for
     % SA-WA populations

%% open the bifurcation diagram of the mean-field model

openfig('bif_wm_mu_q.fig')  % population q

%% EP 

x1 = [0.18; 0.16; 0.14; 0.02; 0.04;]; % mu
y1q = [0.0191; 0.0180; 0.0168; 0.00089; 0.0010]; % population q

plot(x1,y1q,'*k','MarkerSize',10,'LineWidth',1)


%% PO 

x3    = [0.055; 0.06; 0.08; 0.1; 0.12; 0.13; 0.135];

y3q_h = [0.0152; 0.0155; 0.0164; 0.0173; 0.0181; 0.0185; 0.0187];
y3q_l = [0.0012; 0.0014; 0.0037; 0.0066; 0.0087; 0.0096; 0.01];

plot(x3,y3q_h,'*k','MarkerSize',10,'LineWidth',1)
plot(x3,y3q_l,'*k','MarkerSize',10,'LineWidth',1)

%%

xlabel('$\bar \eta_p = \bar \eta_q = \bar \eta$','FontSize',14,'Interpreter','LaTeX')
ylabel('$\langle w \rangle_q$','FontSize',14,'Interpreter','LaTeX')

%% particular points to demonstrate in time series
s1_x = 0.18;
s1_y = 0.0191;

plot(s1_x,s1_y,'*m','MarkerSize',10,'LineWidth',1)

text(s1_x-0.004,s1_y+0.0015,'$s_1$','FontSize',20,'Interpreter','LaTeX')

%===
s2_x = 0.08;
s2_h = 0.0164;
s2_l = 0.0037;

plot(s2_x,s2_h,'*m','MarkerSize',10,'LineWidth',1)
plot(s2_x,s2_l,'*m','MarkerSize',10,'LineWidth',1)

text(s2_x-0.004,s2_h+0.0014,'$s_2$','FontSize',20,'Interpreter','LaTeX')
text(s2_x-0.004,s2_l-0.0012,'$s_2$','FontSize',20,'Interpreter','LaTeX')

%% ===== The End ======
