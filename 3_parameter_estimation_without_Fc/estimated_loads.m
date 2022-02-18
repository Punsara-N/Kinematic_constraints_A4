function Estimated_loads_input_params = estimated_loads(param_states)
% This function estimates the aerodynamic forces (in wind axes) and moments
% (in body axes) using the states (translational and rotational
% position/attitude, velocity and acceleration) as well as other
% parameters.

% Parameters/states in param_states array
qa = param_states(1:3,1); % [x; y; z] (m)
qa_dot = param_states(4:6,1); % [x_dot; y_dot; z_dot] (m/s)
qa_dot_dot = param_states(7:9,1); % [x_dot_dot; y_dot_dot; z_dot_dot] (m/s^2)
phi = param_states(10);   % (rad)
theta = param_states(11); % (rad)
psi = param_states(12);   % (rad)
rotation_rates_body = param_states(13:15,1); % [p; q; r] (rad/sec)
rotation_acc_body = param_states(16:18,1); % [p_dot; q_dot; r_dot] (rad/sec^2)
m_a = param_states(19); % Mass (kg)
Ixx = param_states(20); % (kg.m^2)
Iyy = param_states(21); % (kg.m^2)
Izz = param_states(22); % (kg.m^2)
Ixy = param_states(23); % (kg.m^2)
Ixz = param_states(24); % (kg.m^2)
Iyz = param_states(25); % (kg.m^2)
thrust = param_states(26); % Thrust (N)
V_t = param_states(27); % Freestream wind speed (m/s)
dail = param_states(28); % Aileron (rad)
dele = param_states(29); % Elevator (rad)
drud = param_states(30); % Rudder (rad)
b_a = param_states(31);% Wing span (m)
c_a = param_states(32);% Reference cord, MAC (m)
S_a = param_states(33);% Wing area (m^2)
rho = param_states(34);% Density (kg/m^3)

% Transforms vector from body to inertial axes (Transformation from NASA (rotation order: ZYX))
S1 = sin(psi);
C1 = cos(psi);
S2 = sin(theta);
C2 = cos(theta);
S3 = sin(phi);
C3 = cos(phi);

A_b2i = [   C1*C2               C1*S2*S3-S1*C3      C1*S2*C3+S1*S3
    S1*C2               S1*S2*S3+C1*C3      S1*S2*C3-C1*S3
    -S2                 C2*S3               C2*C3           ]; % x0 = A * x3

% Linear accelerations in body axes
qa_dot_dot_body = A_b2i'*qa_dot_dot;

% -> I HAVE TRANSLATIONAL AND ROTATIONAL ACCELERATIONS IN BODY AXES: qa_dot_dot_body AND rotation_acc_body
% -> NEED TRANSLATIONAL ACCELERATIONS, WEIGHT AND THRUST IN WIND AXES

% Calculating alpha and beta
qa_dot_body = A_b2i'*[qa_dot(1)+V_t; qa_dot(2); qa_dot(3)];
V = sqrt((qa_dot_body(1))^2+(qa_dot_body(2))^2+(qa_dot_body(3))^2);
alpha = atan2(qa_dot_body(3),qa_dot_body(1));
beta = asin(qa_dot_body(2)/V);
% -> CHECK ALHPA AND BETA [CORRECT]

% Transforms vector from body to wind axes
psi = -beta;
theta = alpha;
phi = 0;

S1 = sin(psi);
C1 = cos(psi);
S2 = sin(theta);
C2 = cos(theta);
S3 = sin(phi);
C3 = cos(phi);

A_b2w = [   C1*C2               C1*S2*S3-S1*C3      C1*S2*C3+S1*S3
    S1*C2               S1*S2*S3+C1*C3      S1*S2*C3-C1*S3
    -S2                 C2*S3               C2*C3           ]; % x0 = A * x3

qa_dot_dot_wind = A_b2w*qa_dot_dot_body;
W_body = A_b2i'*[0; 0; m_a*9.81];
W_wind = A_b2w*W_body;
T_body = [thrust; 0; 0];
T_wind = A_b2w*T_body;

