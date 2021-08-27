function plotc2(x,y,trange,s,npts)
% 
%	plotc2(x(t),y(t),[tmin tmax])  
%       plots a curve x(t), y(t), where x and y are symbolic 
%	expressions representing mathematical expressions that 
%	involves a symbolic variable t. Uses the specified 
%       t-range as domain.
%
%	plotc2(x,y,[tmin tmax],s) where s is a string made from
%  	the characters listed under the PLOT command.
%
%       written by Reginaldo J. Santos on 8 March 1998
%                    DMat-ICEx-UFMG 
%
%	Examples:
%       syms t, plotc2(sin(t),cos(t),[0,2*pi])   for a circle
%           

% Set defaults

if nargin < 3
   error('This function must have at least 4 arguments');
end;
x=char(x);y=char(y);

X = vectorize(x);
Y = vectorize(y);



% Sample on initial interval.

  if nargin < 5 npts = 100; end
  tt = (0:npts-1)/(npts-1);
  tmin = min(trange);
  tmax = max(trange);
  t = tmin + tt*(tmax-tmin);
  xx = eval(X);
  yy = eval(Y);

figure(gcf);
if nargin < 4, plot(xx,yy); 
else, plot(xx,yy,s); end;
%xlabel('x'), ylabel('y')
hold on

