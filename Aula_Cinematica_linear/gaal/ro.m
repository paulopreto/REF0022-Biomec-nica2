function  A=ro(alpha,i,j,A)
%A=ro(A,i,j) interchanges linha i <==> linha j of the matrix A
%A=ro(alpha,i,A) alpha*linha i ==> linha i of the matrix A
%A=ro(alpha,i,j,A) alpha*linha i + linha j ==> linha j of the matrix A
%
%       written by Reginaldo J. Santos on 4 May 1999 
%                  DMat/ICEx/UFMG

%disp(' ');
[m,n]=size(alpha);
if (m==1)&(n==1)
  if (nargin==4)
%     A=sym(A);
    if i ~= j
     disp([char(sym(alpha)) '*linha ' num2str(i) ...
         ' + linha ' num2str(j) ' ==> linha ' num2str(j)]);
     A(j,:)=A(j,:)+alpha*A(i,:);
    else
     error('a linha i tem que er diferente da linha j!');
    end
  elseif (nargin==3)
%    A=sym(j);
    A=j;
    disp([char(sym(alpha)) '*linha ' num2str(i) ' ==> linha ' num2str(i)]);
    A(i,:)=alpha*A(i,:);
  end
else
  A=alpha;
  disp(['linha ' num2str(i) ' <==> linha ' num2str(j)]);
  A([i j],:) = A([j i],:);
end   
   
