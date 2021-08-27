function fluxlin(A,cor)
%fluxlin(A) desenha o fluxo associado ao sistema
%linear x'=Ax
%written by Reginaldo J. Santos DMat-ICex-UFMG  23 June 2004/17 March 2006
%
A=sym(A);
clf
hold on;
eps=10^(-4);
npts=8;
r=3;
if nargin ==1
 cor='b';
end
syms t
[P,D]=eig(double(A));
lambda1=D(1,1);
lambda2=D(2,2);
if isreal(lambda1)
 v=double(P(:,1));
 w=double(P(:,2));
 rr=max(max(abs([v,w])));
 if (lambda2*lambda1>0)&(abs(det(P))>eps)
  npts=2*npts;
  mlambda=max(diag(abs(D)));
  tmax=15/mlambda;
  ts=1/mlambda;
  for j=1:npts
   X0(:,j)=2*r*[v,w]*[cos(2*pi*j/npts);sin(2*pi*j/npts)];
  end
  if lambda1<0
   flag=1;
  else
   flag=-1;
  end
 elseif abs(det(P))<eps
  [P,D]=jordan(double(A));
  v=P(:,1);
  w=P(:,2);
  rr=max(max([v,w]));
  npts=2*npts;
  if abs(lambda1) < eps
   tmax=3*norm(w);
   ts=0.1*tmax;
   for j=1:npts/4
    x=r*norm(v)*j/npts;
    X0(:,j)=r*[v,w]*[0.5+norm(v)*j/npts;-x];
    X0(:,j+npts/4)=r*[v,w]*[0;x];
    X0(:,j+npts/2)=r*[v,w]*[-0.5-norm(v)*j/npts;x];
    X0(:,j+3*npts/4)=r*[v,w]*[0;-x];
   end
   lineseg(-1.5*r*v,1.5*r*v,cor,1); 
  else
   tmax=15/abs(lambda1);
   ts=tmax/30;
   for j=1:npts
    X0(:,j)=2*r*[v,w]*[cos(2*pi*j/npts);sin(2*pi*j/npts)];
   end
  end
  %po(X0');
  if lambda1>eps
   flag=-1;
  else
   flag=1;
  end
 elseif abs(lambda1*lambda2)>eps
  npts=2*npts;
  mlambda=max(diag(abs(D)));
  tmax=10/mlambda;
  ts=1/mlambda;
  if lambda1>0
     flag=-1;
  else
     flag=1;
  end
  for j=1:npts/4
   x=4*j/npts;
   X0(:,j)=r*[v,w]*[cosh(x);sinh(x)];
   X0(:,j+npts/4)=r*[v,w]*[cosh(x);-sinh(x)];
   X0(:,j+npts/2)=r*[v,w]*[-cosh(x);-sinh(x)];
   X0(:,j+3*npts/4)=r*[v,w]*[-cosh(x);sinh(x)];
   X0(:,npts+1)=r*[v,w]*[1;0];
   X0(:,npts+2)=r*[v,w]*[-1;0];
  end
  %po(X0');
  npts=npts+2;
  lineseg(2*r*w,-2*r*w,cor,1);
  vt=-0.05*r*rr*w/norm(w);
  vp=0.3*[vt(2),-vt(1)];
  P=-flag*w;
  fill([P(1)+vt(1),P(1)-vp(1),P(1)+vp(1)],...
   [P(2)+vt(2),P(2)-vp(2),P(2)+vp(2)],cor);
  plot([P(1)+vt(1),P(1)-vp(1),P(1)+vp(1),P(1)+vt(1)],...
   [P(2)+vt(2),P(2)-vp(2),P(2)+vp(2),P(2)+vt(2)],cor);
  vt=0.05*r*rr*w/norm(w);
  vp=0.3*[vt(2),-vt(1)];
  P=flag*w;
  fill([P(1)+vt(1),P(1)-vp(1),P(1)+vp(1)],...
   [P(2)+vt(2),P(2)-vp(2),P(2)+vp(2)],cor);
  plot([P(1)+vt(1),P(1)-vp(1),P(1)+vp(1),P(1)+vt(1)],...
   [P(2)+vt(2),P(2)-vp(2),P(2)+vp(2),P(2)+vt(2)],cor);
 else  
  %o primeiro autovalor é igual a zero  
  npts=2*npts;
  mlambda=max(diag(abs(D)));
  tmax=15/mlambda;
  ts=1/mlambda;
  if lambda2<0
     flag=1;
  else
     flag=-1;
  end
  for j=1:npts/4
   x=2*r*j/npts;
   X0(:,j)=r*[v,w]*[x;1];
   X0(:,j+npts/4)=r*[v,w]*[x;-1];
   X0(:,j+npts/2)=r*[v,w]*[-x;-1];
   X0(:,j+3*npts/4)=r*[v,w]*[-x;1];
   X0(:,npts+1)=r*[v,w]*[0;1];
   X0(:,npts+2)=r*[v,w]*[0;-1];
  end
  %po(X0');
  npts=npts+2;
  lineseg(2*r*v,-2*r*v,cor,1);
 end  
else
 alpha=double(real(lambda1));
 beta=double(imag(lambda1));
 v=double(real(P(:,1)));
 w=double(imag(P(:,1)));
 rr=max(max([v,w]));
 if abs(alpha) > eps
  tmax=5/abs(alpha);
  ts=0.5/abs(alpha);
 else 
  tmax=2*pi/abs(beta);
  ts=0;
 end
 if abs(alpha) < eps
  flag=1;  
  for j=1:npts
   X0(:,j)=1.5*rr*j*r*[v,w]*[1;1]/npts;
  end
  circle([0,0],0.02*r*rr,cor,5)
 else
  if alpha >0
      flag=-1;
  else
      flag=1;
  end
  for j=1:npts
   X0(:,j)=2*r*[v,w]*[cos(2*pi*j/npts);sin(2*pi*j/npts)];
  end
 end
end
X=expm(t*A)*X0;
if flag==1
  for j=1:npts
   plotc2(X(1,j),X(2,j),[0,tmax],cor,50);
  end
else
  for j=1:npts
   plotc2(X(1,j),X(2,j),[-tmax,0],cor,50);
  end
  ts=-ts;
end
A=double(A);
for j=1:npts
 P=double(subs(X(:,j),t,ts));
 vt=A*P;
 vt=0.05*r*rr*vt/norm(vt);
 vp=0.3*[vt(2),-vt(1)];
 fill([P(1)+vt(1),P(1)-vp(1),P(1)+vp(1)],...
   [P(2)+vt(2),P(2)-vp(2),P(2)+vp(2)],cor);
 plot([P(1)+vt(1),P(1)-vp(1),P(1)+vp(1),P(1)+vt(1)],...
   [P(2)+vt(2),P(2)-vp(2),P(2)+vp(2),P(2)+vt(2)],cor);
 axis(1.5*r*rr*[-1,1,-1,1]);
end
%axisc;
eixos2('x_1','x_2');
set(gca,'XTick',[])
set(gca,'YTick',[])
%set(gca,'XTickLabel','')
%set(gca,'YTickLabel','')
box;