function [z,dz]=dd(x,y,val)
% DD(X,Y,VAL) - linear step function
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
for i=1:m
  if val(i)<x(1)
	z(i)=y(1);
	dz(i)=0;
  elseif val(i)>x(2)
	z(i)=y(2);
	dz(i)=0;
  else
	z(i)=y(1)+(y(2)-y(1))/(x(2)-x(1))*(val(i)-x(1));
	dz(i)=(y(2)-y(1))/(x(2)-x(1));
  end
end
