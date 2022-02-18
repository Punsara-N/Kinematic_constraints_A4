function rho= aird(H)
%
% The calculation of air density (in kg/m^3) at altitudes (in m)
%  H <=11000 m
%
rho=9.81*.125*(20000-H)./(20000+H);
