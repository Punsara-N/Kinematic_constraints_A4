function percentage_change( a, b )
%percentage_change: calculates the percentage change between two numberes
%   % change = (b-a)/a

p = (b-a)/a * 100;

disp(['Percentage change from ', num2str(a,3), ' to ', num2str(b,3), ' is ', num2str(p,3), '%']);

end

