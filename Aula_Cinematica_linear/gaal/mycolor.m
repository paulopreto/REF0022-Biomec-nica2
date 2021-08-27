function g = mycolor(m)
%mycolor(m)   My color map.

if nargin < 1, m = size(get(gcf,'colormap'),1); end
g = (0:m-1)'/max(m-1,1);
g = [g ones(m,1) ones(m,1)];
