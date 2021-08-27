function plots(x,y,z,srange,trange,npts)
% 
%	plots(x(s,t),y(s,t),z(s,t),[smin smax],[tmin tmax])  
%       plots a surface x(s,t), y(s,t), z(s,t) where x,y and z are symbolic 
%	expressions representing mathematical expressions that 
%	involves two symbolic variables 's,t'. Uses the specified 
%       s-range and t-range as domain
%
%       written by Reginaldo J. Santos DMAT/ICEx/UFMG on 20 November 1996
%
%	Examples:
%   syms s t
%   plots(sin(t)*cos(s),sin(t)*sin(s),cos(t),[-pi,pi],[0,pi]) 
%   plots(s*cos(t),s*sin(t),s,[-1,1],[-pi,pi])

% Set defaults

if nargin < 5
   error('This function must have at least 5 arguments');
end;
x=char(x);y=char(y);z=char(z);
fig = gcf;

% Make the symbolic variables 's,t' and vectorize the expression.

X = vectorize(x);
Y = vectorize(y);
Z = vectorize(z);


% Sample on initial interval.

  if nargin<6
     npts = 30;
  end
  tt = (0:npts-1)/(npts-1);
  ss = (0:npts-1)/(npts-1);
  smin = min(srange);
  smax = max(srange);
  tmin = min(trange);
  tmax = max(trange);
  s = smin + ss*(smax-smin);
  t = tmin + tt*(tmax-tmin);
  s=s'*ones(1,npts);
  t=ones(npts,1)*t;
  xx = eval(X);
  yy = eval(Y);
  zz = eval(Z);

figure(fig);
surfl(xx,yy,zz);
shading interp;
colormap(gray);
%axis([xmin xmax ymin ymax zmin zmax])
%xlabel('x'); ylabel('y'); zlabel('z');


