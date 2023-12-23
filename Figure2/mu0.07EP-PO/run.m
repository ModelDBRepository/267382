
clc;clear;close all

load Izh_mf_network.mat

figure_plot

saveas(gcf,'before.fig')

close all

mf_revised

figure_plot

saveas(gcf,'after.fig')
