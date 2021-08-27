function po(P,color)
%po([P1;P2;...;Pn]) shows the points P1,..,Pn
%                   desenha os pontos P1,..,Pn
%
%po([P1;P2;...;Pn],color) shows the points P1,..,Pn
%                   desenha os pontos P1,..,Pn com a cor color
%          The color can be one of (A cor pode ser:)
%         'yo'     yellow(amarelo)      'mo'     magenta       
%         'co'     cyan                 'ro'     red(vermelho)         
%         'go'     green(verde)         'bo'     blue(azul)          
%         'wo'     white(branco)        'ko'     black(preto)   
%
%       written by Reginaldo J. Santos on 18 November 1998
%                     DMat-ICEx-UFMG
%
%Exemplos:
%po([5,0;-3,4;1,3]) desenha os pontos p1=[5,0],p2=[-3,4],p3=[1,3]
%po([5,0;-3,4;1,3],'bo') o mesmo que o anterior, mas de cor azul
[m,n]=size(P);
P=double(P);
if nargin==1
   color='ko';
end
if n==2
   plot(P(:,1),P(:,2),color);
end
if n==3
   plot3(P(:,1),P(:,2),P(:,3),color);
end
hold on