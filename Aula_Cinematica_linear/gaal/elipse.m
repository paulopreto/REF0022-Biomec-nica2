function elipse(a,b,P,X0)
%elipse(a,b) plots the ellipse with center in the origin ( x^2/a^2+y^2/b^2=1).
%            desenha a elipse centro na origem ( x^2/a^2+y^2/b^2=1).
%
%elipse(a,b,P) plots the ellipse with center in the origin ( x1^2/a^2+y1^2/b^2=1),
%                    where [x;y]=P*[x1;y1].
%              desenha a elipse com centro na origem ( x1^2/a^2+y1^2/b^2=1), 
%                    onde [x;y]=P*[x1;y1].
%
%elipse(a,b,P,X0) plots the ellipse with the center in the point P*X0.
%                 desenha a elipse centro no ponto P*X0 ( x2^2/a^2+y2^2/b^2=1),
%                 onde [x;y]=P*[x1;y1] e [x2;y2]=[x1;y1]-X0
%
%       written by Reginaldo J. Santos DMat/ICEx/UFMG on 13 July 2000
%
%	Exemplos:
%	    elipse(3,2,[1/sqrt(2),1/sqrt(2);-1/sqrt(2),1/sqrt(2)],[1;2])
%	    elipse(3,2,[1/sqrt(2),1/sqrt(2);-1/sqrt(2),1/sqrt(2)])
%      elipse(3,2)
%
%
clf
hold on
O=[0,0];
th=0:2*pi/300:2*pi;
x2=a*cos(th);
y2=b*sin(th);
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
  y1=y2;
  plavec(O,1.5*a*W1,'k-','x`',1)
  plavec(O,1.5*b*W2,'k-','y`',1)
  plavec(O,W1,'k-','')
  plavec(O,W2,'k-','')
  if nargin == 4
    X0=X0(:); X0=double(X0);
    x0=X0(1);y0=X0(2);
    x1=x1+X0(1);
    y1=y1+X0(2);
    X01=P*X0;
    plavec(X01,1.5*a*W1,'k-','x"',1)
    plavec(X01,1.5*b*W2,'k-','y"',1)
    lineseg(X01,P*[x0,0]','k:')
    lineseg(X01,P*[0,y0]','k:')
    lineseg(O,P*[x0,0]','k-',1)
    lineseg(O,P*[0,y0]','k-',1)
%    tex([-cosphi*0.4-senphi*y0,-senphi*0.4+cosphi*y0],sym(X0,2,1));
%    tex([cosphi*x0+senphi*0.2,senphi*x0-cosphi*0.2],sym(X0,1,1));
  end
  X=P*[x1;y1];
else
  X=[x2;y2];
  axis([-1.5*a 1.5*a -1.5*b 1.5*b]);
end
plot(X(1,:),X(2,:),'b')
axiss;
axisc;
%axis('off')

