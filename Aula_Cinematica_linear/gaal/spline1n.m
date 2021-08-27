function q=spline1n(k,x,b,nn)
%q_k^{(n)}=spline1n(k,x,b,n) calcula q_k^{(n)} em x
%A=spline1n(X,b,n) cria a matriz a_{ij}=q_j^{(n)}(X_i)
%f=spline1n(C,x,b,n) calcula soma(C_k*q_k^{(n)}(x),k=1:nbp+n-1)
%
%[b(n+1),b(n+nbp)] intervalo considerado
%b(1),b(2),...,b(n),b(n+1),...,b(n+nbp),b(n+nbp+1),...,b(n+nbp+n) pontos de quebra
%              / 1, se b(k+n) < x <= b(k+n+1)
%q_k^{(0)}(x)= |
%              \ 0, caso contrário
%
%               x  - b(k)                    b(k+n+1) -  x
%q_k^{(n)}(x)= ------------q_k^{(n-1)}(x)+ --------------------q_{k+1}^{(n-1)}(x)
%               b(k+n)-b(k)                 b(k+n+1)-b(k+1)
%
%
%Exemplo:
%X=[2:2:24]'; Y=[2.2,4,5,4.6,2.8,2.7,3.8,5.1,6.1,6.3,5,2]';
%b=[ones(1,3)*2,linspace(2,24,5),ones(1,3)*24];
%A=spline1n(X,b,3); C=A\Y;
%x=linspace(2,24); clf,hold on
%plot(x,spline1n(C,x,b,3)), po([X,Y])
%
%written by Reginaldo J. Santos DMat-ICEx-UFMG - 20 June 2001
%
if nargin < 3
   error('São necessários pelo menos 3 argumentos de entrada!');
end
if nargin == 3
   nn=b;
   b=x;
   x=k;
   nbp=length(b)-2*nn;
   for k=1:nbp+nn-1
      q(:,k)=spline1n(k,x,b,nn);
   end
else
 nbp=length(b)-2*nn;
 [m,n]=size(x);
 k=k(:);
 if size(k)==[1,1]
  for i=1:m
   for j=1:n
      if x(i,j) > b(k+nn+1)
         q(i,j)=0;
      elseif x(i,j) > b(k)
         if nn==0
            q(i,j)=1;
         else
            q(i,j)=0;
            if b(k+nn) ~= b(k) 
               q(i,j)=q(i,j)+(x(i,j)-b(k))/(b(k+nn)-b(k))*spline1n(k,x(i,j),b,nn-1);
            end
            if b(k+nn+1) ~= b(k+1)
               q(i,j)=q(i,j)+(b(k+nn+1)-x(i,j))/(b(k+nn+1)-b(k+1))*spline1n(k+1,x(i,j),b,nn-1);
            end
         end
      elseif (b(1+nn)==b(1))&(k == 1)&(x(i,j)==b(1))
               q(i,j)=1;
      else
         q(i,j)=0;
      end
   end
  end
else
% Calcula soma(ck*qk,k=1:nbp+nn-1)
  q=zeros(size(x));
  for j=1:nbp+nn-1
         q=q+k(j)*spline1n(j,x,b,nn);
  end
 end
end
