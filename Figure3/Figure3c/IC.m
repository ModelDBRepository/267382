
%% mean-field model
% IC
rint = 0;
vint = 0;
wint = b*vint;
sint = 0;
sint = sint + (1-sint).*(sint>1);    % to bound sm in [0,1];
%
%% network
% IC 
v  = zeros(N,1);          % membrane potentials
%
v_mean = zeros(1,tend/dt+1);% evolution of the mean membrane potential
%
w = b*v;                    % recovery variable
w_mean = zeros(1,tend/dt+1);% 
%
s = zeros(N,1);             % synaptic gating variable (proportion)
s = s + (1-s).*(s>1);       % to bound s in [0,1] because the synaptic 
%               current is g*s(t)*(er-v), not J*s(t) in [Montbrio2015]
sstore = zeros(1,tend/dt+1); % store the synaptic variable of the first neuron
                             % because of all-to-all connectivity, the
                             % synaptic variable of each neuron is the same
%
% store the spike time and index of neuron to plot the rasterplot
firings = [];
%
% The end