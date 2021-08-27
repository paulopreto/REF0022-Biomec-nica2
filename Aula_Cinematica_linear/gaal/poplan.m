function p2n=poplan(p1,p2,n2,color,m)
%P=poplan(P,N,d) displays a point P and a plane, that has normal
%                vector N and equation n1*x + n2*y + n3*z + d = 0.
%    desenha ponto P e plano com normal N, n1*x + n2*y + n3*z + d = 0.
%
%P=poplan(P1,P2,N) displays a point P1 and a plane, that contains 
%                  the points P2, has normal vector N.
%                  P is the point of the plane, nearest from P1.
%    desenha ponto P1 e plano passando por P2 com normal N2
%
%P=poplan(P1,P2,N2,color) is the same, but the plane has the color color.
%                   The color can be one of
%         'y'     yellow(amarelo) 	    'r'     red(vermelho)         
% 	       'g'     green(verde)	       'b'     blue(azul)          
%
%       written by Reginaldo J. Santos on 22 November 1997
%                      DMat/ICEx/UFMG


if(nargin<5)
  m=8;
  if(nargin<4)
    color='g';
  end
end
p1=p1(:);
p2=p2(:);
n2=n2(:);
if (length(n2)==1)
  d2=n2;
  n2=p2;
  p2=-n2'\d2;
end
n2=n2/norm(n2);
p2n=p1 + ((p2-p1)'*n2)*n2;
plan1(p2n,n2,color,m);
%line1((p1+p2n)/2,(p2n-p1)/2,'r:');
point1(p1);
%axis('off');
%axiss;
grid off;
%set(gca,['x','tick'],[],['y','tick'],[],['z','tick'],[]);

