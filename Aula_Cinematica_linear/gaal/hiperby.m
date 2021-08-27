function hiperby(a,b,P,X0,d)
%hiperby(a,b) plots the ellipse with center in the origin ( y^2/a^2-x^2/b^2=1).
%             desenha a elipse centro na origem ( y^2/a^2-x^2/b^2=1).
%
%hiperbx(a,b,P) plots the ellipse with center in the origin ( y1^2/a^2-x1^2/b^2=1),
%                    where [x;y]=P*[x1;y1].
%              desenha a elipse com centro na origem ( y1^2/a^2-x1^2/b^2=1), 
%                    onde [x;y]=P*[x1;y1].
%
%hiperbx(a,b,P,X0) plots the ellipse with the center in the point P*X0.
%                 desenha a elipse centro no ponto P*X0 ( y2^2/a^2-x2^2/b^2=1),
%                 onde [x;y]=P*[x1;y1] e [x2;y2]=[x1;y1]-X0
%
%       written by Reginaldo J. Santos DMat/ICEx/UFMG on 28 November 1997
%
%	Examples:
%	    hiperby(3,2,[1/sqrt(2),1/sqrt(2);-1/sqrt(2),1/sqrt(2)],[1;2])
%      hiperby(3,2,[1/sqrt(2),1/sqrt(2);-1/sqrt(2),1/sqrt(2)])
%      hiperby(3,2)
if nargin==2
   P=eye(2);
end;
clf
hold on
O=[0,0];
th=-1.2:2.4/200:1.2;
x2=b*sinh(th);
y2=a*cosh(th);
yy2=-y2;
x0=0;y0=0;X01=[0;0];
if nargin > 2
   P=double(P);
   W1=P(:,1);
   W2=P(:,2);
  nW1=norm(W1);
  if (nW1 - 1)>0.0001
    error('A matriz P tem que ser ortogonal');
  end
  nW2=norm(W2);
  if (nW2 - 1)>0.0001
    error('A matriz P tem que ser ortogonal');
  end
  x1=x2;
  yy1=yy2;
  y1=y2;
  plavec(O,1.5*b*W1,'k-','x`',1)
  plavec(O,1.5*a*W2,'k-','y`',1)
 % lineseg(-1.5*a*W2,O,'
  plavec(O,W1,'k-','')
  plavec(O,W2,'k-','')
  if nargin > 3
    X0=X0(:); X0=double(X0);
    x0=X0(1);y0=X0(2);
    x1=x1+X0(1);
    y1=y1+X0(2);
    X01=P*X0;
    yy1=yy1+X0(2);
    lineseg(-1.5*b*W1+X01,X01,'k-',1)
    plavec(X01,1.5*b*W1,'k-','x"',1)
    lineseg(X01-1.5*a*W2,X01,'k-',1)
    plavec(X01,1.5*a*W2,'k-','y"',1)
    lineseg(X01,P*[x0,0]','k:')
    lineseg(X01,P*[0,y0]','k:')
    lineseg(O,P*[x0,0]','k-',1)
    lineseg(O,P*[0,y0]','k-',1)
%    tex([-cosphi*0.4-senphi*y0,-senphi*0.4+cosphi*y0],num2str(y0));
%    tex([cosphi*x0+senphi*0.2,senphi*x0-cosphi*0.2],num2str(x0));
  end
  X=P*[x1;y1];
  XX=P*[x1;yy1];
else
  X=[x2;y2];
  XX=[x2;yy2];
end
if nargin < 5
  plot(X(1,:),X(2,:),'b')
  plot(XX(1,:),XX(2,:),'b')
end
axiss;
axisc;
lineseg(X01+1.5*P*[b;a],X01+1.5*P*[-b;-a],'b:',1);
lineseg(X01+1.5*P*[-b;a],X01+1.5*P*[b;-a],'b:',1);
%axis('off')

