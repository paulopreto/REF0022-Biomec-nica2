function q=spline1(k,x,nbp,a,b)
%qk=spline1(k,x,nbp,a,b) calcula qk em x
%A=spline1(X,nbp,a,b) cria a matriz a_{ij}=q_j(X_i)
%f=spline1(C,x,nbp,a,b) calcula soma(C_k*q_k(x),k=1:nbp+2)
%
%[a,b] intervalo considerado
%nbp no. de pontos de quebra
%        /p1(t), t=(x-b_{k-3})/h,  se x esta em (b_{k-3},b_{k-2}]
%q_k(x)= |p2(t), t=(x-b_{k-2})/h,  se x esta em (b_{k-2},b_{k-1}]
%        |p2(1-t), t=(x-b_{k-1})/h,  se x esta em (b_{k-1},b_k]
%        \p1(1-t), t=(x-b_{k-3})/h,  se x esta em (b_k,b_{k+1}]
%
%t=(x-b_k)/h=(x-a)/h-(k-1)
%h=(b-a)/(nbp-1)  comprimento de cada intervalo
%b_k=a+(k-1)*h    pontos de quebra b_1=a, ...,b_nbp=b
%p1(t)=0.25*t^3
%p2(t)=1-0.75*(1+t)*(1-t)^2
%Exemplo:
%X=[2:2:24]'; Y=[2.2,4,5,4.6,2.8,2.7,3.8,5.1,6.1,6.3,5,2]';
%A=spline1(X,5,2,24); C=A\Y;
%x=linspace(2,24); clf,hold on
%plot(x,spline1(C,x,5,2,24)), po([X,Y])
%
%written by Reginaldo J. Santos DMat-ICEx-UFMG - 30 January 2002

%cria a matriz a_{ij}=q_j(X_i)
if nargin < 4
   error('São necessários pelo menos 4 argumentos de entrada!');
end
if nargin == 4
   b=a;
   a=nbp;
   nbp=x;
   x=k;
   for k=1:nbp+2
      q(:,k)=spline1(k,x,nbp,a,b);
   end
else
 h=(b-a)/(nbp-1);
 bk=a+(k-1)*h;
 [m,n]=size(x);
 k=k(:);
 if size(k)==[1,1]
  for i=1:m
   for j=1:n
      if x(i,j) > bk+h
         q(i,j)=0;
      elseif x(i,j) > bk
         t=(x(i,j)-a)/h-(k-1);
         q(i,j)=p1(1-t);
      elseif x(i,j) > bk-h
         t=(x(i,j)-a)/h-(k-2);
         q(i,j)=p2(1-t);
      elseif x(i,j) > bk-2*h
         t=(x(i,j)-a)/h-(k-3);
         q(i,j)=p2(t);
      elseif x(i,j) > bk-3*h
         t=(x(i,j)-a)/h-(k-4);
         q(i,j)=p1(t);
      else
         q(i,j)=0;
      end
   end
  end
else
% Calcula soma(ck*qk,k=1:nbp+2)
  q=zeros(size(x));
  for j=1:nbp+2
         q=q+k(j)*spline1(j,x,nbp,a,b);
  end
 end
end

function p=p1(t)
p=0.25*t^3;
%p=3/4*t^2; primeira derivada
%p=3/2*t; segunda derivada

function p=p2(t)
p=1-0.75*(1+t)*(1-t)^2;
%p=3/4+3/2*t-9/4*t^2; primeira derivada
%p=-9/2*t+3/2; segunda derivada



   


      
   
      
         