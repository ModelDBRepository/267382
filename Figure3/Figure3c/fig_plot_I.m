figure(1)
%% size of the figure (width*height), position shown in the screen
fig=gcf; % cf: current figure
fig.Position=[10,10,700,700]; % the first two no. define the position
                        % the last two no. define width*height of the fig.
%% raster plot,randomly selected neurons to plot
f1a=subplot(3,1,1);
N_rand = 300; 
index_rand = ceil(N*rand(N_rand,1)); 
for j=1:N_rand
    select = find(firings(:,2)==index_rand(j));
    % the firing times of the jth neuron in the ylabel of raster plot, 
    
    row_num = length(select);
    nn = j*ones(row_num,1);
    plot(firings(select,1),nn,'.k','MarkerSize',0.5);
 
    hold on
end
ylabel('Neuron \#','Interpreter','LaTeX')
xlim([0,tend])
%
%% firing rate
f1b=subplot(3,1,2);
%tend_f = ceil(0.03*length(time)); % time span for fast variables
plot(avg_fired_time,R,'b')       % network
hold on
plot(t,rm,'r','LineWidth',2); % mean field
ylabel('$r(t)$','FontSize',14,'Interpreter','LaTeX')
legend('Network','Mean-field model')
xlim([0,tend])
%
%% external current
f1c=subplot(3,1,3);
plot(t,I_t,'k','LineWidth',2) 
ylabel('$ I_{\mathrm{ext}} $','FontSize',14,'Interpreter','LaTeX')
xlabel('Time','Interpreter','LaTeX')
xlim([0,tend])
ylim([-0.05,0.15])
%

%% adds letters (a), (b), ... to subplots in a figure.
%AddLetters2Plots({f1a, f1b,f1c,f1d}, {'(a)','(b)','(c)','(d)'})
%
%% the heterogeneous source
figure(3)
neuron_index = 1:N;
plot(neuron_index,eta)
ylabel('$\eta$','FontSize',14,'Interpreter','LaTeX')
xlabel('Neuron index','FontSize',14,'Interpreter','LaTeX')


%% The end


