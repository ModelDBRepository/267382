
clear; close all

load Izh_mf_network.mat

figure(1)
%% size of the figure (width*height), position shown in the screen

fig=gcf; 
fig.Position=[10,10,1000,180]; 

%% firing rate

f1b=subplot(1,2,1);
%tend_f = ceil(0.03*length(time)); % time span for fast variables
plot(avg_fired_time,R,'b')       % network
hold on
plot(t,rm,'r','LineWidth',2); % mean field

xlabel('Time','Interpreter','LaTeX')
ylabel('$r(t)$','FontSize',14,'Interpreter','LaTeX')
legend('Network','Mean-field model')
xlim([0,tend])
ylim([0,0.4])

%% mean recovery variable

% f1d=subplot(2,1,2);
% plot(t,wm,'r','LineWidth',2) % mean field
% hold on 
% plot(time,w_mean,'b')           % network
% ylabel('$\langle w(t) \rangle$','FontSize',14,'Interpreter','LaTeX')
% xlabel('Time','Interpreter','LaTeX')
% axis([0,tend,0 0.2])

%% adds letters (a), (b), ... to subplots in a figure.
%AddLetters2Plots({f1a, f1b,f1c,f1d}, {'(a)','(b)','(c)','(d)'})

%% the heterogeneous source

% figure(2)
% fig=gcf; 
% fig.Position=[10,10,500,200]; 

subplot(1,2,2);
histogram(eta,50000,'Normalization','probability'); 

xlabel('$\eta$','FontSize',14,'Interpreter','LaTeX')
ylabel('Percent occurence','FontSize',14,'Interpreter','LaTeX')

xlim([-0.5,0.5])
% set(gca,'ytick',[])
