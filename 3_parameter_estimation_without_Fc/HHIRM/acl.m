function [CL]=acl(ALPHA,BETA,PW_UND,RW_UND,QW_UND,DELTA_e,...
		DELTA_dh,DELTA_a,DELTA_r,DELTA_pp,DELTA_py,...
		DELTA_sp,DELTA_sy,tcs,tcp,KCX_tol,KCY_tol,...
		KCZ_tol,KCL_tol,KCM_tol,KCN_tol)
% The calculation of CL aerodynamic coefficient at low speeds (M<.4)
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

%---------------------  CL  ---------------------
beta0=10 ;
pw0_p=.2 ;
pw0_r=.1 ;
%------------------
X_cla=[25 30 35 40] ;
Y_cla=[.005 -.007] ;
%------------------
X_clb_att=[20 65] ;
Y_clb_att=[-.0020 -.00125] ;
D_clb_att=[-.0001,.000025] ;
%-------------------------
X_clb_vor=[15 20 35 42] ;
Y_clb_vor=[-.0005 .0055] ;
clb0=-.0003 ;
%-------------------------
X_clpw_att=[10 70] ;
Y_clpw_att=[-.3 .05] ;
D_clpw_att=[0 0] ;
%-------------------------
X_clpw_vor=[10 35 60] ;
Y_clpw_vor=.35 ;
%------------------------
X_clrw_att=[30 40] ;
Y_clrw_att=[.55 .55] ;
D_clrw_att=[.0182 -.0110] ;
X_clrw_att1=[40 50 90] ;
Y_clrw_att1=-.25 ;
%------------------------
X_clrw_vor=[25 35 45 55] ;
Y_clrw_vor=[.45 -.47] ;
%------------------------
X_cldr=[45 100] ;
Y_cldr=[.0002 -.0001] ;
D_cldr=[0 0] ;
%------------------------
X_clda=[20 40] ;
Y_clda=[-.0012 -.0005] ;
D_clda=[0 0.000007] ;
%------------------------
X_cldh=[25 90] ;
Y_cldh=[-.0015 -.00016] ;
D_cldh=[0 0] ;
X_cldhe=[-110 -45 0 45 110] ;
Y_cldhe=[0.000035 -0.000055 .000035] ;
%------------------------
cl0_tol=.004 ;
X1_cl_tol=[-beta0 0 beta0] ;
Y1_cl_tol=1 ;
X2_cl_tol=[-pw0_p 0 pw0_p] ;
Y2_cl_tol=1 ;
%---------------------  CL  ---------------------
bfunc=1./(1+B.*B/beta0/beta0) ;
pwfunc_p=1./(1+PW_UND.*PW_UND/pw0_p/pw0_p) ;
pwfunc_r=1./(1+PW_UND.*PW_UND/pw0_r/pw0_r) ;
%---------------
cla=bell2(X_cla,Y_cla,A.*sa);
%-------------------
clb_att=dlspl(X_clb_att,Y_clb_att,D_clb_att,A.*sa).*sa ;
clb_vor=bell2(X_clb_vor,Y_clb_vor,A.*sa).*sa ;
clb=clb_att+clb_vor.*bfunc+clb0;
%-----------------------
clpw_att=dlspl(X_clpw_att,Y_clpw_att,D_clpw_att,A.*sa) ;
clpw_vor=bell(X_clpw_vor,Y_clpw_vor,A.*sa) ;
clpw=clpw_att+clpw_vor.*pwfunc_p;
%---------
clrw_att=dlspl(X_clrw_att,Y_clrw_att,D_clrw_att,A.*sa).*sa...
           +bell(X_clrw_att1,Y_clrw_att1,A) ;
clrw_vor=bell2(X_clrw_vor,Y_clrw_vor,A.*sa).*sa ;
clrw=clrw_att+clrw_vor.*pwfunc_r;
%-------------
cldr=dlspl(X_cldr,Y_cldr,D_cldr,A);
clda=dlspl(X_clda,Y_clda,D_clda,A.*sa);
cldh=dlspl(X_cldh,Y_cldh,D_cldh,A.*sa)+bell3(X_cldhe,Y_cldhe,A).*DELTA_e;
%------------
cl_tol=cl0_tol+.5.*abs(clb_vor).*beta0.*(.2+bell(X1_cl_tol,Y1_cl_tol,B)...
       .*bell(X2_cl_tol,Y2_cl_tol,PW_UND));
%----------------
CL=cla+clb.*B+cldr.*DELTA_r+clda.*DELTA_a+clpw.*PW_UND+clrw.*RW_UND...
       +cldh.*DELTA_dh+KCL_tol.*cl_tol ;

%% replace cla by 0.0*cla to make symmetric %%

DELTA_e=DELTA_e*DTOR ;
