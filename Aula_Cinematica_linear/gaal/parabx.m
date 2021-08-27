function parabx(p,P,X0)
%parabx(p)          desenha a parabola y^2=4px
%parabx(p,P)      desenha a parabola y1^2=4px1, onde [x;y]=P*[x1;y1].
%parabx(p,P,X0)  desenha a parabola y2^2=4px2, 
%                  onde [x;y]=P*[x1;y1] e [x2;y2]=[x1;y1]-X0
%
%    written by Reginaldo J. Santos DMat/ICEx/UFMG 
%                      on 13 July 2000
%
%	Exemplos:
%	    parabx(2,[1/sqrt(2);1/sqrt(2)],[1;2])
%           parabx(2,[1/sqrt(5);2/sqrt(5)])
%           parabx(2)
clf
hold on
O=[0,0];
mp=abs(p);
if (mp < 1/4)
  t=-1:6/300:1;
else
  t=-4*mp:6/300:4*mp;
end
x2=t.^2/(4*p);
y2=t;
%if mp > 1
%  mp=mp/2;
%else
%  mp=mp*2;
%end;
%axis([-6 7 -5 7]);
if nargin > 1
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
  if (p>0)
    if (p<1/4)
      plavec(W1/(4*p),0.5*W1/(4*p),'k-','x`',1)
      lineseg(O,W1/(4*p),'k-',1)
%      plavec(-2*[-senphi,cosphi],4*[-senphi,cosphi],'w-','y`',1)
      plavec(W2,W2,'k-','y`',1)
      lineseg(-2*W2,W2,'k-',1)
    else
      plavec(O,1.5*p*4*W1,'k-','x`',1)
      plavec(O,1.5*4*p*W2,'k-','y`',1)
      lineseg(-1.5*4*p*W2,O,'k-',1)
    end
  elseif (p<0)
    if (p>-1/4)
      plavec(O,-0.5*W1/(4*p),'k-','x`',1)
      lineseg(O,W1/(4*p),'k-',1)
      lineseg(1.5*p*4*W1,O,'k-',1)
      plavec(-2*W2,4*W2,'k-','y`',1)
%      plavec(O,2*[-senphi,cosphi],'w-','y`',1)
%      lineseg(-2*[-senphi,cosphi],O,'w-',1)
    else
      plavec(O,-1.5*p*4*W1,'k-','x`',1)
      lineseg(1.5*p*4*W1,O,'k-',1)
      plavec(O,-1.5*4*p*W2,'k-','y`',1)
      lineseg(1.5*4*p*W2,O,'k-',1)
    end
  end
  plavec(O,W1,'k-','')
  plavec(O,W2,'k-','')
  if nargin == 3
    X0=X0(:); X0=double(X0);
    x0=X0(1,1);
    y0=X0(2,1);
    x1=x1+x0;
    y1=y1+y0;
    X01=P*X0;
    if (p>0)
    if (p<1/4)
      plavec(X01+W1/(4*p),0.5*W1/(4*p),'k-','x"',1)
      lineseg(X01,X01+W1/(4*p),'k-',1)
      plavec(X01,2*W2,'k-','y"',1)
%      plavec(-2*[-senphi,cosphi]+[x01,y01],4*[-senphi,cosphi],'w-','y"',1)
      lineseg(X01-2*W2,X01,'k-',1)
%      plavec([x01,y01],1.5*[cosphi,senphi],'w-','x"',1)
%      plavec([x01,y01],1.5*[-senphi,cosphi],'w-','y"',1)
%      lineseg(-1.5*[-senphi,cosphi]+[x01,y01],[x01,y01],'w-',1)
    else
      plavec(X01,1.5*p*4*W1,'k-','x"',1)
      plavec(X01,1.5*4*p*W2,'k-','y"',1)
      lineseg(-1.5*4*p*W2+X01,X01,'k-',1)
    end
    elseif(p<0)
    if (p>-1/4)
      plavec(X01,-0.6*W1/(4*p),'k-','x"',1)
      lineseg(X01,X01+W1/(4*p),'k-',1)
      lineseg(X01+1.5*p*4*W2,X01,'k-',1)
      plavec(X01-2*W2,4*W2,'k-','y"',1)
%      plavec([x01,y01],2*[-senphi,cosphi],'w-','y"',1)
%      lineseg([x01,y01]-2*[-senphi,cosphi],[x01,y01],'w-',1)
%      plavec([x01,y01],1.5*[cosphi,senphi],'w-','x"',1)
%      lineseg(1.5*p*4*[cosphi,senphi]+[x01,y01],[x01,y01],'w-',1)
%      plavec([x01,y01],1.5*[-senphi,cosphi],'w-','y"',1)
%      lineseg(-1.5*[-senphi,cosphi]+[x01,y01],[x01,y01],'w-',1)
    else
      plavec(X01,-1.5*p*4*W1,'k-','x"',1)
      lineseg(1.5*p*4*W1+X01,X01,'k-',1)
      plavec(X01,-1.5*4*p*W2,'k-','y"',1)
      lineseg(1.5*4*p*W2+X01,X01,'k-',1)
    end
    end
    lineseg(X01,P*[x0;0],'k:')
    lineseg(X01,P*[0;y0],'k:')
    lineseg(O,P*[x0;0],'k-',1)
    lineseg(O,P*[0;y0],'k-',1)
%    tex([-cosphi*0.4-senphi*y0,-senphi*0.4+cosphi*y0],num2str(y0));
%    tex([cosphi*x0+senphi*0.2,senphi*x0-cosphi*0.2],num2str(x0));
end
  X=P*[x1;y1];
else
  X=[x2;y2];
end
plot(X(1,:),X(2,:),'b')
axiss;
axisc;
%axis('off')

