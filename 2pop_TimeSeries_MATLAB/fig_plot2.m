%% population 1
figure(1)
% =================== raster plot ===============================
% randomly selected neurons to plot 
subplot(3,1,1) 
N1_rand = 300; 
index_rand1 = ceil(N1*rand(N1_rand,1)); 
for j=1:N1_rand
    select1 = find(firings1(:,2)==index_rand1(j));
    % the firing times of the jth neuron in the ylabel of raster plot, 
    
    row_num1 = length(select1);
    nn1 = j*ones(row_num1,1);
    plot(firings1(select1,1),nn1,'.k','MarkerSize',0.1);
    
    hold on
end
ylabel('Neuron \#','Interpreter','LaTeX')
xlim([0,tend])
%
%============== the population firing rate ======================
subplot(3,1,2)
fig(1)= plot(avg_fired_time1,R1,'g');       % network 1
hold on
fig(2)= plot(t,rm1,'r','LineWidth',2);      % mean field model 1 
xlim([0,tend])
ylim([-0.1,0.5])
ylabel('$r$','FontSize',14,'Interpreter','LaTeX')
legend(fig(1:2),'Pop. p','Mean field')
%
%============== mean membrane potential ==========================
subplot(3,1,3)
plot(time,v1_mean,'g');            % network 1
hold on
plot(t,vm1,'r','LineWidth',2);     % mean field 1
xlim([0,tend])
ylim([-0.1,1.5])
ylabel('$\langle v \rangle$','FontSize',14,'Interpreter','LaTeX')
xlabel('Time')
%
%=============== mean adaptation ==================================
% because wm evolves slow with time, but rm and vm fast, it is better to
% plot them respectively.
figure(2)
fig(1)=plot(time,w1_mean,'g');            % network 1
hold on
fig(2)=plot(time,w2_mean,'b');            % network 2
fig(3)=plot(t,wm1,'r');             % mean field 1
plot(t,wm2,'r')             % mean field 2
ylabel('$\langle w \rangle$','FontSize',14,'Interpreter','LaTeX')
xlabel('Time')
legend(fig(1:3),'Pop. p','Pop. q','Mean field')
xlim([0,tend])
ylim([-0.02,0.2])
%
%
%% population 2
figure(3)
% =================== raster plot ===============================
% randomly selected neurons to plot 
subplot(3,1,1)
N2_rand = 300; 
index_rand2 = ceil(N2*rand(N2_rand,1)); 
for j=1:N2_rand
    select2 = find(firings2(:,2)==index_rand2(j));
    % the firing times of the jth neuron in the ylabel of raster plot, 
    
    row_num2 = length(select2);
    nn2 = j*ones(row_num2,1);
    plot(firings2(select2,1),nn2,'.k','MarkerSize',0.1);
    
    hold on
end
ylabel('Neuron \#','Interpreter','LaTeX')
xlim([0,tend])
%
%============== the population firing rate ======================
subplot(3,1,2)
%tend_f = ceil(0.03*length(time)); % time span for fast variables
fig(1)= plot(avg_fired_time2,R2,'b');       % network 2
hold on
fig(2)= plot(t,rm2,'r','LineWidth',2);      % mean field model 2
xlim([0,tend])
ylim([-0.1,0.5])
ylabel('$r$','FontSize',14,'Interpreter','LaTeX')
legend(fig(1:2),'Pop. q','Mean field')
%
%============== mean membrane potential ==========================
subplot(3,1,3) 
plot(time,v2_mean,'b');            % network 2
hold on
plot(t,vm2,'r','LineWidth',2)      % mean field 2
xlim([0,tend])
ylim([-0.1,1.5])
ylabel('$\langle v \rangle$','FontSize',14,'Interpreter','LaTeX')
xlabel('Time')


%% === The End ==========================
