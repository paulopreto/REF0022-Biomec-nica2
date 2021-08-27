function p2n=lineplan(p1,v1,p2,n2,cor1,cor2,cor3)
%P=lineplan(P,V,N,d) displays a straight line, that contains
%                   the point P and has direction V and the plane with
%                   equation n1*x + n2*y + n3*z + d = 0.
%              desenha reta passando por P com direção V e plano
%              passando com normal N2 e equação n1*x + n2*y + n3*z + d = 0.
%
%P=lineplan(P1,V1,P2,N2) displays a straight line, that contains
%                   the point P1 and has direction V1 and the plane, that
%                   contains the point P2 and have normal vector N2.
%                   P is the point of the plane, that is nearest from P1
%               desenha reta passando por P1 com direção V1 e plano
%               passando por P2 e normal N2.
%
%       written by Reginaldo J. Santos on 11 November 1998 
%                  DMat/ICEx/UFMG

if (nargin<5)
  cor1='y';
  cor2='g';
  cor3='r:';
end

p1=p1(:);
v1=v1(:);
p2=p2(:);
n2=n2(:);
if (length(n2)==1)
  d2=n2;
  n2=p2;
  p2=-n2'\d2;
end
v1=v1/norm(v1);
n2=n2/norm(n2);
tol=1e-4;
if(abs(v1'*n2)<tol)
% straight line and plane paralels 
  p2n=p1 - ((p2-p1)'*n2)*n2;
  plan1(p2n,n2,cor2,8);
  hold on;
  lineseg(p1,p1+v1/2,cor1);
  lineseg(p1,p1-v1/2,cor1);
  lineseg(p1+v1/2,p1+v1,cor1);
  lineseg(p1-v1/2,p1-v1,cor1);
  line1((p1+p2n)/2,(p2n-p1)/2,cor3);
else
  t=(p2-p1)'*n2/(v1'*n2);
  p2n=p1 + t*v1;
  plan1(p2n,n2,cor2,8);
  lineseg(p2n,p2n+v1/2,cor1);
  lineseg(p2n+v1/2,p2n+v1,cor1);
  lineseg(p2n,p2n-v1/2,cor1);
  lineseg(p2n-v1/2,p2n-v1,cor1);
end
%axis('off');
axissqua;
grid off;
%set(gca,['x','tick'],[],['y','tick'],[],['z','tick'],[])

