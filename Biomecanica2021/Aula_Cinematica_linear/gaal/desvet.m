function desvet(p,v,color,name)
%desvet(v)   desenha o vetor v na origem
%desvet(p,v) desenha o vetor v no ponto p
%desvet(v,color) desenha o vetor v na origem com cor color 
%desvet(p,v,color) desenha o vetor v no ponto p com cor color.
%desvet(p,v,color,'name') desenha o vetor v no ponto p
%                       com cor color e escreve o nome name. 
%          A  cor pode ser uma de
%         'y'     amarelo     'm'     magenta       
%         'c'     cyan        'r'     vermelho         
%         'g'     verde       'b'     azul          
%         'w'     branco      'k'     preto   
%
%       written by Reginaldo J. Santos on 23 November 1997 
%                  DMat/ICEx/UFMG
if nargin==1
   plavec(p);
elseif nargin==2
   plavec(p,v);
elseif nargin==3
   plavec(p,v,color);
elseif nargin==4   
   plavec(p,v,color,name);
end

daspect([1, 1, 1])
box on
grid on
xlabel('Eixo X')
ylabel('Eixo Y')
zlabel('Eixo Z')