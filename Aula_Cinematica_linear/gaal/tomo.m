function tomo
%load tomo 
%         carrega uma matriz esparsa A, 1259x361, e um vetor x, 361x1
%         A matriz A simula a matriz de um tom�grafo de emiss�o
%         O vetor x � uma imagem 19x19
%         Os dados do tom�grafo podem ser simulados fazendo b=A*x
%
%written by Reginaldo J. Santos - DMat-ICEx-UFMG - 8 June 2001
%
%Exemplo:
%load tomo
%b=A*x; bb=b+0.001*randn(size(b))*norm(b);
%xx=A\bb;
%showimag([x,xx])


