function plotauva(A,S)
%plotauva(A) desenha os autovalores da matriz A
%            no plano complexo
%plotauva(A,S) o mesmo, mas com S sendo uma string feita de um elemento
%            de uma ou todas as 3 colunas seguintes:
%           y     yellow        .     point              -     solid
%           m     magenta       o     circle             :     dotted
%           c     cyan          x     x-mark             -.    dashdot 
%           r     red           +     plus               --    dashed   
%           g     green         *     star
%           b     blue          s     square
%           w     white         d     diamond
%           k     black         v     triangle (down)
%                               ^     triangle (up)
%                               <     triangle (left)
%                               >     triangle (right)
%                               p     pentagram
%                               h     hexagram

lambda=eig(A);
hold on;
if nargin==1
 plot(real(lambda),imag(lambda),'x');
else
 plot(real(lambda),imag(lambda),S);
end

