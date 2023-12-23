
close all
figure(1)

%% size of the figure (width*height), position shown in the screen
fig=gcf; % cf: current figure
fig.Position=[10,10,500,300]; % the first two no. define the position
                        % the last two no. define width*height of the fig.
                        


%% population firing rate
f1b=subplot(2,1,1);
tx=avg_fired_time;

plot(tx,R,'b')                      % network
hold on
plot(time,rm,'r','LineWidth',2);      % mean field
hold off

ylabel('$r(t)$','FontSize',14,'Interpreter','LaTeX')
xlim([0,tend])
ylim([0,0.4])


%% mean recovery variable
% because wm evolves slow with time, but rm and vm fast, it is better to
% plot them respectively.

f1d=subplot(2,1,2);
plot(time,w_mean,'b')           % network
hold on
plot(time,wm,'r','LineWidth',2) % mean field model


% % === plot the highest and lowest amplitudes of PO
% long = length(time);
% start = round(long*2/3);
% 
% up = max(w_mean(start:end))*ones(long,1);
% lo = min(w_mean(start:end))*ones(long,1);
% 
% plot(time,up,'m',time,lo,'m')
% hold off
% ===

ylabel('$\langle w(t) \rangle$','FontSize',14,'Interpreter','LaTeX')
xlabel('Time','Interpreter','LaTeX')
xlim([0,tend])
ylim([0,0.3])


