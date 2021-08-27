function h=campo(f1,f2,xrange,yrange,npts)
%	campo(f1,f2,[xmin xmax],[ymin ymax])  
%     desenha o campo de direçoes (f1,f2) no retangulo [xmin xmax]x[ymin ymax]
%	campo(f,[xmin xmax],[ymin ymax])  
%     desenha o campo de direçoes (1,f) no retangulo [xmin xmax]x[ymin ymax]
%
%       written by Reginaldo J. Santos DMAT/ICEx/UFMG on 1 April 2005
%
%	Exemplo:
%       syms y, campo((y^2-y)/sqrt(1+y^2),[-2,2],[-2,2]) 

npts=21;
%if nargin==2 npts=30; end
if nargin == 3
    yrange=xrange;
    xrange=f2;
    f2=f1;
    syms x; f1=x/x;
end;
f1=f1/sqrt(f1^2+f2^2);
f2=f2/sqrt(f1^2+f2^2);
f1=char(f1);
f2=char(f2);
if nargin<3, error('Not enough input arguments.'); end

[F1,msg] = fcnchk(f1,'x','y','vectorized'); % Make a vectorized feval-able function.
if ~isempty(msg), error(msg); end
[F2,msg] = fcnchk(f2,'x','y','vectorized'); % Make a vectorized feval-able function.
if ~isempty(msg), error(msg); end

if isstr(xrange), xrange = eval(xrange); end
warns = warning;
warning('off');

% Make the symbolic variables 'x,y' and sample on initial interval.

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
  z1=feval(F1,x,y);
  z2=feval(F2,x,y);

h=quiver(x,y,z1,z2);
% shading faceted;
% colormap(gray);
% grid('off');
%xlabel('x'); ylabel('y');

