function [CZ]=acz(ALPHA,BETA,PW_UND,RW_UND,QW_UND,DELTA_e,...
		DELTA_dh,DELTA_a,DELTA_r,DELTA_pp,DELTA_py,...
		DELTA_sp,DELTA_sy,tcs,tcp,KCX_tol,KCY_tol,...
		KCZ_tol,KCL_tol,KCM_tol,KCN_tol)
% The calculation of CZ aerodynamic coefficient at low speeds (M<.4)
% as a function of state variables vector
% X_state=[ALPHA(deg) BETA(deg) PW_UND RW_UD QW_UND]
% and vector of control surfaces deflections and thrust vectoring
% of two engines (all deflections are in degrees)
% Y_control=[DELTA_e DELTA_dh DELTA_a DELTA_r
%            DELTA_pp DELTA_py DELTA_sp DELTA_sy tcs tcp]
% Vector Z_tol=[KCX_tol KCY_tol KCZ_tol KCL_tol KCM_tol KCN_tol]
% defines the tolerance functions for all aerodynamic coefficients.

%% radians and degrees conversion

RTOD=180/pi;
DTOR=pi/180;

%%
% global A B cza cza_vor czde czq cz_tol
DELTA_e=DELTA_e*RTOD;
DELTA_dh=DELTA_dh*RTOD ;
DELTA_a=DELTA_a*RTOD ;
DELTA_r=DELTA_r*RTOD ;
A=ALPHA*RTOD;
B=BETA*RTOD ;
sa=sign(A) ;
%---------------------  CZ  ---------------------
X_cza=[20 40] ;
Y_cza=[1.2 1.9] ;
D_cza=[.06 0.004] ;
%-------------
X_cza_vor=[15. 35. 80.] ;
Y_cza_vor=[.2] ;
B_vor_cz=5. ;
PW_UND_cz=0.1 ;
%--------------
X_czde=[25 100] ;
Y_czde=[.005 .0002] ;
D_czde=[0 0] ;
%--------------
czq0=5 ;
X_czq=[20 40 60] ;
Y_czq=15 ;
%--------------
cz0_tol=.3 ;
X_cz_tol=[15 40 70] ;
Y_cz_tol=.5 ;
%---------------------  CZ  ---------------------
cza=dlspl(X_cza,Y_cza,D_cza,A.*sa).*sa;
cza_vor=bell(X_cza_vor,Y_cza_vor,A.*sa).*sa;
czde=dlspl(X_czde,Y_czde,D_czde,A.*sa);
czq=czq0+bell(X_czq,Y_czq,A.*sa);
cz_tol=cz0_tol+bell(X_cz_tol,Y_cz_tol,A.*sa);
CZ=-(cza+cza_vor./(1.+(B./B_vor_cz).^2)./(1.+(PW_UND./PW_UND_cz).^2)...
          +czde.*DELTA_e+czq.*QW_UND)+KCZ_tol.*cz_tol ;

DELTA_e=DELTA_e*DTOR ;
