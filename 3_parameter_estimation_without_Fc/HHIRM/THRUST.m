function T=thrust(H,M,tc)
% The calculation of thrust as a function
% of flight altitude (H), Mach number (M),
% and throttle control (tc <= 1.0)
rho=aird(H);
rho0=aird(0);
T0max=5000;
T0f=8000;
X_CA1=[0 11000];
Y_CA1=[0 -0.5];
D_CA1=[0 0];
X_CA2=[0 11000];
Y_CA2=[0.1 1.1];
D_CA2=[0 0];
X_da=[0 11000];
Y_da=[1.8 1.3];
D_da=[0 0];
X_CB1=[0 11000];
Y_CB1=[0 -0.4];
D_CB1=[0 0];
X_CB2=[0 11000];
Y_CB2=[0.3 1.2];
D_CB2=[0 0];
X_db=[0 11000];
Y_db=[1.6 1.2];
D_db=[0 0];
CA1=dlspl(X_CA1,Y_CA1,D_CA1,H);
CA2=dlspl(X_CA2,Y_CA2,D_CA2,H);
da=dlspl(X_da,Y_da,D_da,H);
CB1=dlspl(X_CB1,Y_CB1,D_CB1,H);
CB2=dlspl(X_CB2,Y_CB2,D_CB2,H);
db=dlspl(X_db,Y_db,D_db,H);
Tmax=T0max.*(1.+CA1.*M+CA2.*M.^2).*(rho./rho0).^da;
Tf=T0f.*(1.+CB1.*M+CB2.*M.^2).*(rho./rho0).^db;
if (tc < 0.7)
    T=Tmax.*tc/0.7;
else
    T=Tmax+(Tf-Tmax).*(tc-0.7)/0.3;
end
