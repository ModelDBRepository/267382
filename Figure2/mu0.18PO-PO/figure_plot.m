
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
plot(t,rm,'r','LineWidth',2);      % mean field
hold off

% [up,lo]= envelope(R,300,'peak');    
% % % envelop of R(t), 'peak' can be changed to 'rms', but here, 
%       % I prefer 'peak' adding smoothdata below
% 
% ups = smoothdata(up);
% los = smoothdata(lo);
% plot(tx,ups,'r',tx,los,'r')
% 
% long = length(tx);
% start = round(long*2/3);
% 
% avg_up = mean(ups(start:end))*ones(long,1);
% avg_lo = mean(los(start:end))*ones(long,1);
% plot(tx,avg_up,'m',tx,avg_lo,'b')


ylabel('$r(t)$','FontSize',14,'Interpreter','LaTeX')
xlim([0,tend])
ylim([0,0.4])
% legend('Network','Mean-field model')

%% mean recovery variable
% because wm evolves slow with time, but rm and vm fast, it is better to
% plot them respectively.

f1d=subplot(2,1,2);
plot(time,w_mean,'b')           % network
hold on
plot(t,wm,'r','LineWidth',2) % mean field model
hold off

ylabel('$\langle w(t) \rangle$','FontSize',14,'Interpreter','LaTeX')
xlabel('Time','Interpreter','LaTeX')
xlim([0,tend])
ylim([0,0.3])



