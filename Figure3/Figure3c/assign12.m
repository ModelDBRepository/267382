%
%% mean-field model
rm = [rm1;rm2];
vm = [vm1;vm2];
wm = [wm1;wm2];
t = [t1;t1(end)+t2];
%
%% network
R=[R1;R2];
v_mean=[v_mean1 v_mean2];
w_mean=[w_mean1 w_mean2];

avg_fired_time=[avg_fired_time1;avg_fired_time1(end)+avg_fired_time2];
time=[time1 time1(end)+time2];
%
firings2 = [firings(:,1)+tend1 firings(:,2)];
firings = [firings1;firings2];
%
%%
tend = tend1+tend2;
I_t = [I1_t;I2_t];