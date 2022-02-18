function [CY]=acy(ALPHA,BETA,PW_UND,RW_UND,QW_UND,DELTA_e,...
		DELTA_dh,DELTA_a,DELTA_r,DELTA_pp,DELTA_py,...
		DELTA_sp,DELTA_sy,tcs,tcp,KCX_tol,KCY_tol,...
		KCZ_tol,KCL_tol,KCM_tol,KCN_tol)
% The calculation of CY aerodynamic coefficient at low speeds (M<.4)
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
%---------------------  CY  ---------------------
X_cya=[40 50 60 70] ;
Y_cya=[-.05 0.075] ;
%---------------
X_cyb=[20 90] ;
Y_cyb=[-.012 -.008] ;
D_cyb=[0 0] ;
X_cyb1=[15 35 50] ;
Y_cyb1=.007 ;
%--------------------------
X_cydr=[20 40] ;
Y_cydr=[.004 0.0008] ;
D_cydr=[0 -.000015] ;
%--------------------------
X_cyda=[20 60 ] ;
Y_cyda=[0 0] ;
D_cyda=[0 0 ] ;
%------------------------
X_cydh=[35 53] ;
Y_cydh=[.003 -.003] ;
D_cydh=[0 0] ;
X_cydhe=[-50 0 75] ;
Y_cydhe=[0.000075] ;
%---------------------------
cy_tol_0=.01 ;
X_cy_tol=[40 60 70] ;
Y_cy_tol=.02 ;
%---------------------  CY  ---------------------
cya=bell2(X_cya,Y_cya,A.*sa) ;
%--------------------
cyb=dlspl(X_cyb,Y_cyb,D_cyb,A)+bell(X_cyb1,Y_cyb1,A) ;
%--------------------
cydr=dlspl(X_cydr,Y_cydr,D_cydr,A) ;
%--------------------
cyda=dlspl(X_cyda,Y_cyda,D_cyda,A) ;
%-------------
cydr=dlspl(X_cydr,Y_cydr,D_cydr,A) ;
cyda=dlspl(X_cyda,Y_cyda,D_cyda,A.*sa) ;
cydh=dlspl(X_cydh,Y_cydh,D_cydh,A.*sa)+bell(X_cydhe,Y_cydhe,A).*DELTA_e ;
%--------------------
cyrw=0 ;
%--------------------
cypw=0 ;
%--------------------
cy_tol=cy_tol_0+bell(X_cy_tol,Y_cy_tol,A) ;
%-------------------- CY ---------------
CY=cya+cyb.*B+cyrw.*RW_UND+cypw.*PW_UND+cydr.*DELTA_r+cyda.*DELTA_a...
             +cydh.*DELTA_dh+KCY_tol.*cy_tol ;

%% replace cya by 0.0*cya to make symmetric %%

DELTA_e=DELTA_e*DTOR ;
