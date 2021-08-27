function h=plotci(f,xrange,yrange,npts,color)
%	plotci(f,[rmin rmax])  
%       plota a curva de equação f(x,y)=0, em que f é uma 
%       expressão simbólica que envolve duas variáveis x e y 
%	     Usa como domínio a região definida em coordenadas polares
%       por rmin<r<rmax.
%
%	plotci(f,[xmin xmax],[ymin ymax])  
%       plota a curva de equação f(x,y)=0, em que f é uma 
%       expressão simbólica que envolve duas variáveis x e y 
%	     Usa como domínio a região definida por
%       xmin<x<xmax e ymin<y<ymax
%
%       written by Reginaldo J. Santos DMAT/ICEx/UFMG on 30 November 1999
%
%	Exemplos:
%       syms x y, plotci(x^2+y^2-1,[-1,1],[-1,1]) 
%       syms x y, plotci(x^2-y^2-1,[0,1])         

% Set defaults
if (nargin==3)
   if(length(yrange)==1) npts=yrange; 
   else npts=100;   
   end
   color='b';
end
if nargin==4
   if ischar(npts) 
      color=npts;
      npts=100;
   end
end
if nargin==2 npts=100; color='b'; end
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


h=contour(x,y,z,[0 0],color);
grid('off');
%xlabel('x'); ylabel('y');

