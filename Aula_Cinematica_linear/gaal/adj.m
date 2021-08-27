function B=adj(A)
%B=adj(A) calcula a adjunta (clássica) de A
%
%written by Reginaldo J. Santos DMat-ICEx-UFMG  5 June 2001
%

[m,n]=size(A);
for i=1:m
   for j=1:n
      B(j,i)=(-1)^(i+j)*det(menor(A,i,j));
   end
end
