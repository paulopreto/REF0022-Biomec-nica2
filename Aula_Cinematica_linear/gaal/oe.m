function  A=oe(alpha,i,j,A)
%A=oe(A,i,j) troca linha i <==> linha j da matriz A
%A=oe(alpha,i,A) alpha*linha i ==> linha i da matriz A
%A=oe(alpha,i,j,A) alpha*linha i + linha j ==> linha j da matriz A
%
%       written by Reginaldo J. Santos on 29 March 1998 
%                  DMat/ICEx/UFMG
if nargin==4
   A=ro(alpha,i,j,A);
elseif nargin==3
   A=ro(alpha,i,j);
end

