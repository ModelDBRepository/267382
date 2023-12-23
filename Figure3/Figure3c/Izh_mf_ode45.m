
%% mean-field model
[t,y] = ode45(@(t,y) mf_sys(mu,hw,alpha,gsyn,er,a,b,wjump,tsyn,sjump,I,t,y)',[0,tend],[rint,vint,wint,sint]');
rm = y(:,1);
vm = y(:,2);
wm = y(:,3);
sm = y(:,4);
%
% The end