function tex2(p,string)
%TEX(p,string) places the text string in the point p
%              The text must be given between ' 
%
%       Written by Reginaldo J. Santos on 9 April 1996 - DMAT/UFMG


n=length(p);
if (n==3)
  text(p(1),p(2),p(3),string);
elseif (n==2)
  text(p(1),p(2),string);
end
  

