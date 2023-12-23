%% mean-field model
rint = rm(end);
vint = vm(end);
wint = wm(end);
sint = sm(end);
sint = sint + (1-sint).*(sint>1);
%
%% network
% IC 
firings = [];
% others are the end of the first round program
%
%% The end