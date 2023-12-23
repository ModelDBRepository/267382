% Liang Chen, May 12, 2021, Updated on Oct. 5, 2021
%
% the dimensional system eq.(59)-(62) in [Nicola2013Bif]
%
% dimensional system: Upper case
% dimensionless syst: lower case
% Population 1: subscript 1; Population 2: subscript 2
% 
% I don't write the vector expression, e.g. v = [v1;v2], to avoid too large
% size of the matrix for Matlab.
%
%
%% Initial conditions
%
v1 = zeros(N1,1); v2 = zeros(N2,1);
w1 = zeros(N1,1); w2 = zeros(N2,1);
s11= zeros(N1,1); s12= zeros(N1,1);
s21= zeros(N2,1); s22= zeros(N2,1);
%
% evolution of the mean variables
v1_mean = zeros(1,tend/dt+1);  v2_mean = zeros(1,tend/dt+1);
w1_mean = zeros(1,tend/dt+1);  w2_mean = zeros(1,tend/dt+1);
%
% evolution of synaptic variables of the first neuron
% because of all-to-all connectivity, each neuron in the same group is the same
sstore11 = zeros(1,tend/dt+1); sstore12 = zeros(1,tend/dt+1);
sstore21 = zeros(1,tend/dt+1); sstore22 = zeros(1,tend/dt+1);

%% synaptic connection weight matrix (dimensionless)
smax11 = sjump*ones(N1,N1); % all-to-all coupling with the same weights
p11 = N1/N;
n11 = N1;

smax12 = sjump*ones(N1,N2);
p12 = N2/N;
n12 = N2;

smax21 = sjump*ones(N2,N1);
p21 = N1/N;
n21 = N1;

smax22 = sjump*ones(N2,N2);
p22 = N2/N;
n22 = N2;
%
%% store the spike time and index of neuron to plot the rasterplot
firings1 = [];
firings2 = [];
%
%% Simulation, Euler integration
%
for i = 1:tend/dt+1
    % restore the previous variable for the Euler integration
    v1_ = v1;                  v2_ = v2;             
    w1_ = w1;                  w2_ = w2;
    s11_ = s11;s12_ = s12;     s21_ = s21;s22_ = s22;
    
    sstore11(i) = s11(1); % store the first neuron. because of all-to-all 
               % connectivity, each neuron in the same group is the same
    sstore12(i) = s12(1);
    sstore21(i) = s21(1);
    sstore22(i) = s22(1);
    %
    %% neurons not in the refractory period vreset < v < vpeak
    n_ref1 = find(v1_ >= vreset & v1_ <= vpeak);  
    v1_mean(i) = mean(v1_(n_ref1));  % at the time (i-1)*dt
    w1_mean(i) = mean(w1_(n_ref1));
    %
    n_ref2 = find(v2_ >= vreset & v2_ <= vpeak); 
    v2_mean(i) = mean(v2_(n_ref2));  % at the time (i-1)*dt
    w2_mean(i) = mean(w2_(n_ref2));
    
    %% neurons fire at vinf
    fired_inf1 = find(v1_ >= vinf);
    firings1 = [firings1; (i-1)*dt + 0*fired_inf1, fired_inf1];
    v1(fired_inf1) = -v1_(fired_inf1);
    w1(fired_inf1) = w1_(fired_inf1) + wjump1;
    %
    fired_inf2 = find(v2_ >= vinf);
    firings2 = [firings2; (i-1)*dt + 0*fired_inf2, fired_inf2];
    v2(fired_inf2) = -v2_(fired_inf2);
    w2(fired_inf2) = w2_(fired_inf2) + wjump2;
    
    %% neurons not fire
    n_fired1 = find(v1_ < vinf); 
    gs1 = p11*gsyn11*s11_(n_fired1) + p12*gsyn12*s12_(n_fired1);
    rhs1 = v1_(n_fired1).*(v1_(n_fired1) - alpha) - w1_(n_fired1) ...
        + eta1(n_fired1) + Iext1 + gs1.*(er - v1_(n_fired1));
    v1(n_fired1) = v1_(n_fired1) + dt*rhs1;
    w1(n_fired1) = w1_(n_fired1) + dt*(a1*(b*v1_(n_fired1) - w1_(n_fired1)));
    %
    n_fired2 = find(v2_ < vinf); 
    gs2 = p21*gsyn21*s21_(n_fired2) + p22*gsyn22*s22_(n_fired2);
    rhs2 = v2_(n_fired2).*(v2_(n_fired2) - alpha) - w2_(n_fired2)...
        + eta2(n_fired2) + Iext2 + gs2.*(er - v2_(n_fired2));
    v2(n_fired2) = v2_(n_fired2) + dt*rhs2;
    w2(n_fired2) = w2_(n_fired2) + dt*(a2*(b*v2_(n_fired2) - w2_(n_fired2)));
    %
    s11(n_fired1) = s11_(n_fired1) + dt*(-s11_(n_fired1)/tsyn) ...
        + sum(smax11(n_fired1,fired_inf1),2)/n11; % row sum 
    s12(n_fired1) = s12_(n_fired1) + dt*(-s12_(n_fired1)/tsyn) ...
        + sum(smax12(n_fired1,fired_inf2),2)/n12; % row sum 
    %
    s21(n_fired2) = s21_(n_fired2) + dt*(-s21_(n_fired2)/tsyn) ...
        + sum(smax21(n_fired2,fired_inf1),2)/n21; % row sum 
    s22(n_fired2) = s22_(n_fired2) + dt*(-s22_(n_fired2)/tsyn) ...
        + sum(smax22(n_fired2,fired_inf2),2)/n22; % row sum 
    %
    % s11 = s21 = s1; s12 = s22 = s2;
    s = [s11 s12; s21 s22];
    s = s + (1-s).*(s>1);   % to bound s in [0,1]
%     s11 = s11 + (1-s11).*(s11>1);  % to bound s in [0,1];
%     s21 = s21 + (1-s21).*(s21>1);
%     s12 = s12 + (1-s12).*(s12>1);
%     s22 = s22 + (1-s22).*(s22>1);
    
end

%% calculation of the instantaneous firing rate
twin = 2*10^(-2);
%% population 1
fired_time1 = firings1(:,1);      
%
tmax1 = find(fired_time1 <= fired_time1(end) - twin);
% tmax(1): the first time index when fired_time + twin > fired_time(end)
fired_num1 = zeros(tmax1(end)+1,1); 
fired_num1(1) = length(find(fired_time1 < twin));
%
for i = 1:tmax1(end)
    fired_num1(i+1) = length(find(fired_time1 >= fired_time1(i) ...
        & fired_time1 < twin + fired_time1(i)));    
end
avg_fired_time1 = [0;fired_time1(1:tmax1(end))];
R1 = fired_num1/twin/N1; % the firing rate

%% population 2    
fired_time2 = firings2(:,1);      
%
tmax2 = find(fired_time2 <= fired_time2(end) - twin);
% tmax(1): the first time index when fired_time + twin > fired_time(end)
fired_num2 = zeros(tmax2(end)+1,1); 
fired_num2(1) = length(find(fired_time2 < twin));
%
for i = 1:tmax2(end)
    fired_num2(i+1) = length(find(fired_time2 >= fired_time2(i) ...
        & fired_time2 < twin + fired_time2(i)));    
end
avg_fired_time2 = [0;fired_time2(1:tmax2(end))];
R2 = fired_num2/twin/N2; % the firing rate    


%% === end ===