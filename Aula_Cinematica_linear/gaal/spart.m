function x=spart(A)
%X=spart([A,B])  encontra uma solução particular 
%              de AX=B.
%        written by Reginaldo J. Santos on 4 May 1999 
%                   DMat/ICEx/UFMG

[m,n]=size(A);
R=rref(A);
linha=R(m,:); k=m;
while (linha==zeros(1,n))
 k=k-1;
 linha=R(k,:);
end
ind=find(numeric(linha));
if ind(1)< n
 x=zeros(n-1,1);
 x(ind(1))=R(k,n);
 for l=k-1:-1:1
  ind=find(numeric(R(l,:)));
  x(ind(1))=R(l,n);
 end
else
 error('Sistema sem solução!');
end



 
 