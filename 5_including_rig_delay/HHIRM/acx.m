function [CX]=acx(ALPHA,BETA,PW_UND,RW_UND,QW_UND,DELTA_e,...
		DELTA_dh,DELTA_a,DELTA_r,DELTA_pp,DELTA_py,...
		DELTA_sp,DELTA_sy,tcs,tcp,KCX_tol,KCY_tol,...
		KCZ_tol,KCL_tol,KCM_tol,KCN_tol)
% The calculation of CX aerodynamic coefficient at low speeds (M<.4)
% as a function of state variables vector
% X_state=[ALPHA(deg) BETA(deg) PW_UND RW_UD QW_UND]
% and vector of control surfaces deflections and thrust vectoring
% of two engines (all deflections are in degrees)
% Y_control=[DELTA_e DELTA_dh DELTA_a DELTA_r
%            DELTA_pp DELTA_py DELTA_sp DELTA_sy tcs tcp]
% Vector Z_tol=[KCX_tol KCY_tol KCZ_tol KCL_tol KCM_tol KCN_tol]
% defines the tolerance functions for all aerodynamic coefficients.

% radians and degrees conversion

RTOD=180/pi;
DTOR=pi/180;

%

DELTA_e=DELTA_e*RTOD;
DELTA_dh=DELTA_dh*RTOD ;
DELTA_a=DELTA_a*RTOD ;
DELTA_r=DELTA_r*RTOD ;
A=ALPHA*RTOD;
B=BETA*RTOD;
sa=sign(A);
%---------------------  CX  ---------------------
X_cxa=[25 50];
Y_cxa=[-.15 -.1];
D_cxa=[-.01 0];
%------------
X_cxde=[20 30];
Y_cxde=[0 0.0015];
%-------------
cx_tol_0=.05;
X_cx_tol=[20 90 130];
Y_cx_tol=.05;
%-----------------------CX-------------------------
cxa=dlspl(X_cxa,Y_cxa,D_cxa,A.*sa);
%---------------------------------
cxde=ddspl(X_cxde,Y_cxde,A);
%-------------------------------
cx_tol=cx_tol_0+bell(X_cx_tol,Y_cx_tol,A.*sa);
%-------------------------------
CX=-(cxa+cxde.*DELTA_e)+KCX_tol.*cx_tol;

DELTA_e=DELTA_e*DTOR;
