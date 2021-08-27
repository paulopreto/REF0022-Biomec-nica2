function [t]=subst(s,old,new)
%subst(expr,old,new) replaces all occurences of old in expr by new.
%       troca todas as ocorrências de old por new na expressão expr.
%
%       written by Reginaldo J. Santos DMAT/ICEx/UFMG on 2 December 1997
%
%	Examples:
%	subst('x^2+1/2*y^2-2^(1/2)*y',[x;y],[x1;y1+2^(1/2)])    
%       replaces all ocorremces of x1 and y1 in 
%                            2        2    1/2
%                           x  + 1/2 y  - 2    y
%       by x1 and y1+2^(1/2).
%           
[n,m]=size(new);
if [n,m]~=size(old)
  error('The arguments new and old must have the same size.');    
end
new=sym(new); old=sym(old);
for i=1:n
  for j=1:m
    s=subs(s,old(i,j),new(i,j));
  end
end
%t=s;
t=simplify(s);
%t=simple(t);
