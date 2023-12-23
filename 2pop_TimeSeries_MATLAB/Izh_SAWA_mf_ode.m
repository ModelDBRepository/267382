% Integration of the mean-field model of two populations
% By Liang Chen
% Nov. 5, 2021
%
%% initial conditions:
rint1 = 0; 
vint1 = 0; 
wint1 = 0;
sint1 = 0;
%
rint2 = 0;
vint2 = 0;
wint2 = 0;
sint2 = 0;
%sm = sm + (1-sm).*(sm>1);    % to bound sm in [0,1];
%
%% integration
[t,y] = ode45(@(t,y) mf_sys_2p(p1,p2,gsyn11,gsyn12,gsyn21,gsyn22,mu1,hw1,mu2,hw2,alpha,Iext1,Iext2,er,a1,a2,b,wjump1,wjump2,tsyn,sjump,t,y)',[0,tend],[rint1,vint1,wint1,sint1,rint2,vint2,wint2,sint2]');
%
%% output of variables
rm1 = y(:,1);
vm1 = y(:,2);
wm1 = y(:,3);
sm1 = y(:,4);
%
rm2 = y(:,5);
vm2 = y(:,6);
wm2 = y(:,7);
sm2 = y(:,8);
