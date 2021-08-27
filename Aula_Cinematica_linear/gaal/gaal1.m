% Toolbox para Geometria Analítica e Álgebra Linear
%   para MATLAB 5 com pacote symbolic
%               
%   Reginaldo J. Santos    regi@mat.ufmg.br
%     DMat/ICEx/UFMG          18/04/2004
%
% 1. MATRIZES, SISTEMAS LINEARES E DETERMINANTES:
%
%randi(n) ou randi(m,n) cria uma matriz com elementos inteiros aleatorios
%escalona(A) calcula a forma reduzida escalonada da matriz A passo a passo
%opel(A,i,j) ou oe(A,i,j) linha i <--> linha j da matriz A
%opel(alpha,i,A) ou oe(alpha,i,A) alpha*linha i --> linha i da matriz A
%opel(alpha,i,j,A) ou oe(alpha,i,j,A) alpha*linha i + linha j --> linha j da matriz A
%menor(A,i,j) calcula o menor i,j da matriz A
%detcof(A) calcula determinante de A usando cofatores
%detopel(A) calcula det. de A reduzindo A a forma triangular superior  
%detopelp(A) o mesmo que o anterior, mas passo a passo  
%adj(A) calcula a adjunta (clássica) de A
%
%Informação por partes: 
%      help gaal1, help gaal2, help gaal3, 
%      help gaal4, help gaal5, help gaal6
%Informação de cada função: 
%      help nome da função
%Conteúdo do pacote gaal: 
%      help gaal
