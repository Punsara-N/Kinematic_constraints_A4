% THRUST VECTORING MODEL.
% The calculation of forces and moments arisig from propulsion
% system specified with reference to body axes.
% It is assumed that there are two engines, placed symmetrically
% with respect to the x-z body axis plane, each capable of being
% set to its own thrust value ad nozzle angle (in both the yaw and
% and the pitch sense relative to body axes) independant of the
% other engine/nozzle configuration.
%
% Notations and thrust vectoring geometry are taken from:
% M.H.Lowenberg "Bifurcation Analysis for Aircraft Dynamics"
% Report No.495, University of Bristol, Department of Aerospace
% Engineering, for DRA - Control and Simulation Flight Systems
% Department, Agr. No.2034/131 Bedford, June, 1994.
%
% Tp - thrust vector from port nozzle (N);
% Ts - thrust vector from starboard nozzle (N);
% DELTA_pp - port nozzle pitch angle
%            (positive nozzle outlet down)(deg);
% DELTA_py - port nozzle yaw angle
%            (positive nozzle outlet to port)(deg);
% DELTA_sp - starboard nozzle pitch angle
%            (positive nozzle outlet down)(deg);
% DELTA_sy - starboard nozzle yaw angle
%            (positive nozzle outlet to port)(deg);
% xj - position of nozzle hinges relative to center of gravity (c.g.);
%      along x axis (negative aft of c.g.) (m);
% yj - position of nozzle hinges with respect to x-z plane
%      (for starbord nozzle the hinge > 0, for port nozzle < 0)(m);
% zj - position of nozzle hinges relative to c.g. along body z-axis
%      (positive below c.g.) (m);
% Ttot- total thrust force vector          (N);
% Txb - total thrust force along the X axis (N);
% Tyb - total thrust force along the Y axis (N);
% Tzb - total thrust force along the Z axis (N);
% TMtot-total thrust vector moment         (Nm);
% Tlb - total thrust moment about the X axis (Nm);
% Tnb - total thrust moment about the Y axis (Nm);
% Tmb - total thrust moment about the Z axis (Nm);
% Ts  - starboard nozzle vector thrust force (N);
% tcs - starbord engine throttle control (0 < tcs < 1);
% Txs - starboard nozzle thrust force along the X axis (N);
% Tys - starboard nozzle thrust force along the Y axis (N);
% Tzs - starboard nozzle thrust force along the Z axis (N);
% TMs  -starboard nozzle thrust vector moment           (Nm);
% Tls - starboard nozzle thrust moment about the X axis (Nm);
% Tns - starboard nozzle thrust moment about the Y axis (Nm);
% Tms - starboard nozzle thrust moment about the Z axis (Nm);
% Tp  - port nozzle vector thrust force (N);
% tcp - port engine throttle control (0 <= tcp <= 1);
% Txp - port nozzle thrust force along the X axis (N);
% Typ - port nozzle thrust force along the Y axis (N);
% Tzp - port nozzle thrust force along the Z axis (N);
% TMp  -port nozzle thrust vector moment           (Nm);
% Tlp - port nozzle thrust moment about the X axis (Nm);
% Tnp - port nozzle thrust moment about the Y axis (Nm);
% Tmp - port nozzle thrust moment about the Z axis (Nm);
%
xj=-5.0;
yj= 0.8;
zj= 0.5;
Rs=[ 0 -zj   yj
    zj   0  -xj
   -yj  xj    0 ];
Rp=[  0 -zj  -yj
     zj   0  -xj
     yj  xj    0 ];
cs_dpp=cos(DELTA_pp/57.3);
sn_dpp=sin(DELTA_pp/57.3);
cs_dpy=cos(DELTA_py/57.3);
sn_dpy=sin(DELTA_py/57.3);
cs_dsp=cos(DELTA_sp/57.3);
sn_dsp=sin(DELTA_sp/57.3);
cs_dsy=cos(DELTA_sy/57.3);
sn_dsy=sin(DELTA_sy/57.3);
Tsu=[cs_dsp.*cs_dsy cs_dsp.*sn_dsy -sn_dsp]';
Tpu=[cs_dpp.*cs_dpy cs_dpp.*sn_dpy -sn_dpp]';
Ts=thrust(H,M,tcs);
Tp=thrust(H,M,tcp);
Tsv=Ts*Tsu;
Tpv=Tp*Tpu;
TMs=Rs*Tsv;
TMp=Rp*Tpv;
Ttot=Tsv+Tpv;
TMtot=TMs+TMp;




