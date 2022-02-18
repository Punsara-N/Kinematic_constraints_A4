function [CN]=acn(ALPHA,BETA,PW_UND,RW_UND,QW_UND,DELTA_e,...
		DELTA_dh,DELTA_a,DELTA_r,DELTA_pp,DELTA_py,...
		DELTA_sp,DELTA_sy,tcs,tcp,KCX_tol,KCY_tol,...
		KCZ_tol,KCL_tol,KCM_tol,KCN_tol)
% The calculation of CN aerodynamic coefficient at low speeds (M<.4)
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

%---------------------  CN  ---------------------
beta0=10 ;
pw0_p=.2 ;
pw0_r=.1 ;
%--------------------
X_cna=[40 45 65 73] ;
Y_cna=[-.01 .025] ;
%--------------------
X_cnb_att=[20 90] ;
Y_cnb_att=[.0025 .00] ;
D_cnb_att=[0 0] ;
%------------------------
%X_cnb_vor=[25 35 65 90 110] 
X_cnb_vor=[20 30 65 90 110] ;
Y_cnb_vor=[-.005 .003 .001] ;
%------------------------
X_cnpw_att=[10 30] ;
Y_cnpw_att=[-.125 -.25] ;
D_cnpw_att=[-.0125 0.0001] ;
%------------------------
X_cnpw_vor=[35 55 70] ;
Y_cnpw_vor=-.125 ;
%------------------------
X_cnrw_att=[35 90] ;
Y_cnrw_att=[-.5 0] ;
D_cnrw_att=[0 0] ;
%-------------------------
X_cnrw_vor=[40 47 55 60] ;
Y_cnrw_vor=[-.7 .4] ;
%-------------------------
X_cndr=[25 45] ;
Y_cndr=[-.001 -.0001] ;
D_cndr=[0 0.000002] ;
%-------------------------
X_cnda=[15 30] ;
Y_cnda=[-.0004 .0004] ;
D_cnda=[0 -.0000004] ;
%----------------------
X_cndh=[0 65] ;
Y_cndh=[-.0012 .0015] ;
D_cndh=[0 0] ;
X_cndhe=[-90 -35 0 60 90] ;
Y_cndhe=[-0.000017 0.000027 .000017] ;
%-------------------------
cn0_tol=.004 ;
X1_cn_tol=[-beta0 0 beta0] ;
Y1_cn_tol=1 ;
X2_cn_tol=[-pw0_p 0 pw0_p] ;
Y2_cn_tol=1 ;
%---------------------  CN  ---------------------
bfunc=1./(1+B.*B/beta0/beta0) ;
bfunc2=ddspl([-beta0,beta0],[-beta0,beta0],B) ;
pwfunc_p=1./(1+PW_UND.*PW_UND/pw0_p/pw0_p) ;
pwfunc_r=1./(1+PW_UND.*PW_UND/pw0_r/pw0_r) ;
%--------------------
cna=bell2(X_cna,Y_cna,A.*sa);
%-------
cnb_att=dlspl(X_cnb_att,Y_cnb_att,D_cnb_att,A);
cnb_vor=bell3(X_cnb_vor,Y_cnb_vor,A);
cnb=cnb_att+cnb_vor.*bfunc ;
%----------------
cnpw_att=dlspl(X_cnpw_att,Y_cnpw_att,D_cnpw_att,A.*sa).*sa ;
cnpw_vor=bell(X_cnpw_vor,Y_cnpw_vor,A.*sa).*sa ;
cnpw=cnpw_att+cnpw_vor.*pwfunc_p;
%---------------------------------
cnrw_att=dlspl(X_cnrw_att,Y_cnrw_att,D_cnrw_att,A.*sa) ;
cnrw_vor=bell2(X_cnrw_vor,Y_cnrw_vor,A.*sa) ;
cnrw=cnrw_att+cnrw_vor.*pwfunc_r;
%----------------------------------
cndr=dlspl(X_cndr,Y_cndr,D_cndr,A);
cnda=dlspl(X_cnda,Y_cnda,D_cnda,A);
cndh=dlspl(X_cndh,Y_cndh,D_cndh,A.*sa)+bell3(X_cndhe,Y_cndhe,A).*DELTA_e;
%-----------------------------------
cn_tol=cn0_tol+abs(cnb_vor)*beta0.*(bell(X1_cn_tol,Y1_cn_tol,B)...
            .*bell(X2_cn_tol,Y2_cn_tol,PW_UND));
%------------------------------------------------------------------
CN=cna+cnb_att.*B+cnb_vor.*bfunc2...
         +cndr*DELTA_r+cnda.*DELTA_a+cnpw.*PW_UND+cnrw.*RW_UND...
            +cndh.*DELTA_dh+KCN_tol.*cn_tol ;

%% replace cna by 0.0*cna to make symmetric %%

DELTA_e=DELTA_e*DTOR ;

