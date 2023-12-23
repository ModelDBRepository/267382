% By Liang Chen
% Oct. 20, 2021
%
% Population 1: subscript 1; Population 2: subscript 2
%
%% Initial conditions
%
% IC  % IC.m
%
rm1 = zeros(1,tend/dt+1); 
vm1 = zeros(1,tend/dt+1); 
wm1 = zeros(1,tend/dt+1);
%
rm2 = zeros(1,tend/dt+1);
vm2 = zeros(1,tend/dt+1);
wm2 = zeros(1,tend/dt+1);
%
sm1 = zeros(1,tend/dt+1);
sm2 = zeros(1,tend/dt+1);
%sm = sm + (1-sm).*(sm>1);    % to bound sm in [0,1];
%
%%
p1 = N1/(N1+N2);
p2 = 1-p1;
%
%%
for i = 1:tend/dt
    gs1 = p1*gsyn11*sm1 + p2*gsyn12*sm2;
    gs2 = p1*gsyn21*sm1 + p2*gsyn22*sm2;
    %
    rm1(i+1) = rm1(i) + dt*(hw1/pi + 2*rm1(i)*vm1(i) - rm1(i)*(gs1(i) + alpha));
    vm1(i+1) = vm1(i) + dt*(vm1(i)^2 - alpha*vm1(i) + gs1(i)*(er - vm1(i)) - pi^2*rm1(i)^2- wm1(i) + mu1 + Iext1);
    wm1(i+1) = wm1(i) + dt*(a1*(b*vm1(i) - wm1(i)) + wjump1*rm1(i));
    sm1(i+1) = sm1(i) + dt*(-sm1(i)/tsyn + sjump*rm1(i)); 
    sm1 = sm1 + (1-sm1).*(sm1>1);  % to bound sm in [0,1];
    %
    rm2(i+1) = rm2(i) + dt*(hw2/pi + 2*rm2(i)*vm2(i) - rm2(i)*(gs2(i) + alpha));
    vm2(i+1) = vm2(i) + dt*(vm2(i)^2 - alpha*vm2(i) + gs2(i)*(er - vm2(i)) - pi^2*rm2(i)^2- wm2(i) + mu2 + Iext2);
    wm2(i+1) = wm2(i) + dt*(a2*(b*vm2(i) - wm2(i)) + wjump2*rm2(i));
    sm2(i+1) = sm2(i) + dt*(-sm2(i)/tsyn + sjump*rm2(i)); 
    sm2 = sm2 + (1-sm2).*(sm2>1);  % to bound sm in [0,1];
end

t = 0:dt:tend;

%% =========  The End =============
