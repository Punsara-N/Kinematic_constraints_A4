%% consts and parameters
acc_g = 9.81;
rho = 1.225; %1.218; 
V = 30;
qbar_acm = 0.5*rho*V^2;

I_yy_rig = 1.6956; %1.65991; 
I_yy_acm = 0.038; %0.047642;

mass_acm = 1.97;
l_acm = 0.8;
l_cmp = 0.38;

S_cmp = 0.1254;
b_cmp = 0.7;
CLa_cmp = 1.73;
CLde_cmp = 1.42;
CLq_cmp = 4.69;

m_rig = 7.5588;
b = 0.0525879;

S_acm = 0.0849;
c_acm = 0.143;
CLa_acm = 3.8;
CLq_acm = 33;
CLde_acm = 0.4431009;
Cma_acm = -0.528;
Cmq_acm = -8.14;
Cmde_acm = -0.84;

scale = 14;
k_inertia = 1;
S_ACM = S_acm * scale^2;
c_ACM = c_acm * scale;
V_ACM = V * scale;
I_yy_ACM = I_yy_acm * scale^5 / k_inertia;
mass_ACM = mass_acm * scale^3 / k_inertia;
rho_ACM = rho/k_inertia;
qbar_ACM = 0.5*rho_ACM*V_ACM^2;

V_ACM2 = V *sqrt(scale);
qbar_ACM2 = 0.5*rho_ACM*V_ACM2^2;

cg_shift = 0.0;
k_mass = 0.8325*0 + 1;

%% Servo model (updated 02-11-2015)
w = 30;
ksi = 0.8;
K2_svo_cmp=w*(2*ksi);
K1_svo_cmp=w/(2*ksi);
max_defl_sat_cmp = 40/57.3;
max_rate_sat_cmp = 140/57.3;

w = 20;
ksi = 0.8;
K2_svo_acm=w*(2*ksi);
K1_svo_acm=w/(2*ksi);
max_defl_sat_acm = 40/57.3;
max_rate_sat_acm = 300/57.3;

%% servo model
w = 30;
ksi = 0.8;
K2=w*(2*ksi);
K1=w/(2*ksi);
K12 = w^2;

% x = [delta delta_dot]
% u = delta_c
% y = delta
A_act = [0 1; -K12 -K2];
B_act = [0;K12];
C_act = [1 0];
D_act = 0;
%sys_act = ss(A_act,B_act,C_act,D_act);
sys_act = 1;

%% 3DoF linear system in flight dynamics
% X = [alpha_acm q_acm tht_acm]
% U = [de_acm]
% Y = [alpha_acm q_acm tht_acm]
A_air = [-qbar_acm*S_acm*CLa_acm/(k_mass*mass_acm*V) 1-qbar_acm*S_acm*CLq_acm/(k_mass*mass_acm*V)*c_acm/(2*V) 0
     qbar_acm*S_acm*c_acm*(Cma_acm+cg_shift*CLa_acm)/I_yy_acm qbar_acm*S_acm*c_acm*Cmq_acm*c_acm/(2*V)/I_yy_acm 0
     0 1 0];
B_air = [-qbar_acm*S_acm*CLde_acm/(k_mass*mass_acm*V);qbar_acm*S_acm*c_acm*Cmde_acm/I_yy_acm;0];
C_air = eye(3);
D_air = zeros(3,1);
linsys_air = ss(A_air,B_air,C_air,D_air)*sys_act;

A_AIR = [-qbar_ACM*S_ACM*CLa_acm/(k_mass*mass_ACM*V_ACM) 1-qbar_ACM*S_ACM*CLq_acm/(k_mass*mass_ACM*V_ACM)*c_ACM/(2*V_ACM) 0
     qbar_ACM*S_ACM*c_ACM*(Cma_acm+cg_shift*CLa_acm)/I_yy_ACM qbar_ACM*S_ACM*c_ACM*Cmq_acm*c_ACM/(2*V_ACM)/I_yy_ACM 0
     0 1 0];
B_AIR = [-qbar_ACM*S_ACM*CLde_acm/(k_mass*mass_ACM*V_ACM);qbar_ACM*S_ACM*c_ACM*Cmde_acm/I_yy_ACM;0];
C_AIR = eye(3);
D_AIR = zeros(3,1);
linsys_AIR = ss(A_AIR,B_AIR,C_AIR,D_AIR)*sys_act;

% Checking the difference between the above two models
A_air - A_AIR
B_air - B_AIR

