% two populations of Izhikevich neurons
% strongly adapting, weakly adapting
%
% Liang Chen, May 15, 2021, 
% updated on Oct. 5, 2021
%
% Upper case for dimensional form, variables: V, W, S 
% lower case for dimensionless form, variables: v, w, s
% Iapp for dimensional syst. I for dimensionless syst.
%
%% Parameters for the dimensional form of the Izhikevich neuron eq.(59)-(62) in [Nicola2013Bif]
%
% the recovery eq.
beta = -1;             % Resonator/Integrator Variable
VR = -65;             % resting membrane potential
%
% the membrane potential eq.
C = 250;              % Capacitance
k1 = 2.5;              % spike width factor
VT = VR + 40 - beta/k1; % threshold         
Er = 0;               % Reversal Potential 
%
% synaptic eq.
Sjump = 0.8;
Tsyn = 4;             % synaptic time constant
%
% the resetting rule
Vpeak = 30;
Vreset = -55;
%
N = 10^4; p1=0.8; p2=1-p1;
% Strongly adapting       Weakly adapting
N1    = N*p1;             N2    = N-N1; % number of neurons in each network
Gsyn11= 200;  Gsyn12=200; Gsyn21= 200; Gsyn22=200; % maximal conductances between populations: [SA-SA SA-WA; WA-SA WA-WA]
TW1   = 200;              TW2   = 20; % time constant of the adaptation eq.
Wjump1= 200;              Wjump2= 100;% adaptation jump
IEXT1 = 0;                IEXT2 = 0;  % external current
%

%
%% Parameters for the dimensionless Izhikevich neuron eq.(50)-(53) in [Nicola2013Bif]
%
% the revovery eq.
a1 = C/(TW1*k1*abs(VR));       a2 = C/(TW2*k1*abs(VR));
b = beta/(k1*abs(VR));
%
% the membrane potential eq.
alpha = 1 + VT/abs(VR);
er = 1+Er/abs(VR);

gsyn11 = Gsyn11/(k1*abs(VR));  gsyn12 = Gsyn12/(k1*abs(VR));
gsyn21 = Gsyn21/(k1*abs(VR));  gsyn22 = Gsyn22/(k1*abs(VR));
%
% the external current
Iext1 = IEXT1/(k1*VR*VR);      Iext2 = IEXT2/(k1*VR*VR);
%

%
% synaptic eq.
tsyn = Tsyn*k1*abs(VR)/C;
sjump = Sjump*C/(k1*abs(VR));  % different from [Nicola2013bif]
%
% the resetting rule
vpeak = 1 + Vpeak/abs(VR);
vreset = 1 + Vreset/abs(VR);
wjump1 = Wjump1/(k1*VR*VR);    wjump2 = Wjump2/(k1*VR*VR);
%
% variables
% v = 1 + V/abs(VR);
% w = W/(k1*VR*VR);
% s = S; 
% T = C/(k1*abs(VR))*t  % T for dimensional system, t for dimensionless
% system
%

%% === end ===