% -> I HAVE TRANSLATIONAL ACCELERATIONS AND WEIGHT IN WIND AXES!

% -> NEED TO CALCULATE TOTAL FORCES AND MOMENTS ACTING IN BODY AXES USING ACCELERATIONS AND VELOCITES(Cook page 70)
% -> m*(u_dot - r*v + q*w) = X_body
% -> m*(v_dot - p*w + r*u) = Y_body
% -> m*(w_dot - q*u + p*v) = Z_body
% -> Ixx*p_dot - (Iyy-Izz)*q*r - Ixz*(p*q+r_dot) = L_body
% -> Iyy*q_dot + (Ixx-Izz)*p*r + Ixz*(p^2-r^2) = M_body
% -> Izz*r_dot - (Ixx-Iyy)*p*q + Ixz*(q*r-p_dot) = N_body
V_t_body = A_b2i'*[V_t; 0; 0]; % Needed because u, v, w below are pertubation velocities
u = qa_dot_body(1) - V_t_body(1);
v = qa_dot_body(2) - V_t_body(2);
w = qa_dot_body(3) - V_t_body(3);
u_dot = qa_dot_dot_body(1);
v_dot = qa_dot_dot_body(2);
w_dot = qa_dot_dot_body(3);
p = rotation_rates_body(1);
q = rotation_rates_body(2);
r = rotation_rates_body(3);
p_dot = rotation_acc_body(1);
q_dot = rotation_acc_body(2);
r_dot = rotation_acc_body(3);
X_body = m_a*u_dot;
Y_body = m_a*v_dot;
Z_body = m_a*w_dot;
% X_body = m_a*(u_dot - r*v + q*w); % Term in bracket is for inertial axes acceleration! So use above.
% Y_body = m_a*(v_dot - p*w + r*u);
% Z_body = m_a*(w_dot - q*u + p*v);
Forces_body = [X_body; Y_body; Z_body];
L_body = Ixx*p_dot - (Iyy-Izz)*q*r - Ixz*(p*q+r_dot);
M_body = Iyy*q_dot + (Ixx-Izz)*p*r + Ixz*(p^2-r^2);
N_body = Izz*r_dot - (Ixx-Iyy)*p*q + Ixz*(q*r-p_dot);
Moments_body = [L_body; M_body; N_body];

% -> NEED TO TRANSFORM TOTAL BODY AXES FORCES INTO WIND AXES
Forces_wind = A_b2w*Forces_body;
Moments_wind = A_b2w*Moments_body; % Not needed because moments are applied to body axes

% -> NEED TO CALCULATE L, D, Y, l, m, n
% -> W_wind(3)+T_wind(3)-L = F_wind(3);
% -> W_wind(1)+T_wind(1)-D = F_wind(1);
% -> W_wind(2)+T_wind(2)+Y = F_wind(2);
% -> l = Moments_body(1);
% -> m = Moments_body(2);
% -> n = Moments_body(3);
L_estimated = W_wind(3)+T_wind(3)-Forces_wind(3);
D_estimated = W_wind(1)+T_wind(1)-Forces_wind(1);
Y_estimated = -W_wind(2)-T_wind(2)+Forces_wind(2);
l_estimated = Moments_body(1);
m_estimated = Moments_body(2);
n_estimated = Moments_body(3);

Estimated_loads_input_params = [ L_estimated % (N) (wind axes)
    D_estimated % (N) (wind axes)
    Y_estimated % (N) (wind axes)
    l_estimated % (N.m) (body axes)
    m_estimated % (N.m) (body axes)
    n_estimated % (N.m) (body axes)
    dail % Aileron (rad)
    dele % Elevator (rad)
    drud % Rudder (rad)
    b_a % Wing span (m)
    c_a % Reference cord, MAC (m)
    S_a % Wing area (m^2)
    rho % Density (kg/m^3)];
    V % Aircraft total speed (m/s)
    p % (rad/sec) (body axes)
    q % (rad/sec) (body axes)
    r % (rad/sec) (body axes)
    alpha % (rad)
    beta % (rad)
    ];