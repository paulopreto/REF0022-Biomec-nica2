function point2(p1,name1,p2,name2,color,thick)
%POINT2(p1,name1,p2,name2) shows two points p1 and p2 with the names 
%                          name1 and name2 respectively
%
%       written by Reginaldo J. Santos on 31 May 1997
%                     DMat-ICEx-UFMG

if (nargin==6) 
 point1(p1,name1,color,thick);
 point1(p2,name2,color,thick);
else
 point1(p1,name1);
 point1(p2,name2);
end