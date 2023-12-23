% By Liang Chen
% May 13, 2022
% updated on May 27, 2022
%
% A sample bifurcation diagram from numerical simulation of the network:
%   star symbols.
% sample points obtained by runing code in folder "TimeSeries_MATLAB"


%% open the bifurcation diagram of the mean-field model obtained by XPPAUT

openfig('wm_mu_MF.fig') 

%% EP higher than HB_hi

% x1 = [0.198; 0.2; 0.23; 0.25; 0.27;];
% y1 = [0.2424; 0.2444; 0.2716; 0.2883; 0.3040];

x1 = [0.2; 0.23; 0.25; 0.27;];
y1 = [0.2444; 0.2716; 0.2883; 0.3040];

plot(x1,y1,'*k','MarkerSize',10,'LineWidth',1)


%% EP lower than HB_low

x2 = [0.01; 0.03; 0.05];
y2 = [0.0153; 0.0170; 0.0204];

plot(x2,y2,'*k','MarkerSize',10,'LineWidth',1)

%% PO around HB_hi

% x3   = [0.191; 0.188; 0.186; 0.184; 0.182; 0.18; 0.15];
% y3_h = [0.2404; 0.2380; 0.2364; 0.2347; 0.2332; 0.2315; 0.2064];
% y3_l = [0.1301; 0.1293; 0.1280; 0.1266; 0.1250; 0.1236; 0.1001];

x3   = [0.191; 0.18; 0.15];
y3_h = [0.2404; 0.2315; 0.2064];
y3_l = [0.1301; 0.1236; 0.1001];

plot(x3,y3_h,'*k','MarkerSize',10,'LineWidth',1)
plot(x3,y3_l,'*k','MarkerSize',10,'LineWidth',1)

%% PO around HB_lo

x4 = [0.075; 0.12; 0.1];
y4_h = [0.1430; 0.1811; 0.1643];
y4_l = [0.0415; 0.0770; 0.0613];

plot(x4,y4_h,'*k','MarkerSize',10,'LineWidth',1)
plot(x4,y4_l,'*k','MarkerSize',10,'LineWidth',1)


%% particular points to demonstrate in time series
s1_x = 0.25;
s1_y = 0.2883;

plot(s1_x,s1_y,'*m','MarkerSize',10,'LineWidth',1)

text(s1_x-0.004,s1_y+0.015,'$s_1$','FontSize',20,'Interpreter','LaTeX')

%===
s2_x = 0.12;
s2_h = 0.1811;
s2_l = 0.0770;

plot(s2_x,s2_h,'*m','MarkerSize',10,'LineWidth',1)
plot(s2_x,s2_l,'*m','MarkerSize',10,'LineWidth',1)

text(s2_x-0.004,s2_h+0.015,'$s_2$','FontSize',20,'Interpreter','LaTeX')
text(s2_x-0.004,s2_l-0.015,'$s_2$','FontSize',20,'Interpreter','LaTeX')

%%

xlabel('$\bar \eta$','FontSize',14,'Interpreter','LaTeX')
ylabel('$\langle w \rangle$','FontSize',14,'Interpreter','LaTeX')

%% =====  The End ===============
