function [z,dz]=ddspl(x,y,val)
% DDSPL(X,Y,VAL) - linear step spline function
%	waits for X - an argument array of dimension 2
%		  Y - a function array of dimension 2
%		VAL - argument value or array
%	returns the values of the function and its derivative
%	(or the arrays of values depending on the dimension of VAL)
z=val;
dz=val;
[m,n]=size(val);
if m==1
    m=n;
end
dx=1/(x(2)-x(1));
for i=1:m
    if val(i)<x(1)
	z(i)=y(1);
	dz(i)=0;
    elseif val(i)>x(2)
	z(i)=y(2);
	dz(i)=0;
    else
	wr=(val(i)-x(1))*dx;
	wl=1-wr;
	z(i)=.5*(y(2)+y(1)+(y(2)-y(1))*(wr-wl)*(1+2*wr*wl));
	dz(i)=6*(y(2)-y(1))*dx*wr*wl;
    end
end