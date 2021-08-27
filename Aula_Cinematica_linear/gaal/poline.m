function p2n=poline(p1,p2,v2)
%poline(P1,P2,V2) displays a point P1 and a straight line,
%        which contains the point P2 and has direction V2
%        desenha ponto P1 e reta passando por P2 com direção V2
%
%       written by Reginaldo J. Santos on 22 November 1997 
%                  DMat/ICEx/UFMG


v2=v2(:);
p2=p2(:);
p1=p1(:);
v2=v2/norm(v2);
  t=(p1-p2)'*v2;
  p2n=p2+t*v2;
  line1(p2,v2,'g');
  line1((p1+p2)/2,(p2-p1)/2,'r:');
  point1(p1);
  %axis('off')
  axiss;
  grid off;
%set(gca,['x','tick'],[],['y','tick'],[],['z','tick'],[]);

