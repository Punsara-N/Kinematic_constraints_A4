function [z,dz]=bell4(x,y,val)
% BELL4(X,Y,VAL) - three-bell shaped spline function
%	waits for X - an argument array of dimension 6
%		  Y - a function peaks array of dimension 4
%		VAL - argument value or array
%	returns the values of the function and its derivative
%	(or the arrays of values depending on the dimension of VAL)
[z,dz]=ddspl(x(1:2),[0 y(1)],val);
[z1,dz1]=ddspl(x(2:3),[0 y(2)-y(1)],val);
z=z+z1;
dz=dz+dz1;
[z1,dz1]=ddspl(x(3:4),[0 y(3)-y(2)],val);
z=z+z1;
dz=dz+dz1;
[z1,dz1]=ddspl(x(4:5),[0 y(4)-y(3)],val);
z=z+z1;
dz=dz+dz1;
[z1,dz1]=ddspl(x(5:6),[0 -y(4)],val);
z=z+z1;
dz=dz+dz1;
