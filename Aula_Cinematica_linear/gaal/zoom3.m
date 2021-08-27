function zoom3(factor)
%ZOOM3(factor)  Amplifies the region by the factor factor,
%              if factor>0 or reduce by the factor factor
%              if factor<0.
%
%       Written by Reginaldo J. Santos on 29 March 1996 - DMAT/UFMG

ampl=-factor;
a=axis;
m=length(a);
if m==4
  axis([a(1)-(a(2)-a(1))*ampl a(2)+(a(2)-a(1))*ampl ...
       a(3)-(a(2)-a(1))*ampl  a(4)+(a(4)-a(3))*ampl]);
elseif m==6 
  axis([a(1)-(a(2)-a(1))*ampl a(2)+(a(2)-a(1))*ampl ...
       a(3)-(a(2)-a(1))*ampl  a(4)+(a(4)-a(3))*ampl ...
       a(5)-(a(6)-a(5))*ampl  a(6)+(a(6)-a(5))*ampl]);
end
