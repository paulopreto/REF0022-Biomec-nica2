function d=detcof(A)
%d=detcof(A)  calculates the determinant of A by cofactors
%             calcula o determinante de A por cofatores
%
%       written by Reginaldo J. Santos on 23 October 1997
%                     DMat-ICEx-UFMG

[m,n]=size(A);
if m==n
  if n==1
    d=A(1,1);
  else
    d=0;
    for j=1:n
      d=d+A(1,j)*(-1)^(1+j)*detcof(minor(A,1,j));
    end
  end
else
   error('Matrix is not square.')
   return
end
