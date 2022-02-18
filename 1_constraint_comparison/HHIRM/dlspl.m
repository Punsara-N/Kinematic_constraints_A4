function [z,dz]=dlspl(x,y,der,val)
% DLSPL(X,Y,DER,VAL) - linear step spline function with arbitrary
%	initial and final slopes
%	waits for X - an argument array of dimension 2
%		  Y - a function array of dimension 2
%		DER - initial and final slope array of dimension 2
%		VAL - argument value or array
%	returns the values of the function and its derivative
%	(or the arrays of values depending on the dimension of VAL)
z=val;
dz=val;
[m,n]=size(val);
if m==1
    m=n;
end
dx=x(2)-x(1);
dm=(y(2)-y(1))/dx;
for i=1:m
    if val(i)<x(1)
	z(i)=y(1)+der(1)*(val(i)-x(1));
	dz(i)=der(1);
    elseif val(i)>x(2)
	z(i)=y(2)+der(2)*(val(i)-x(2));
	dz(i)=der(2);
    else
	wr=(val(i)-x(1))/dx;
	wl=1-wr;
	z(i)=.5*(y(2)+y(1))+dx*wr*wl*((der(1)-dm)*wl-(der(2)-dm)*wr)...
	    +.5*(y(2)-y(1))*(wr-wl);
	dz(i)=der(1)*wl*wl+der(2)*wr*wr+2*wr*wl*(3*dm-der(2)-der(1));
    end
end