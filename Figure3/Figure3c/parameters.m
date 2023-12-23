% Liang Chen, May 12, 2021
%
% Upper case for dimensional form, lower case for dimensionless form
% ref. [Nicola2013bif]
%
%% number of neurons
N = 10^4;      
%% dimensional form of the Izhikevich neuron eq.(46)-(49)
% variables: V,W,S
%
% the revovery eq. of W
beta = -1;             % Resonator/Integrator Variable
TW = 200;              % time constant of the adaptation eq.
VR = -65;              % resting membrane potential
%
% the membrane potential eq. of V
C = 250;              % Capacitance
k1 = 2.5;              % spike width factor
VT = VR + 40 - beta/k1; % threshold
Er = 0;               % Reversal Potential 
Gsyn = 200;           % maximal conductanc
Iext = 0;             % extra current
%
% synaptic eq. of S
Sjump = 0.8;
Tsyn = 4;             % synaptic time constant
%
% the resetting rule
Vpeak = 30;
Vreset = -55;  
% the choice Vreset = -Vpeak is not needed, but in this way the observed 
%    mean membrane potential agrees with the theory, consistent with the 
%    definition in (8) of [Montbrio2015]. see [Montbrio2015] appendix A.
Wjump = 200;
%Vinf = Vpeak*10^2; % infinity
%
%
%% the dimensionless Izhikevich neuron eq.(50)-(53) 
% variables
% v = 1 + V/abs(VR);
% w = W/(k*VR*VR);
% s = S; 
%
% the revovery eq. of w
a = C/(TW*k1*abs(VR));
b = beta/(k1*abs(VR));
%
% the membrane potential eq. of v
alpha = 1 + VT/abs(VR);
gsyn = Gsyn/(k1*abs(VR));
er = 1+Er/abs(VR);
I = Iext/(k1*VR*VR);
%
% synaptic eq. of s
tsyn = Tsyn*k1*abs(VR)/C;
sjump = Sjump*C/(k1*abs(VR));  % different from [Nicola2013bif]
%
% the resetting rule
vpeak  = 1 + Vpeak/abs(VR);
vreset = 1 + Vreset/abs(VR);
wjump = Wjump/(k1*VR*VR);
%
%% heterogeneous parameters,Lorentzian distribution 
mu = 0.12;   % center, mu=0.2, EP; mu=0.12, PO, see /XPPAUT_mf/bif_xppaut.ps
hw = 0.02;   % half width 
eta = cauchyrnd(mu,hw,N,1); % the applied current

% eta = zeros(N,1);
% for j = 1:N
%     eta(j) = mu + hw*tan(pi/2*(2*j-N-1)/(N+1)); % typo in
%     % [Montbrio2015], it should be 'tan', not 'atan'
% end
