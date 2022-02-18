clear,clc,close all;

%% Reference dimensions/properties

% Scale factor for subscale model (T. G. Gainer and S. Hoffman, Summary of Transformation Equations and Equations of Motion Used in Free-Flight and Wind-Tunnel Data Reduction and Analysis, NASA SP-3070, 1972)
m_a_hawk_rounded = 2.0;                         % kg
m_a_fullscale = 7973.2467;                      % kg, 17578 lb
R_l = (m_a_hawk_rounded/m_a_fullscale)^(1/3);   % (6.31% scale)
R_rho = 1;                                      % Both aircraft are assumed to be at sea level

% Reference dimensions (A 4D, taken from Flight Stability and Automatic Control, Robert C. Nelson, 1989, page 254)
c_a_fullscale = 3.29184;     	% m,    10.8 ft
S_a_fullscale = 24.1548;     	% m^2,  260 ft^2
b_a_fullscale = 8.382;          % m,    27.5 ft

% Scaled reference dimensions (to match mass of the Hawk, A 4D 6.31% scale)
c_a = c_a_fullscale*R_l;     	% m,    10.8 ft    	(0.2076 m)
S_a = S_a_fullscale*R_l^2;   	% m^2,  260 ft^2  	(0.0961 m^2)
b_a = b_a_fullscale*R_l;       	% m,    27.5 ft   	(0.5286 m)

% Mass
m_a = 7973.2467*R_rho*R_l^3;	% kg, 17578 lb              (6.31% scale: 2.0000 kg)
Ixx_a = 10968.5672*R_rho*R_l^5;	% kg.m^2, 8090 slug.ft^2    (6.31% scale: 0.0109 kg.m^2)
Iyy_a = 35115.6849*R_rho*R_l^5;	% kg.m^2, 25900 slug.ft^2   (6.31% scale: 0.0350 kg.m^2)
Izz_a = 39589.8841*R_rho*R_l^5;	% kg.m^2, 29200 slug.ft^2   (6.31% scale: 0.0395 kg.m^2)
Ixy_a = 0*R_rho*R_l^5;        	% kg.m^2                    (6.31% scale: 0.0000 kg.m^2)
Ixz_a = 1762.56333*R_rho*R_l^5;	% kg.m^2, 1300 slug.ft^2    (6.31% scale: 0.0018 kg.m^2)
Iyz_a = 0*R_rho*R_l^5;         	% kg.m^2                    (6.31% scale: 0.0000 kg.m^2)
g   = 9.81;                     % m/s^2

%% Flow conditions

V = 30;         % m/s
rho = 1.225;    % Density (kg/m^3)

%% Lateral dimensional derivatives (A 4D, M = 0.4, sea level, taken from Flight Stability and Automatic Control, Robert C. Nelson, 1989, page 254)
% Wind axes

CY_beta         = -0.98;
Cl_beta         = -0.12;
Cn_beta         = 0.25;
Cl_p            = -0.26;
Cn_p            = 0.022;
Cl_r            = 0.14;
Cn_r            = -0.35;
Cl_dail         = -0.08;    % Sign changed for convention
Cn_dail         = -0.06;    % Sign changed for convention
CY_drud         = 0.17;
Cl_drud         = 0.105;    % Sign changed for convention
Cn_drud         = -0.032;   % Sign changed for convention

% CL = CL0 + CL_alpha*alpha + CL_alpha_dot*alpha_dot*(c_a/(2*V)) + CL_q*q*(c_a/(2*V)) + CL_dele*dele;
% CD = CD0 + CD_alpha*alpha;
% CY = CY_beta*beta + CY_drud*drud;
% Cl = Cl_beta*beta + Cl_p*p*(b_a/(2*V)) + Cl_r*r*(b_a/(2*V)) + Cl_dail*dail + Cl_drud*drud;
% Cm = Cm_alpha*alpha + Cm_alpha_dot*alpha_dot*(c_a/(2*V)) + Cm_q*q*(c_a/(2*V)) + Cm_dele*dele;
% Cn = Cn_beta*beta + Cn_p*p*(b_a/(2*V)) + Cn_r*r*(b_a/(2*V)) + Cn_dail*dail + Cn_drud*drud;

% Y_wind=0.5*rho*V^2*S_a*CY;
% l_wind=0.5*rho*V^2*S_a*b_a*Cl;
% n_wind=0.5*rho*V^2*S_a*b_a*Cn;

