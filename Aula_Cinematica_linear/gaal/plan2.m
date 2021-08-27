function pn=plan2(p1,n1,p2,n2,m,cor1,cor2)
%pn=PLAN2(n1,d1,n2,d2) displays two planes, which have
%                            normal vectors n1, n2 and n3 and 
%                            equations ni(1)*x + ni(2)*y + ni(3)*z + di = 0.
%pn=PLAN2(p1,n1,p2,n2) displays two planes, which contains the points
%                      p1 and p2 respectively and have normal vectors
%                      n1 and n2  respectively.
%               If n1 and n2 are not paralel pn is a point in the intersection.
%               If n1 and n2 are paralel pn is the point of the second plane,
%               which is nearest from p1.
%
%       written by Reginaldo J. Santos on 23 November 1997
%                     DMat-ICEx-UFMG

if (nargin<5)
  cor1='g';
  cor2='y';
end
p1=p1(:);
n1=n1(:);
p2=p2(:);
n2=n2(:);
if (length(n1)==1)&(length(n2)==1)
  d1=n1; d2=n2;
  n1=p1; n2=p2;
  b=[-d1 -d2]';
  p1=-n1'\d1; p2=-n2'\d2;
else
  b=[p1'*n1 p2'*n2]';
end 
b(1)=b(1)/norm(n1);n1=n1/norm(n1); 
b(2)=b(2)/norm(n2);n2=n2/norm(n2); 
tol=1e-4;
if (nargin<5)
  m=8;
end
if abs(n1'*n2-1)<tol
% paralels plans
  pn=p1 - ((p2-p1)'*n2)*n2;
  plan1(p1,n1,cor1,m);
  plan1(pn,n2,cor2,m);
else
  A=[n1 n2]';
  pn=pinv(A)*b;
  v=vecprod(n1,n2);
  v=v/(norm(v)*sqrt(2));
  v12=vecprod(v,n1);
  v12=v12/(norm(v12)*sqrt(2));
  v22=vecprod(v,n2);
  v22=v22/(norm(v22)*sqrt(2));
  paraleg(pn-v-v12,pn+v-v12,pn-v+v12,cor1,m);
  paraleg(pn-v-v22,pn+v-v22,pn-v+v22,cor2,m);
end
%axis('off');
%axissqua;
grid off;
%set(gca,['x','tick'],[],['y','tick'],[],['z','tick'],[])