A_AIR2 = [-qbar_ACM2*S_ACM*CLa_acm/(k_mass*mass_ACM*V_ACM2) 1-qbar_ACM2*S_ACM*CLq_acm/(k_mass*mass_ACM*V_ACM2)*c_ACM/(2*V_ACM2) 0
     qbar_ACM2*S_ACM*c_ACM*(Cma_acm+cg_shift*CLa_acm)/I_yy_ACM qbar_ACM2*S_ACM*c_ACM*Cmq_acm*c_ACM/(2*V_ACM2)/I_yy_ACM 0
     0 1 0];
B_AIR2 = [-qbar_ACM2*S_ACM*CLde_acm/(k_mass*mass_ACM*V_ACM2);qbar_ACM2*S_ACM*c_ACM*Cmde_acm/I_yy_ACM;0];
linsys_AIR2 = ss(A_AIR2,B_AIR2,C_AIR,D_AIR)*sys_act;

T2 = [1 0 0; 0 scale^-0.5 0;0 0 1];
T1 = inv([scale^-0.5 0 0;0 scale^-1 0; 0 0 scale^-0.5]);
A_air - T1*A_AIR2*T2
B_air - T1*B_AIR2

% X=[alpha, q, tht, h, hdot] Y=[alpha_acm, q_acm, tht_acm, tht_rig, tht_dot_rig]
A_air2 = [-qbar_acm*S_acm*CLa_acm/(k_mass*mass_acm*V) 1-qbar_acm*S_acm*CLq_acm/(k_mass*mass_acm*V)*c_acm/(2*V) 0 0 0
     qbar_acm*S_acm*c_acm*(Cma_acm+cg_shift*CLa_acm)/I_yy_acm qbar_acm*S_acm*c_acm*Cmq_acm*c_acm/(2*V)/I_yy_acm 0 0 0
     0 1 0 0 0
     0 0 0 0 1
     qbar_acm*S_acm*CLa_acm/(k_mass*mass_acm) qbar_acm*S_acm*CLq_acm/(k_mass*mass_acm)*c_acm/(2*V) 0 0 0];
B_air2 = [-qbar_acm*S_acm*CLde_acm/(k_mass*mass_acm*V);qbar_acm*S_acm*c_acm*Cmde_acm/I_yy_acm;0;0;qbar_acm*S_acm*CLde_acm/(k_mass*mass_acm)];
C_air2 = [1 0 0 0 0
          0 1 0 0 0
          0 0 1 0 0
          0 0 0 1/l_acm 0
          0 0 0 0 1/l_acm];
D_air2 = zeros(5,1);
linsys_AIR3 = ss(A_air2,B_air2,C_air2,D_air2)*sys_act;

%% 1DoF linear system when pitch free only
% X = [tht_acm q_acm]
% U = [de_acm]
% Y = [tht_acm q_acm tht_acm]
A_pitchonly = [0 1
     qbar_acm*S_acm*c_acm*Cma_acm/I_yy_acm qbar_acm*S_acm*c_acm*Cmq_acm*c_acm/(2*V)/I_yy_acm];
B_pitchonly = [0;qbar_acm*S_acm*c_acm*Cmde_acm/I_yy_acm];
C_pitchonly = [1 0;0 1;1 0];
D_pitchonly = zeros(3,1);
linsys_pitchonly_noctrl = ss(A_pitchonly,B_pitchonly,C_pitchonly,D_pitchonly)*sys_act;

%% 2DoF linear system when pitch free for both ACM and RIG
% X = [tht_acm tht_dot_acm tht_rig tht_dot_rig]
% U = [de_acm, de_cmp]
% Y = [tht_acm tht_dot_acm tht_rig tht_dot_rig alpha_acm nz_acm]
AA = [0 1 0 0
    qbar_acm*S_acm*c_acm*Cma_acm/I_yy_acm qbar_acm*S_acm*c_acm*Cmq_acm*c_acm/(2*V)/I_yy_acm 0 -qbar_acm*S_acm*c_acm*Cma_acm/I_yy_acm*l_acm/V
     0 0 0 1
     qbar_acm*S_acm*l_acm*CLa_acm/(I_yy_rig+mass_acm*l_acm*l_acm) qbar_acm*S_acm*l_acm*CLq_acm*c_acm/(2*V)/(I_yy_rig+mass_acm*l_acm*l_acm) (-qbar_acm*S_cmp*l_cmp*CLa_cmp-m_rig*acc_g*b*0)/(I_yy_rig+mass_acm*l_acm*l_acm) qbar_acm*S_acm*l_acm*CLa_acm/(I_yy_rig+mass_acm*l_acm*l_acm)*-l_acm/V-qbar_acm*S_cmp*l_cmp*CLq_cmp*b_cmp/(2*V)/(I_yy_rig+mass_acm*l_acm*l_acm)];
