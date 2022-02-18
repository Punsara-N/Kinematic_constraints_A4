function [z,dz]=bell(x,y,val)
% BELL(X,Y,VAL) - bell-shaped spline function
%	waits for X - an argument array of dimension 3
%		  Y - a function peak value
%		VAL - argument value or array
%	returns the values of the function and its derivative
%	(or the arrays of values depending on the dimension of VAL)
[z,dz]=ddspl(x(1:2),[0 y],val);
[z1,dz1]=ddspl(x(2:3),[0 -y],val);
z=z+z1;
dz=dz+dz1;
