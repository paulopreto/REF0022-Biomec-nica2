function line1(p,v,color,thick)
%LINE1(p,v[,color]) displays a straight line 
%          that contains the point p,
%          has the direction v and the color color
%          The color can be one of
%         'y'     yellow	       'm'     magenta       
% 	       'c'     cyan 	          'r'     red         
% 	       'g'     green 	       'b'     blue          
% 	       'w'     white 	       'k'     black   
%
%       written by Reginaldo J. Santos on 23 November 1997 
%                     DMat-ICEx-UFMG

if nargin==2
  color='y';
end;
p=p(:);
v=v(:);
w2=p+v;
w1=p-v;
n=length(p);
m=length(v);
if (m==3)&(n==3)
  H=plot3([w1(1) w2(1)],[w1(2) w2(2)],[w1(3) w2(3)],color);
elseif (m==2)&(n==2) 
  H=plot([w1(1) w2(1)],[w1(2) w2(2)],color);
end
if (nargin<4)
  set(H,'Linewidth',2);
else
  set(H,'Linewidth',thick);
end
hold on
