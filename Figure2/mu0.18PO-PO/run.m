
clc;clear;close all

load Izh_mf_network.mat

plot_PO_w

saveas(gcf,'before.fig')

close all

mu = 0.19;

Izh_mf_ode45

figure_plot

saveas(gcf,'after.fig')
