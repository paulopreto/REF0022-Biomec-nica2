function plotc3(x,y,z,trange,s,npts)
%	plotc3(x(t),y(t),z(t),[tmin tmax])  
%       plots a curve x(t), y(t), z(t) where x,y and z are symbolic 
%	expressions representing mathematical expressions that 
%	involves a symbolic variable t. Uses the specified 
%       t-range as domain.
%
%	plotc3(x,y,z,[tmin tmax],s) where s is a  
%       string made from the characters listed under the PLOT command.
%
%       written by Reginaldo J. Santos DMAT/ICEx/UFMG on 8 March 1998
%
%	Examples:
%       syms t, plotc3(sin(t),cos(t),t,[0,10*pi])   for a helix
%       plotc3(sin(t),cos(t),t,[0,10*pi],'b-',300)  the same, but with 300 points    

% Set defaults

if nargin < 4
   error('This function must have at least 4 arguments');
end;
x=char(x);y=char(y);z=char(z);
fig = gcf;

X = vectorize(x);
Y = vectorize(y);
Z = vectorize(z);



% Sample on initial interval.

  if nargin<6 npts = 100; end
  tt = (0:npts-1)/(npts-1);
  tmin = min(trange);
  tmax = max(trange);
  t = tmin + tt*(tmax-tmin);
  xx = eval(X);
  yy = eval(Y);
  zz = eval(Z);

figure(fig);
if nargin < 5, plot3(xx,yy,zz); 
else, plot3(xx,yy,zz,s); end;
%xlabel('x'); ylabel('y'); zlabel('z');


