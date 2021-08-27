function mat2lat(A,pos)
%mat2lat(A) converte uma matriz A para o formato do latex
%
%Reginaldo J. Santos  DMat-ICEx-UFMG  26 April 2004
%
[m,n]=size(A);
if nargin==1
   pos='r';
   for j=2:n
      pos=[pos,'r'];
   end
end
disp(['\left[\begin{array}{' pos '} ']);
for i=1:m
   B='';
   for j=1:n-1
      B=[B,latex(sym(A(i,j))),'&'];
   end
   B=[B,latex(sym(A(i,n)))];
   if i < m
      B=[B,'\\ '];
   end
   disp(B);
end
disp('\end{array}\right]');


   