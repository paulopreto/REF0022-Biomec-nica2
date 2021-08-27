function y = heaviside(x)
%y = heaviside(x) é a função que vale 0 se x<0 e vale 1 se x>=0
%
%written by Reginaldo J. Santos - DMat-ICEx-UFMG - 30 May 2001

classe=class(x);
if classe(1) == 's'
   y=sym(['Heaviside(',char(x),')']);
else
   [m,n]=size(x);
   for i=1:m
      for j=1:n
         if x(i,j) < 0
          y(i,j)=0;
         else
          y(i,j)=1;
         end
      end
   end
end

   

