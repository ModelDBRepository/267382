% Mean-field model of two populations
% By Liang Chen
% Nov. 5, 2021
%
function dy = mf_sys_2p(p1,p2,gsyn11,gsyn12,gsyn21,gsyn22,mu1,hw1,mu2,hw2,alpha,Iext1,Iext2,er,a1,a2,b,wjump1,wjump2,tsyn,sjump,t,y) 
%
% The mean field model (no delay):
% r'      = hw/pi + 2*r*v_mean - r*(g*s + alpha)
% v_mean' = -w_mean + mu + v_mean^2 + g*s*(er - v_mean)...
%                                - alpha*v_mean - pi^2*r^2
% w_mean' = a*(b*v_mean - w_mean) + wjump * r
% s'      = -s/ts + sjump*r
%
% The heterogeneous source: the applied current
%     the Lorentzian distribution: mu (center), hw (half width)
%
%==========================================================
%
gs1 = p1*gsyn11*y(4) + p2*gsyn12*y(8);
gs2 = p1*gsyn21*y(4) + p2*gsyn22*y(8);
%
% population 1
dy(1) = hw1/pi + 2*y(1)*y(2) - y(1)*(gs1 + alpha);
dy(2) = y(2)^2 - alpha*y(2) + gs1*(er-y(2)) - pi^2*y(1)^2 -y(3) + mu1 + Iext1;
dy(3) = a1*(b*y(2) - y(3)) + wjump1*y(1);
dy(4) = -y(4)/tsyn + sjump*y(1);
%
% population 2
dy(5) = hw2/pi + 2*y(5)*y(6) - y(5)*(gs2 + alpha);
dy(6) = y(6)^2 - alpha*y(6) + gs2*(er-y(6)) - pi^2*y(5)^2 -y(7) + mu2 + Iext2;
dy(7) = a2*(b*y(6) - y(7)) + wjump2*y(5);
dy(8) = -y(8)/tsyn + sjump*y(5);
%
end

