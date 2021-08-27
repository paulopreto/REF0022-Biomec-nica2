function p=plegendre(n,a,b)
%p=plegendre(n,a,b) calcula os n primeiros polinômios
%Q_n(t)=P_n((2*t-a-b)/(b-a)),
%em que P_n é o polinômio de Legendre de grau n e é tal que
%<Q_n,Q_m>=0 se m<>n e ||Q_n||^2=2/(2n+1) 
%em relação ao produto interno <f,g>=int(f*g,a,b).
%p=plegendre(n) equivale a p=plegendre(n,-1,1).
%
%written by Reginaldo J. Santos - DMat-ICEx-UFMG - 24 May 2001
syms t
p1=sym(1);p2=t;
p(1)=sym(1);
if n>0 
      p(2)=t;
      if n>1
         for k=2:n
            p(k+1)=(2*k-1)/k*t*p(k)-(k-1)/k*p(k-1);
         end
      end
end
if nargin==3
   p=subs(p,t,(2*t-a-b)/(b-a));
end
%p=simplify(p);
p=p(:);
      