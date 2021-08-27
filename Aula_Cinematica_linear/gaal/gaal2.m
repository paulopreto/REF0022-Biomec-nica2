% Toolbox para Geometria Analítica e Álgebra Linear
%   para MATLAB 5 com pacote symbolic
%               
%   Reginaldo J. Santos   regi@mat.ufmg.br
%     DMat/ICEx/UFMG         18/04/2004
%
% 2. VETORES, RETAS E PLANOS:
%
% 2.1 Vetores:
%randi(1,n) cria um n-vetor aleatorio com entradas inteiras
%pe(V,W) calcula o produto escalar entre V e W
%no(V) calcula a norma de V (i.e, sqrt(v1^2+...+vn^2))
%pv(V,W) calcula o produto vetorial V x W
%proj(W,V) calcula a projeção de V sobre W
%desvet(V) desenha o vetor V. 
% 
% 2.2 Retas e Planos:
%lin(P,V) desenha a reta que passa por P com direção V 
%lin(P1,V1,P2,V2) desenha retas que passam por P1 e P2 com direções V1 e V2
%plan(P,N) desenha o plano que passa por P com normal N
%plan(P1,N1,P2,N2) desenha planos que passam por P1 e P2 com normais N1 e N2  
%plan(P1,N1,P2,N2,P3,N3) desenha planos que passam por P1, P2 e P3 com normais N1,N2 e N3 
%poplan(P1,P2,N2) desenha ponto P1 e plano passando por P2 com normal N2
%poline(P1,P2,V2) desenha ponto P1 e reta passando por P2 com direção V2
%lineplan(P1,V1,P2,N2) desenha reta passando por P1 com direção V1 e plano
%                      passando por P2 e normal N2
%po([P1;P2;...;Pn])  desenha os pontos P1, P2, ..., Pn 
%paraleg(P1,P2,P3,'cor') desenha o paralelogramo P1P2P3P4 
%lineseg(P1,P2,'cor') desenha o segmento de reta P1P2
%Informação por partes: 
%      help gaal1, help gaal2, help gaal3, 
%      help gaal4, help gaal5, help gaal6
%Informação sobre cada função: 
%      help nome da função
%Conteúdo do pacote gaal: 
%      help gaal
