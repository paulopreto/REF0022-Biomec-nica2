function [P,D]=diagonal(A)
%
%[P,D]=diagonal(A) computes a symbolic  diagonal matrix D and a symbolic 
%                  matrix P such that D=P^(-1)*A*P. If the matrix A is symmetric, 
%                  2 x 2 and the eigenvalues are differents, then P'=P^(-1). 
%                  diagonliza a matriz A, ou seja, determina uma matriz diagonal D
%                  e uma matriz P tal que D=P^(-1)*A*P. Se a matriz A é simetrica
%                  e 2x2, então P é tal que P'=P^(-1)
%       written by Reginaldo J. Santos DMat/ICEx/UFMG on 28 November 1997/25 March 2006
%
A=sym(A);
[n,m]=size(A);
if n~=m, error('A matriz tem que ser quadrada!'); end
[P,D]=eig(A);
if (m == 2)
  if D(1,1)~=D(2,2) 
    for j=1:m
      P(:,j)=P(:,j)/no(P(:,j));
    end
  end
end
if (double(det(P)) < 0)
   if (double(P(1,1))<0)
      P(:,1)=-P(:,1);
   else
      P(:,2)=-P(:,2);
   end   
end
simplify(P);
