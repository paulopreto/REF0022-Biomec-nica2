function h=plotf2(f,xrange,yrange,npts)
%	plotf2(f,[rmin rmax])  
%       plots a graph of f(x,y) where f is a symbolic 
%	expression representing a mathematical expression that 
%	involves two symbolic variables x,y. Uses the specified 
%       r-range as domain, where r=sqrt(x^2+y^2)
%
%	plotf2(f,[xmin xmax],[ymin ymax])  
%       plots a graph of f(x,y) where f is a symbolic 
%	expression representing a mathematical expression that 
%	involves two symbolic variables x,y. Uses the specified 
%       x-range and y-range as domain
%
%       written by Reginaldo J. Santos DMAT/ICEx/UFMG on 3 March 1998
%
%	Exemplos:
%       syms x y, plotf2(x^2-y^2,[-1,1],[-1,1]) shows the hiperbolic paraboloid
%       syms x y, plotf2(x^2-y^2,[0,1])         idem

% Set defaults
if (nargin==3)
   if(length(yrange)==1) npts=yrange; 
   else npts=30;   
   end
end
if nargin==2 npts=30; end
f=char(f);
if nargin<2, error('Not enough input arguments.'); end

[F,msg] = fcnchk(f,'x','y','vectorized'); % Make a vectorized feval-able function.
if ~isempty(msg), error(msg); end

if isstr(xrange), xrange = eval(xrange); end
warns = warning;
warning('off');

% Make the symbolic variables 'x,y' and sample on initial interval.

if (nargin > 2)&(length(yrange)==2)
  if isstr(yrange), yrange = eval(yrange); end
%  npts = 50;
  t = (0:npts-1)/(npts-1);
  s = (0:npts-1)/(npts-1);
  xmin = min(xrange);
  xmax = max(xrange);
  ymin = min(yrange);
  ymax = max(yrange);
  x = xmin + t*(xmax-xmin);
  y = ymin + s*(ymax-ymin);
  x=x'*ones(1,npts);
  y=ones(npts,1)*y;
  z=feval(F,x,y);
else
%  npts=100;
  t = (0:npts-1)/(npts-1);
  rrange=xrange;
  rmin=min(rrange);
  rmax=max(rrange);
  r= rmin + t*(rmax-rmin);
  r=r(:);
  theta = (0:npts)/npts*2*pi;
  sintheta = sin(theta); sintheta(npts+1) = 0;
  x = r * cos(theta);
  y = r * sintheta;
  z=feval(F,x,y);
end

h=surfl(x,y,z);
shading faceted;
colormap(gray);
grid('off');
%xlabel('x'); ylabel('y');

