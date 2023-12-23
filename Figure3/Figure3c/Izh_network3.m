% By Liang Chen, 
% Updated on Sep. 8, 2021
%
% introduce exact refractory time: from v(>= vpeak) to infinity, from -infinity to vreset 
% dimensionless network model
%
% the algorithm is the same as QIF_network3.m
%
%% all-to-all coupling with the same weights
SMAX = sjump*ones(N,N);  
neff = N;                                                    
%
%% Simulation, Euler integration
%
%fired_inf = find(v >= vinf);
for i = 1:tend/dt+1
    v_ = v;                % V_ at the time (i-1)*dt, V at the time i*dt
    w_ = w;
    s_ = s;
    sstore(i) = s(1);
    
    %%
    n_ref = find(v_ >= vreset & v_ <= vpeak); % neurons not in the refractory period
    v_mean(i) = mean(v_(n_ref));  % at the time (i-1)*dt
    w_mean(i) = mean(w_(n_ref));
    
    %% 
    fired_inf = find(v_ >= vinf);
    firings = [firings; (i-1)*dt + 0*fired_inf, fired_inf];

    v(fired_inf) = -v_(fired_inf);
    w(fired_inf) = w_(fired_inf) + wjump;
    
    %% 
    n_fired = find(v_ < vinf); % neurons not fire
    rhs = v_(n_fired).*(v_(n_fired) - alpha) - w_(n_fired) + eta(n_fired)...
                                + I + gsyn*(er - v_(n_fired)).*s_(n_fired);
    v(n_fired) = v_(n_fired) + dt*rhs;
    w(n_fired) = w_(n_fired) + dt*(a*(b*v_(n_fired) - w_(n_fired)));
    
    
    s(n_fired) = s_(n_fired) + dt*(-s_(n_fired)/tsyn) + sum(SMAX(n_fired,fired_inf),2)/neff; % row sum 
    s = s + (1-s).*(s>1);  % to bound s in [0,1];
     
end
%
%% calculation of the instantaneous firing rate
twin = 2*10^(-2);
fired_time = firings(:,1);
%
tmax = find(fired_time <= fired_time(end) - twin);
% tmax(1): the first time index when fired_time + twin > fired_time(end)
fired_num = zeros(tmax(end)+1,1); 
fired_num(1) = length(find(fired_time < twin));
%
for i = 1:tmax(end)
    fired_num(i+1) = length(find(fired_time >= fired_time(i) & fired_time < twin + fired_time(i)));    
end
avg_fired_time = [0;fired_time(1:tmax(end))];
R = fired_num/twin/N; % the firing rate
%
% The end


