function lineseg(p1,p2,color,thick)
%LINESEG(p1,p2,color) Displays the line segment between p1 and p2
%                     with color color.
%                     The color can be one of
%         'y'     yellow 	       'm'     magenta       
% 	       'c'     cyan 	          'r'     red         
% 	       'g'     green 	       'b'     blue          
% 	       'w'     white 	       'k'     black   
%
%       written by Reginaldo J. Santos on 15 March 1997
%                    DMat-ICEx-UFMG

p1=p1(:);
p2=p2(:);
n=length(p1);
m=length(p2);
if (n==3)&(m==3)
  H=plot3([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)],color);
elseif (n==2)&(m==2)
  H=plot([p1(1) p2(1)],[p1(2) p2(2)],color);
else
  error('The points must be 2 or 3-dimensional');
end
if (nargin<4)
    set(H,'Linewidth',2); 
else
    set(H,'Linewidth',thick);
end
hold on