% -m_rig*acc_g*b
BB = [0 0;qbar_acm*S_acm*c_acm*Cmde_acm/I_yy_acm 0;0 0;qbar_acm*S_acm*l_acm*CLde_acm/(I_yy_rig+mass_acm*l_acm*l_acm) -qbar_acm*S_cmp*l_cmp*CLde_cmp/(I_yy_rig+mass_acm*l_acm*l_acm)];
CC = [1 0 0 0
      0 1 0 0
      0 0 1 0
      0 0 0 1
      1 0 0 -l_acm/V
     qbar_acm*S_acm*l_acm*CLa_acm/(I_yy_rig+mass_acm*l_acm*l_acm)*l_acm/acc_g qbar_acm*S_acm*l_acm*CLq_acm*c_acm/(2*V)/(I_yy_rig+mass_acm*l_acm*l_acm)*l_acm/acc_g (-qbar_acm*S_cmp*l_cmp*CLa_cmp-m_rig*acc_g*b*0)/(I_yy_rig+mass_acm*l_acm*l_acm)*l_acm/acc_g (qbar_acm*S_acm*l_acm*CLa_acm/(I_yy_rig+mass_acm*l_acm*l_acm)*-l_acm/V-qbar_acm*S_cmp*l_cmp*CLq_cmp*b_cmp/(2*V)/(I_yy_rig+mass_acm*l_acm*l_acm))*l_acm/acc_g];
DD = [0 0
    0 0
    0 0
    0 0
    0 0
    qbar_acm*S_acm*l_acm*CLde_acm/(I_yy_rig+mass_acm*l_acm*l_acm)*l_acm/acc_g -qbar_acm*S_cmp*l_cmp*CLde_cmp/(I_yy_rig+mass_acm*l_acm*l_acm)*l_acm/acc_g];
linsys_2pitch = ss(AA,BB,CC,DD);

linsys_2pitch_noctrl = [0 0 0 0 1 0;0 1 0 0 0 0;1 0 0 0 0 0]*linsys_2pitch*sys_act*[1 0]';

AA_eq = [0 1 0 0
    qbar_acm*S_acm*c_acm*Cma_acm/I_yy_acm qbar_acm*S_acm*c_acm*Cmq_acm*c_acm/(2*V)/I_yy_acm 0 -qbar_acm*S_acm*c_acm*Cma_acm/I_yy_acm*l_acm/V
     0 0 0 1
     qbar_acm*S_acm*l_acm*CLa_acm/(k_mass*mass_acm*l_acm*l_acm) qbar_acm*S_acm*l_acm*CLq_acm*c_acm/(2*V)/(k_mass*mass_acm*l_acm*l_acm) 0 qbar_acm*S_acm*l_acm*CLa_acm/(k_mass*mass_acm*l_acm*l_acm)*-l_acm/V];

k = ((k_mass-1)*mass_acm*l_acm^2-I_yy_rig) / (k_mass*mass_acm*l_acm^2);
k_de_tht_acm = -S_acm*l_acm*CLa_acm/(S_cmp*l_cmp*CLde_cmp) * k;
k_de_q_acm = -c_acm/(2*V)*S_acm*l_acm*CLq_acm/(S_cmp*l_cmp*CLde_cmp) * k;
k_de_tht_cmp = CLa_cmp/CLde_cmp + (m_rig*acc_g*b)/(qbar_acm*S_cmp*l_cmp*CLde_cmp);
k_de_q_cmp = S_acm*l_acm^2*CLa_acm/(V*S_cmp*l_cmp*CLde_cmp) * k + CLq_cmp*b_cmp/(2*V*CLde_cmp);

AA_sfb = AA - BB*[0 0 0 0;k_de_tht_acm k_de_q_acm k_de_tht_cmp k_de_q_cmp];

linsys_2pitch_ctrl_t = [1 0 0 -l_acm/V;0 1 0 0;1 0 0 0]*feedback(ss(AA,BB,eye(4),zeros(4,2)), [0 0 0 0;k_de_tht_acm k_de_q_acm k_de_tht_cmp k_de_q_cmp])*[1 0]';

AA_sfb - AA_eq

nz_de = -qbar_acm*S_cmp*l_cmp*CLde_cmp/(I_yy_rig+mass_acm*l_acm*l_acm)*l_acm/acc_g;
p = [-nz_de 1];

% Feedback for rig inertia and aerodynamics neutralisation
K_de_nz = -acc_g/l_acm/(qbar_acm*S_cmp*l_cmp*CLde_cmp/(I_yy_rig+mass_acm*l_acm*l_acm))*(-I_yy_rig+(k_mass-1)*mass_acm*l_acm*l_acm)/(k_mass*mass_acm*l_acm*l_acm);
K_de_tht = CLa_cmp/CLde_cmp*(I_yy_rig+mass_acm*l_acm*l_acm)/(k_mass*mass_acm*l_acm*l_acm);
K_de_q = CLq_cmp*b_cmp/(2*V)/CLde_cmp*(I_yy_rig+mass_acm*l_acm*l_acm)/(k_mass*mass_acm*l_acm*l_acm);

