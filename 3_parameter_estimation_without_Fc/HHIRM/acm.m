function [CM]=acm(ALPHA,BETA,PW_UND,RW_UND,QW_UND,DELTA_e,...
		DELTA_dh,DELTA_a,DELTA_r,DELTA_pp,DELTA_py,...
		DELTA_sp,DELTA_sy,tcs,tcp,KCX_tol,KCY_tol,...
		KCZ_tol,KCL_tol,KCM_tol,KCN_tol)
% The calculation of CM aerodynamic coefficient at low speeds (M<.4)
% as a function of state variables vector
% X_state=[ALPHA(deg) BETA(deg) PW_UND RW_UD QW_UND]
% and vector of control surfaces deflections and thrust vectoring
% of two engines (all deflections are in degrees)
% Y_control=[DELTA_e DELTA_dh DELTA_a DELTA_r
%            DELTA_pp DELTA_py DELTA_sp DELTA_sy tcs tcp]
% Vector Z_tol=[KCX_tol KCY_tol KCZ_tol KCL_tol KCM_tol KCN_tol]
% defines the tolerance functions for all aerodynamic coefficients.

% radians and degrees conversion

RTOD=180/pi ;
DTOR=pi/180 ;

%

DELTA_e=DELTA_e*RTOD ;
DELTA_dh=DELTA_dh*RTOD ;
DELTA_a=DELTA_a*RTOD ;
DELTA_r=DELTA_r*RTOD ;
A=ALPHA*RTOD ;
B=BETA*RTOD ;
sa=sign(A) ;

% PW_UND = PW_UND*RTOD;
% RW_UND = RW_UND*RTOD;
% QW_UND = QW_UND*RTOD;

%---------------------  CM  ---------------------
cma0=0 ;
X_cma=[30 50] ;
Y_cma=[-.21 -.17] ;	% original results
%Y_cma=[-.21 -.4] ;	% wing rock results
D_cma=[-.007 -.013] ;
%-----------------------
X_cma_vor=[5 35 40 80] ;
Y_cma_vor=[.04 .08] ;
B_vor_cm=10. ;
PW_UND_cm=.2 ;
%-----------------------
A1_cmde=dlspl([-30 20],[30 20],[0 0],DELTA_e) ;
A2_cmde=dlspl([-30 20],[110 70],[0 0],DELTA_e) ;
X_cmde=[A1_cmde A2_cmde] ;
Y_cmde=[-.01 -.0005] ;
D_cmde=[0 0] ;
%------------------------
cmq0=-5 ;
X_cmq=[20 25 40 50] ;
Y_cmq=[3 -6] ;
%------------------------
cm0_tol=.05 ;
X_cm_tol=[20 40 60] ;
Y_cm_tol=.08 ;
%---------------------  CM  ---------------------
cma=cma0+dlspl(X_cma,Y_cma,D_cma,A.*sa).*sa;
cma_vor=bell2(X_cma_vor,Y_cma_vor,A.*sa).*sa;
cmde=dlspl(X_cmde,Y_cmde,D_cmde,A.*sa);
cmq=cmq0+bell2(X_cmq,Y_cmq,A.*sa);
cm_tol=cm0_tol+bell(X_cm_tol,Y_cm_tol,A.*sa);
CM=cma+cma_vor./(1+(B./B_vor_cm).^2)./(1+(PW_UND./PW_UND_cm).^2)...
           +cmde.*DELTA_e+cmq.*QW_UND+KCM_tol.*cm_tol ;

DELTA_e=DELTA_e*DTOR ;
