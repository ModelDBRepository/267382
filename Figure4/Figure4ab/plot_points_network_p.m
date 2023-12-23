% By Liang Chen
% May 13, 2022
% updated, May 27, 2022
%
% Sample bifurcation of the network of two Izhikevich populations
% Sample points obtained by runing code in folder "TimeSeries_MATLAB" for
     % SA-WA populations

%% open the bifurcation diagram of the mean-field model

openfig('bif_wm_mu_p.fig')  % population p

%% EP 

x1 = [0.18; 0.16; 0.14; 0.02; 0.04;]; % mu
y1p = [0.2531; 0.2341; 0.2130; 0.0162; 0.0190];  % population p

plot(x1,y1p,'*k','MarkerSize',10,'LineWidth',1)


%% PO 

x3    = [0.055; 0.06; 0.08; 0.1; 0.12; 0.13; 0.135];

y3p_h = [0.1376; 0.1424; 0.1614; 0.1804; 0.1990; 0.2083; 0.2129];
y3p_l = [0.0308; 0.0386; 0.0646; 0.0865; 0.1068; 0.1165; 0.12];

plot(x3,y3p_h,'*k','MarkerSize',10,'LineWidth',1)
plot(x3,y3p_l,'*k','MarkerSize',10,'LineWidth',1)


%%

xlabel('$\bar \eta_p = \bar \eta_q = \bar \eta$','FontSize',14,'Interpreter','LaTeX')
ylabel('$\langle w \rangle_p$','FontSize',14,'Interpreter','LaTeX')


%% particular points to demonstrate in time series
s1_x = 0.18;
s1_y = 0.2531;

plot(s1_x,s1_y,'*m','MarkerSize',10,'LineWidth',1)

text(s1_x-0.004,s1_y+0.015,'$s_1$','FontSize',20,'Interpreter','LaTeX')

%===
s2_x = 0.08;
s2_h = 0.1614;
s2_l = 0.0646;

plot(s2_x,s2_h,'*m','MarkerSize',10,'LineWidth',1)
plot(s2_x,s2_l,'*m','MarkerSize',10,'LineWidth',1)

text(s2_x-0.004,s2_h+0.014,'$s_2$','FontSize',20,'Interpreter','LaTeX')
text(s2_x-0.004,s2_l-0.012,'$s_2$','FontSize',20,'Interpreter','LaTeX')

%% ===== The End ======