% K_de_nz2 = I_yy_rig/(qbar_acm*S_cmp*l_cmp*CLde_cmp)*acc_g/l_acm;
% K_de_tht2 = (CLa_cmp/CLde_cmp) + m_rig*acc_g*b/(qbar_acm*S_cmp*l_cmp*CLde_cmp);
% K_de_q2 = (CLq_cmp/CLde_cmp)*(b_cmp/(2*V));

K_de_nz2 = (I_yy_rig+(1-k_mass)*mass_acm*l_acm*l_acm)/(qbar_acm*S_cmp*l_cmp*CLde_cmp)*acc_g/l_acm;
K_de_tht1 = (CLa_cmp/CLde_cmp) + (m_rig*acc_g*b)/(qbar_acm*S_cmp*l_cmp*CLde_cmp);
K_de_q1 = (CLq_cmp/CLde_cmp)*(b_cmp/(2*V));

w_h = 0.1;
ksi_h = 0.8;
s_h=w_h^2;
damp_h = 2*ksi_h*w_h;

K_de_tht3 = (CLa_cmp/CLde_cmp)*s_h;
K_de_q3 = (CLq_cmp/CLde_cmp)*(b_cmp/(2*V))*damp_h;

K_de_tht2 = K_de_tht1 - K_de_tht3*0;
K_de_q2 = K_de_q1 - K_de_q3*0;

% (CLa_cmp/CLde_cmp)
% (m_rig*acc_g*b)/(qbar_acm*S_cmp*l_cmp*CLde_cmp)

systemnames = 'linsys_2pitch p K_de_nz K_de_tht K_de_q sys_act';
inputvar = '[de_acm]';
outputvar = '[linsys_2pitch(5);linsys_2pitch(2);linsys_2pitch(1)]';
input_to_linsys_2pitch = '[de_acm;sys_act]';
input_to_sys_act = '[-K_de_nz-K_de_tht-K_de_q]';
input_to_p = '[sys_act;linsys_2pitch(6)]';
input_to_K_de_nz = '[p]';
input_to_K_de_tht = '[linsys_2pitch(3)]';
input_to_K_de_q = '[linsys_2pitch(4)]';
linsys_2pitch_ctrl = sysic;

%linsys_2pitch_ctrl.a - AA_eq

sys_2pitch2_ntrl = feedback(linsys_2pitch, [0 0 0 0 0 0; 0 0 K_de_tht2 K_de_q2 0  K_de_nz2]);
sys_2pitch2_ctrl = [0 0 0 0 1 0;0 1 0 0 0 0;1 0 0 0 0 0;0 0 1 0 0 0;0 0 0 1 0 0]*sys_2pitch2_ntrl*[1 0]';

sys_2pitch2_ctrl.a - AA_eq

acc_hdot = qbar_acm*S_acm*CLa_acm/(k_mass*mass_acm);
acc_hdot2 = qbar_acm*S_acm*CLq_acm*c_acm/(2*V)/(k_mass*mass_acm);

A_dm = -acc_hdot/V;
B_dm = [0 -acc_hdot2/V -acc_hdot/V];
C_dm = [1;0;0];
D_dm = [1 0 0;0 1 0;0 0 1];
sys_dm = ss(A_dm,B_dm,C_dm,D_dm);

lin_pitchonly_ctrl = feedback(sys_dm*linsys_pitchonly_noctrl, [-Cma_acm/Cmde_acm 0 Cma_acm/Cmde_acm]);

% ltiview('step',linsys_AIR,linsys_pitchonly_noctrl,linsys_2pitch_noctrl,linsys_2pitch_ctrl,lin_pitchonly_ctrl,linsys_2pitch_ctrl_t,sys_2pitch2_ctrl,5);

%% Friction model
% Fs_mp = 2.74E-4;
% Fc_mp = 1.68E-3;
% omega2_mp = 3.94E-4;
% 
% Fs_rp = 2.79E-2;
% Fc_rp = 3.39E-2;
% omega2_rp = 4.10E-3;
% 
% % Fr_mp = sign(theta_dot_mp)*(Fs_mp+Fc_mp)/2 + omega2_mp.*theta_dot_mp; % y = c + m*x
% % Fr_rp = sign(theta_dot_rp)*(Fs_rp+Fc_rp)/2 + omega2_rp.*theta_dot_rp;
% 
% Fr_mp_1=(Fs_mp+Fc_mp)/2;
% Fr_mp_2=omega2_mp;
% 
% Fr_rp_1=(Fs_rp+Fc_rp)/2;
% Fr_rp_2=omega2_rp;