function h=plotspline1(c,nbp,a,b,arg5,arg6,arg7)
%plotspline1(C,nbp,a,b) desenha o spline p(x)=soma(c_k*q_k(x),k=1:nbp+2)
%
%plotspline1(C,nbp,a,b,'LineSpec') plota com a especificação de linha
%                                  do mesmo tipo que para o comando plot.
%
%Exemplo:
%X=[2:2:24]'; Y=[2.2,4,5,4.6,2.8,2.7,3.8,5.1,6.1,6.3,5,2]';
%A=spline1(X,5,2,24); C=A\Y;
%clf,hold on
%plotspline1(C,5,2,24), po([X,Y])
%
%written by Reginaldo J. Santos DMat-ICEx-UFMG - 22 March 2002


x=linspace(a,b);
if nargin==4 h=plot(x,spline1(c,x,nbp,a,b)); end
if nargin==5 h=plot(x,spline1(c,x,nbp,a,b),arg5); end
if nargin==6 h=plot(x,spline1(c,x,nbp,a,b),arg5,arg6); end
if nargin==7 h=plot(x,spline1(c,x,nbp,a,b),arg5,arg6,arg7); end
