function pn=plan3(p1,n1,p2,n2,p3,n3,m,cor1,cor2,cor3)
%pn=PLAN3(n1,d1,n2,d2,n3,d3) displays three planes, which have
%                            normal vectors n1, n2 and n3 and 
%                            equations ni(1)*x + ni(2)*y + ni(3)*z + di = 0.
%pn=PLAN3(p1,n1,p2,n2,p3,n3) displays three planes, which contains
%                      the points p1, p2 and p3 respectively
%                      and have normal vectors n1, n2 and n3
%                      respectively.
%                      pn is a point in the intersection or "near"
%
%       written by Reginaldo J. Santos on 5 December 1998
%                      DMat-ICEx-UFMG


if (nargin<10)
  cor1='g';
  cor2='y';
  cor3='r';
end
p1=p1(:);
n1=n1(:);
p2=p2(:);
n2=n2(:);
p3=p3(:);
n3=n3(:);
if (length(n1)==1)&(length(n2)==1)&(length(n3)==1)
  b(1)=-n1;
  b(2)=-n2;
  b(3)=-n3;
  n1=p1; n2=p2; n3=p3;
else
  b(1)=p1'*n1;
  b(2)=p2'*n2;
  b(3)=p3'*n3;
end
nn1=norm(n1);
nn2=norm(n2);
nn3=norm(n3);
n1=n1/nn1; b(1)=b(1)/nn1;
n2=n2/nn2; b(2)=b(2)/nn2;
n3=n3/nn3; b(3)=b(3)/nn3;
A=[n1 n2 n3]';
b=b(:);
ran=rank(A);
pn=pinv(A)*b;
if (nargin<7)
  m=8;
