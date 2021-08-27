function paralep(p1,p2,p3,p4,cor,th)
%paralep(p1,p2,p3,p4,'cor') desenha um paralelepipedo
%       written by Reginaldo J. Santos on 24 Juny 1999
%                    DMat/ICEx/UFMG

p1=p1(:);
p2=p2(:);
p3=p3(:);
p4=p4(:);
if (nargin<6)
  th=2;
end
lineseg(p1,p2,cor,th);
lineseg(p1,p3,cor,th);
lineseg(p1,p4,cor,th);
lineseg(p2,p2+(p3-p1),cor,th);
lineseg(p3,p3+(p2-p1),cor,th);
lineseg(p2,p2+(p4-p1),cor,th);
lineseg(p3,p3+(p4-p1),cor,th);
lineseg(p4,p4+(p3-p1),cor,th);
lineseg(p4,p4+(p2-p1),cor,th);
p5=p1+p2+p3+p4-3*p1;
lineseg(p5,p5-(p2-p1),cor,th);
lineseg(p5,p5-(p3-p1),cor,th);
lineseg(p5,p5-(p4-p1),cor,th);

 