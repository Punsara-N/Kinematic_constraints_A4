clear,clc,close all;

% Body to wind axes transformation
% According to Cook (page 21): (phi,theta,psi) = (0,alpha,-beta)
phi_w = 10*pi/180;
theta_w = 20*pi/180;
psi_w = 30*pi/180;

% From NASA transformation equations:
theta1 = psi_w;
theta2 = theta_w;
theta3 = phi_w;

q0 = +sin(theta1/2)*sin(theta2/2)*sin(theta3/2)+cos(theta1/2)*cos(theta2/2)*cos(theta3/2);
q1 = -sin(theta1/2)*sin(theta2/2)*cos(theta3/2)+sin(theta3/2)*cos(theta1/2)*cos(theta2/2);
q2 = +sin(theta1/2)*sin(theta3/2)*cos(theta2/2)+sin(theta2/2)*cos(theta1/2)*cos(theta3/2);
q3 = +sin(theta1/2)*cos(theta2/2)*cos(theta3/2)-sin(theta2/2)*sin(theta3/2)*cos(theta1/2);

E = [  -q1     q0      -q3     q2
    -q2     q3      q0      -q1
    -q3     -q2     q1      q0  ];

E_dash = [  	-q1     q0      q3      -q2
                -q2     -q3     q0      q1
                -q3     q2      -q1     q0  ];

A_b2w = E*transpose(E_dash); % Note: this matrx transforms from body to wind axes!

disp('------------------------------------------------------------');
disp('Transformation matrix check using Cook book and NASA methods');
disp('------------------------------------------------------------');
disp(' ');
disp('Transformation matrix (A_b2w):');
disp(A_b2w);
disp('Transpose;');
disp(A_b2w');
disp('Inverse:');
disp(inv(A_b2w));
disp('Transpose and inverse should be the same since'); disp('the transformation matrix is orthogonal.');

%% Transformation from NASA
% Original axes : inertial/wind/Earth/reference
% Final axes    : body (M_dash)

psi = psi_w; % Yaw angle (first rotation, about z axis)
theta = theta_w; % Pitch angle (second rotation, about y axis)
phi = phi_w; % Roll angle (third rotation, about x axis)

S1 = sin(psi);
C1 = cos(psi);
S2 = sin(theta);
C2 = cos(theta);
S3 = sin(phi);
C3 = cos(phi);

M = [   C1*C2       C1*S2*S3-S1*C3      C1*S2*C3+S1*S3
        S1*C2     	S1*S2*S3+C1*C3      S1*S2*C3-C1*S3
        -S2        	C2*S3               C2*C3           ]; % x0 = M * x3

M_dash = M'; % x3 = M * x0

disp(' ');
disp('Transformation from NASA (M):');
disp(M);

%% Inertial tensor transformation

Ixx_a = 10;
Iyy_a = 0;
Izz_a = 0;
Ixy_a = 0;
Ixz_a = 0;
Iyz_a = 0;

% Inertial tensor of aircraft model in body frame of reference about c.g./body axes
Ia = [   Ixx_a	-Ixy_a	-Ixz_a
        -Ixy_a	 Iyy_a	-Iyz_a
        -Ixz_a	-Iyz_a	 Izz_a	];

disp('------------------------------');
disp('Inertial tensor transformation');
disp('------------------------------');
disp(' ');
disp('Inertial tensor:');
disp(Ia);

Ia_dash = M_dash*Ia*M_dash';

disp(['Inertial tensor trasformed [phi,theta,psi] = [' num2str(phi_w*180/pi)...
    ',' num2str(theta_w*180/pi) ',' num2str(psi_w*180/pi) '] deg:']);
disp(Ia_dash);

%% Rotation angles, rates and acceleration transformation

% Angles (Remember: M is the transformation matrix from final to initial axes system)
psi = atan2(M(2,1),M(1,1));
theta = atan2(-M(3,1),(sqrt(1-(M(3,1))^2)));
phi = atan2(M(3,2),M(3,3));

disp('------------------------------------------------------');
disp('Rotation angles, rates and acceleration transformation');
disp('------------------------------------------------------');
disp(' ');
disp(['Rotation angles [phi,theta,psi]= [' num2str(phi*180/pi)...
    ',' num2str(theta*180/pi) ',' num2str(psi*180/pi) '] deg.']);

% Rates
p = 10*pi/180;
q = 20*pi/180;
r = 30*pi/180;
rotation_rates_eul = [p;q;r];
rotation_rates_quat = eul2quat(rotation_rates_eul','ZYX');
rotation_rates_eul2 = quat2eul(rotation_rates_quat,'ZYX');

disp(' ');
disp(['Rotation rates [p,q,r] = [' num2str(p*180/pi) ',' num2str(q*180/pi) ',' ...
    num2str(r*180/pi) '] deg/sec.']);
disp(['Rotation rates [q0,q1,q2,q3] = [' num2str(rotation_rates_quat(1)) ',' ...
    num2str(rotation_rates_quat(2)) ',' num2str(rotation_rates_quat(3)) ',' ...
    num2str(rotation_rates_quat(4)) '].']);
disp(['Rotation rates using "quat2eul" [p,q,r] = [' num2str(rotation_rates_eul2(1)*180/pi) ',' ...
    num2str(rotation_rates_eul2(2)*180/pi) ',' num2str(rotation_rates_eul2(3)*180/pi) '] deg/sec.']);

% Local angular velocities (p, q, r in body axes)
q0_dot = rotation_rates_quat(1);
q1_dot = rotation_rates_quat(2);
q2_dot = rotation_rates_quat(3);
q3_dot = rotation_rates_quat(4);

omega_dasha = 2*E_dash*[	q0_dot
                            q1_dot
                            q2_dot
                            q3_dot     ];
                        
p_body = omega_dasha(1);
q_body = omega_dasha(2);
r_body = omega_dasha(3);

rates = M*[p_body;q_body;r_body];
p = rates(1);
q = rates(2);
r = rates(3);

disp(' ');
disp(['Rotation rates [p,q,r] = [' num2str(p*180/pi) ',' num2str(q*180/pi) ',' ...
    num2str(r*180/pi) '] deg/sec.']);