end
if (ran==3)
  v12=vecprod(n1,n2);
  v12=v12/norm(v12);
  v13=vecprod(n1,n3);
  v13=v13/norm(v13);
  v23=vecprod(n2,n3);
  v23=v23/norm(v23);
  v12v13=abs(v12'*v13);
  v12v23=abs(v12'*v23);
  v13v23=abs(v13'*v23);
  alpha=1/sqrt(2+2*v12v13);
  v12n=alpha*v12;
  v13n=alpha*v13;
  paraleg(pn-v12n-v13n,pn+v12n-v13n,pn+v13n-v12n,cor1,m);
  alpha=1/sqrt(2+2*v12v23);
  v12n=alpha*v12;
  v23n=alpha*v23;
  paraleg(pn-v12n-v23n,pn+v12n-v23n,pn+v23n-v12n,cor2,m);
  alpha=1/sqrt(2+2*v13v23);
  v23n=alpha*v23;
  v13n=alpha*v13;
  paraleg(pn-v23n-v13n,pn+v23n-v13n,pn+v13n-v23n,cor3,m);
elseif (ran==2) 
  v12=vecprod(n1,n2);
  nv12=norm(v12);
  v13=vecprod(n1,n3);
  nv13=norm(v13);
  v23=vecprod(n2,n3);
  nv23=norm(v23);
  [mnv,ind]=min([nv23 nv13 nv12]);
  % Two planes are paralels
  if (mnv<1e-4)
    if (ind==1)
      v=v12/nv12;
      B=A;
      c=b;
      B(3,:)=v';
      c(3)=pn'*v;
      p12=pinv(B)*c;
      B=A;
      c=b;
      B(2,:)=v';
      c(2)=pn'*v;
      p13=pinv(B)*c;
      npp=norm(p12-p13);
      if npp>1e-4
        v22=vecprod(n2,v);
        v22=2*npp*v22/norm(v22);
        v32=vecprod(n3,v);
        v32=2*npp*v32/norm(v32);
        v=4*npp*v;
        paraleg(p13+(p13-p12)/2,p12+(p12-p13)/2,p13+(p13-p12)/2+v,cor1,m);
        paraleg(p12-v22,p12+v22,p12+v-v22,cor2,m);
        paraleg(p13-v32,p13+v32,p13+v-v32,cor3,m);
      else
        plan2(p1,n1,p2,n2,m,cor1,cor2);
      end
       
      elseif (ind==2)
      v=v23/nv23;
      B=A;
      c=b;
      B(3,:)=v';
      c(3)=pn'*v;
      p12=pinv(B)*c;
      B=A;
      c=b;
      B(1,:)=v';
      c(1)=pn'*v;
      p23=pinv(B)*c;
      npp=norm(p12-p23);
      if npp>1e-4
        v12=vecprod(n1,v);
        v12=2*npp*v12/norm(v12);
        v32=vecprod(n3,v);
        v32=2*npp*v32/norm(v32);
        v=4*npp*v;
        paraleg(p23+(p23-p12)/2,p12+(p12-p23)/2,p23+(p23-p12)/2+v,cor2,m);
        paraleg(p12-v12,p12+v12,p12+v-v12,cor1,m);
        paraleg(p23-v32,p23+v32,p23+v-v32,cor3,m);
      else
        plan2(n1,p1,n2,p2,m,cor1,cor2);
      end
      
     else
      v=v23/nv23;
      B=A;
      c=b;
      B(1,:)=v';
      c(1)=pn'*v;
      p23=pinv(B)*c;
      B=A;
      c=b;
      B(2,:)=v';
      c(2)=pn'*v;
      p13=pinv(B)*c;
      npp=norm(p23-p13);
      if npp>1e-4
        v22=vecprod(n2,v);
        v22=2*npp*v22/norm(v22);
        v12=vecprod(n1,v);
        v12=2*npp*v12/norm(v12);
        v=4*npp*v;
        paraleg(p13+(p13-p23)/2,p23+(p23-p13)/2,p13+(p13-p23)/2+v,cor3,m);
        paraleg(p13-v12,p13+v12,p13-v12+v,cor1,m);
        paraleg(p23-v22,p23+v22,p23-v22+v,cor2,m);
      else
        plan2(n1,p1,n3,p3,m,cor1,cor3);
      end;
       
    end  
  else
    v=v12;     
    v=v/norm(v);
    B=A;
    c=b;
    B(3,:)=v';
    c(3)=pn'*v;
    p12=pinv(B)*c;
    B=A;
    c=b;
    B(2,:)=v';
    c(2)=pn'*v;
    p13=pinv(B)*c;
    B=A;
    c=b;
    B(1,:)=v';
    c(1)=pn'*v;
    p23=pinv(B)*c;
    len=max([norm(p12-p13) norm(p12-p23)...
                  norm(p23-p13)]);
    if (len>1.e-4)
      v=len*v;
      paraleg(p13+(p13-p12)/2,p12+(p12-p13)/2,p13+(p13-p12)/2+v,cor1,m);
      paraleg(p23+(p23-p12)/2,p12+(p12-p23)/2,p23+(p23-p12)/2+v,cor2,m);
      paraleg(p23+(p23-p13)/2,p13+(p13-p23)/2,p23+(p23-p13)/2+v,cor3,m);
      point1(pn,'','w');
    else
      v=v/sqrt(2);
      v12=vecprod(n1,v);
      v12=v12/(norm(v12)*sqrt(2));
      v22=vecprod(n2,v);
      v22=v22/(norm(v22)*sqrt(2));
      v32=vecprod(n3,v);
      v32=v32/(norm(v32)*sqrt(2));
      paraleg(p13-v12-v,p13+v12-v,p13-v12+v,cor1,m);
      paraleg(p23-v22-v,p23+v22-v,p23-v22+v,cor2,m);
      paraleg(p23-v32-v,p23+v32-v,p23-v32+v,cor3,m);
    end
  end      
 else
  p1=(pinv(n1)*b(1))';
  p2=(pinv(n2)*b(2))';
  p3=(pinv(n3)*b(3))';
  if abs((p2-p1)'*n1)<1e-4
   if abs((p1-p3)'*n1)<1e-4
    poplan(pn,p1,n1,cor1,m);
   else
    poplan(pn,p1,n1,cor1,m);
    poplan(pn,p3,n3,cor3,m);
   end
  elseif abs((p3-p1)'*n1)<1e-4
    poplan(pn,p1,n1,cor1,m);
    poplan(pn,p2,n2,cor2,m);
  elseif abs((p2-p3)'*n1)<1e-4
    poplan(pn,p1,n1,cor1,m);
    poplan(pn,p2,n2,cor2,m);
  else 
    poplan(pn,p1,n1,cor1,m);
    poplan(pn,p2,n2,cor2,m);
    poplan(pn,p3,n3,cor3,m);
   end
   
end
%axis('off');
%axissqua;
grid off;
%set(gca,['x','tick'],[],['y','tick'],[],['z','tick'],[])

