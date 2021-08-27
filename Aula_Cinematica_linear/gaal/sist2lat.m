function sist2lat(A,B)
%S=sist2lat(A,B) converte o sistema AX=B num array do latex
%
%Reginaldo J. Santos  DMat-ICEx-UFMG  Joana Darc A. S. da Cruz  DMat-ICE-UFJF 
%15 July 2001

[m,n]=size(A);
A=sym(A);
pos='r';
for j=2:2*n+1
      pos=[pos,'r'];
end
if n > 4
 for i=1:n
   X(i,:)=['x_',num2str(i)];
 end
else
   X(1,:)='x';
   X(2,:)='y';
   X(3,:)='z';
   X(4,:)='w';
end
disp(['\left\{\begin{array}{' pos '} ']);
for i=1:m
   % 1o. elemento
   S='';
   if A(i,1)~=0
         jj=1;
         if A(i,1)==1
            S=[S,X(1,:)];  
         elseif A(i,1)==-1
            S=[S,'-',X(1,:)];
         else
            S=[S,latex(sym(A(i,1))),X(1,:)];
         end
   else
   % até o 1o. elemento não nulo  
     for j=2:n 
      jj=j;
      if A(i,j)==0
         S=[S,'&']; 
      else
         if A(i,j)==1
            S=[S,'&&',X(j,:)];  
         elseif A(i,j)==-1
            S=[S,'&&-',X(j,:)];
         else
            strAij=latex(sym(A(i,j)));
            if strAij(1)=='-'
               S=[S,'&-&',latex(sym(-A(i,j))),X(j,:)];
            else
               S=[S,'&+&',strAij,X(j,:)];
            end
         end
         break;
      end
    end
   end
   % outros
   if jj < n
    for j=jj+1:n
      if A(i,j)==0
         S=[S,'&&']; 
      else
         if A(i,j)==1
            S=[S,'&+&',X(j,:)];  
         elseif A(i,j)==-1
            S=[S,'&-&',X(j,:)];
         else
            strAij=latex(sym(A(i,j)));
            if strAij(1)=='-'
               S=[S,'&-&',latex(sym(-A(i,j))),X(j,:)];
            else
               S=[S,'&+&',strAij,X(j,:)];
            end
         end
      end
    end
   else
    S=[S,'&&0'];
   end
   S=[S,'&=&',latex(sym(B(i)))];
   if i < m
      S=[S,'\\ '];
   end
   disp(S);
end
disp('\end{array}\right.');

   