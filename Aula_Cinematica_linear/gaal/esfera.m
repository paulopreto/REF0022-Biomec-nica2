function esfera(p,r,color,npts)
% 
%	esfera(p,raio,cor,npts)  
%
%       written by Reginaldo J. Santos DMAT/ICEx/UFMG on 27 November 2001
%
%	Examples:

% Set defaults

if nargin < 2
   error('This function must have at least 2 arguments');
end;
if nargin>=3
  if color=='r'
    cor=0;
  elseif color=='y'
    cor=0.2;
  elseif color=='g'
    cor=0.3;
  elseif color=='b'
    cor=8/15;
  else
     cor=color;
  end;
elseif nargin==2
  cor=0.3;   
end



X = 'sin(t).*cos(s)';
Y = 'sin(t).*sin(s)';
Z = 'cos(t)';


% Sample on initial interval.

if nargin < 4
   npts = 10;
end
  tt = (0:npts-1)/(npts-1);
  ss = (0:npts-1)/(npts-1);
  smin = -pi;
  smax = pi;
  tmin = 0;
  tmax = pi;
  s = smin + ss*(smax-smin);
  t = tmin + tt*(tmax-tmin);
  s=s'*ones(1,npts);
  t=ones(npts,1)*t;
  xx = eval(X);
  xx = p(1)+r*xx;
  yy = eval(Y);
  yy = p(2)+r*yy;
  zz = eval(Z);
  zz = p(3)+r*zz;
%surf(xx,yy,zz,cor*ones(npts,npts));
  h=surface(xx,yy,zz,cor*ones(npts,npts),'EdgeColor','flat','FaceLighting', 'none', 'EdgeLighting', 'flat');
%  h=surface(xx,yy,zz,cor*ones(npts,npts),'FaceLighting', 'none', 'EdgeLighting', 'flat');
%if ~ishold & ~user_view
%    view(3); %comentei esta linha
%end
%  h=mesh(xx,yy,zz,cor*ones(npts,npts));
%  fill3(xx',yy',zz',cor);
%mesh(xx,yy,zz);
  caxis([0 1]);


