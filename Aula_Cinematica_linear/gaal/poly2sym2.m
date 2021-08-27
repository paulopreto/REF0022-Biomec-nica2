function p=poly2sym2(c,x,y)
%p=poly2sym2([a,b,c,d,e,f],x,y) gera o polinômio
%                               p=ax^2+b*x*y+c*y^2+d*x+e*y+f
%
%written by Reginaldo J. Santos DMat-ICEx-UFMG 13 July 2001
n=length(c);
if n==6
   p=poly2sym([c(1),c(2)/2*y+c(4),c(6)/2],x)+...
      poly2sym([c(3),c(2)/2*x+c(5),c(6)/2],y);
end
