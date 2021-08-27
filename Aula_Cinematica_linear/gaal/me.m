function  E=me(n,alpha,i,j)
%E=me(n,[i,j]) matriz elementar de ordem n correspondente a 
%              troca linha i <==> linha j em I_n
%E=me(n,alpha,i) matriz elementar de ordem n correspondente a
%              alpha*linha i ==> linha i em I_n
%E=me(n,alpha,i,j) matriz elementar de ordem n correspondente a
%              alpha*linha i + linha j ==> linha j em I_n
%
%       written by Reginaldo J. Santos on 22 November 1998 
%                  DMat/ICEx/UFMG
E=eye(n);
E=sym(E);
if nargin==2
 i=alpha(1);
 j=alpha(2);
  E([i,j],:)=E([j,i],:);
 elseif nargin == 3
  E(i,:)=alpha*E(i,:);
 elseif nargin == 4
  E(j,:)=alpha*E(i,:)+E(j,:);
 end

