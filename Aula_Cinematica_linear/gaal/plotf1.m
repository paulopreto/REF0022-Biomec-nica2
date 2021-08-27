function plotf1(f,xrange,arg3,arg4,arg5)
%   plotf1(f(x),[a,b]) plota a fun��o f(x) no intervalo [a,b]
%   onde f(x) � uma express�o simb�lica envolvendo uma vari�vel
%   simb�lica x no intervalo [a,b]. 
%
%   plotf1(f(x),[a,b],N) with N >= 1 plota a fun��o com um m�nimo de N+1
%   pontos. O usual � N igual a 1. O passo m�ximo � restrito a 
%   (1/N)*(b - a).
%
%   plotf1(f(x),[a,b],'LineSpec') plota com a especifica��o de linha
%   do mesmo tipo que para o comando plot.
%
%   plotf1(f(x),[a,b],...) aceita combina��es dos argumentos opcionais
%   N, and 'LineSpec', em qualquer ordem.
%   
%
%   Exemplos:
%       syms x
%       plotf1(x^2,[-5,5])
%       plotf1(tan(sin(x))-sin(tan(x)),[-2*pi,2*pi])

%   written by Reginaldo J. Santos DMAT/ICEx/UFMG on 11 April 2004

%f=sym(f);
f=char(f);

%[f,msg] = fcnchk(f,'vectorized'); % Make a vectorized feval-able function.
%if ~isempty(msg), error(msg); end

if nargin==2 fplot(f,xrange); end
if nargin==3 fplot(f,xrange,arg3); end
if nargin==4 fplot(f,xrange,arg3,arg4); end
if nargin==5 fplot(f,xrange,arg3,arg4,arg5); end

