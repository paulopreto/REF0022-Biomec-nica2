function point1(p,name,color,thick)
%point1(p)  shows a point p
%point1(p,name)  shows a point p with with the text name 
%point1(p,name,color)  shows a point p with the color color
%                     with the text name
%          The color can be one of
%         'y'     yellow      'm'     magenta       
% 	       'c'     cyan        'r'     red         
% 	       'g'     green       'b'     blue          
% 	       'w'     white       'k'     black   
%
%       written by Reginaldo J. Santos on 12 March 1997
%                     DMat-ICEx-UFMG

p=p(:);
n=length(p);
if (nargin<3)
  color='y';
end
if (n==3)
  H=plot3([p(1)],[p(2)],[p(3)],color);
  a=axis;
  h=[0 0 0.05*(a(6)-a(5))]';
elseif (n==2)
  H=plot([p(1)],[p(2)],color);
  a=axis;
  h=[0 0.05*(a(4)-a(3))]';
end 
if (nargin > 3)
  set(H,'LineWidth',thick);
else
  set(H,'LineWidth',4);
end
if (nargin>1)
  tex(p+h,name);
end
hold on
