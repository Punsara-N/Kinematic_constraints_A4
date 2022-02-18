function [y] = sigfig(x,sf)
%Function "sigfig" returns number x in sf significant figures.

y = round(x, sf, 'significant');

end

