% IC
rm = zeros(1,tend/dt+1);
vm = zeros(1,tend/dt+1);
wm = b*vm;
sm = zeros(1,tend/dt+1);
sm = sm + (1-sm).*(sm>1);    % to bound sm in [0,1];
%
for i = 1:tend/dt
    rm(i+1) = rm(i) + dt*(hw/pi + 2*rm(i)*vm(i) - rm(i)*(gsyn*sm(i) + alpha));
    vm(i+1) = vm(i) + dt*(vm(i)^2 - alpha*vm(i) + gsyn*sm(i)*(er - vm(i))...
                                          - pi^2*rm(i)^2 - wm(i) + mu + I);
    wm(i+1) = wm(i) + dt*(a*(b*vm(i) - wm(i)) + wjump*rm(i));
    sm(i+1) = sm(i) + dt*(-sm(i)/tsyn + sjump*rm(i)); 
    sm = sm + (1-sm).*(sm>1);  % to bound sm in [0,1];
end

t = time;