%% Version 2:Linear state-space model from Cook (page 183, 520-521) (States: v, p, r, phi)
m_dash      = m_a/(0.5*rho*V*S_a);
Ixx_dash    = Ixx_a/(0.5*rho*V*S_a*b_a);
Iyy_dash    = Iyy_a/(0.5*rho*V*S_a*c_a);
Izz_dash    = Izz_a/(0.5*rho*V*S_a*b_a);
Ixz_dash    = Ixz_a/(0.5*rho*V*S_a*b_a);

y_v     = (CY_beta)/m_dash; 
y_p     = 0;
y_r     = -V;
y_phi   = g;
y_da    = 0;
y_dr    = CY_drud*V/m_dash;

l_v     = (Izz_dash*Cl_beta + Ixz_dash*Cn_beta)/(Ixx_dash*Izz_dash-Ixz_dash^2);
l_p     = 0.5*(Izz_dash*Cl_p + Ixz_dash*Cn_p)*b_a/(Ixx_dash*Izz_dash-Ixz_dash^2);
l_r     = 0.5*(Izz_dash*Cl_r + Ixz_dash*Cn_r)*b_a/(Ixx_dash*Izz_dash-Ixz_dash^2);
l_phi   = 0;
l_da    = V*(Izz_dash*Cl_dail + Ixz_dash*Cn_dail)/(Ixx_dash*Izz_dash-Ixz_dash^2);
l_dr    = V*(Izz_dash*Cl_drud + Ixz_dash*Cn_drud)/(Ixx_dash*Izz_dash-Ixz_dash^2);

n_v     = (Ixx_dash*Cn_beta + Ixz_dash*Cl_beta)/(Ixx_dash*Izz_dash-Ixz_dash^2);
n_p     = 0.5*(Ixx_dash*Cn_p + Ixz_dash*Cl_p)*b_a/(Ixx_dash*Izz_dash-Ixz_dash^2);
n_r     = 0.5*(Ixx_dash*Cn_r + Ixz_dash*Cl_r)*b_a/(Ixx_dash*Izz_dash-Ixz_dash^2);
n_phi   = 0;
n_da    = V*(Ixx_dash*Cn_dail + Ixz_dash*Cl_dail)/(Ixx_dash*Izz_dash-Ixz_dash^2);
n_dr    = V*(Ixx_dash*Cn_drud + Ixz_dash*Cl_drud)/(Ixx_dash*Izz_dash-Ixz_dash^2);

A = [  	y_v     y_p     y_r     y_phi
        l_v     l_p     l_r     l_phi
        n_v     n_p     n_r     n_phi
        0       1       0       0       ];
    
B = [   y_da    y_dr
        l_da    l_dr
        n_da    n_dr
        0       0       ];
    
A,B

%% Version 1: Linear state-space model from Cook (page 183, 520-521) (States: v, p, r, phi)
% y_v     = ((rho*V*S_a)/(2*m_a))*CY_beta;
% y_p     = 0;
% y_r     = -30; % ???
% y_phi   = g;
% y_da    = 0;
% y_dr    = ((rho*V^2*S_a)/(2*m_a))*CY_drud;
% 
% l_v     = ((rho*V*S_a*b_a)/(2*Ixx_a))*Cl_beta;
% l_p     = ((rho*V*S_a*b_a^2)/(4*Ixx_a))*Cl_p;
% l_r     = ((rho*V*S_a*b_a^2)/(4*Ixx_a))*Cl_r;
% l_phi   = 0;
% l_da    = ((rho*V^2*S_a*b_a)/(2*Ixx_a))*Cl_dail;
% l_dr    = ((rho*V^2*S_a*b_a)/(2*Ixx_a))*Cl_drud;
% 
% n_v     = ((rho*V*S_a*b_a)/(2*Izz_a))*Cn_beta;
% n_p     = ((rho*V*S_a*b_a^2)/(4*Izz_a))*Cn_p;
% n_r     = ((rho*V*S_a*b_a^2)/(4*Izz_a))*Cn_r;
% n_phi   = 0;
% n_da    = ((rho*V^2*S_a*b_a)/(2*Izz_a))*Cn_dail;
% n_dr    = ((rho*V^2*S_a*b_a)/(2*Izz_a))*Cn_drud;
% 
% A = [  	y_v     y_p     y_r     y_phi
%         l_v     l_p     l_r     l_phi
%         n_v     n_p     n_r     n_phi
%         0       1       0       0       ];
%     
% B = [   y_da    y_dr
%         l_da    l_dr
%         n_da    n_dr
%         0       0       ];
%     
% A,B

[Wn,zeta,P] = damp(A); % Wn = Vector containing the natural frequencies of each pole, zeta = Vector containing the damping ratios of each pole, P = Vector containing the poles
damp(A)

Wn

Wd = Wn.*(1-zeta.*zeta).^0.5

% Equation for time constant
tau = 1./(zeta.*Wn)