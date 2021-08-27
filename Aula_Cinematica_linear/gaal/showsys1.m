function pn=showsys1(Au)
%SHOWSYS1([A b]) shows graphically the system Ax=b
%
%       written by Reginaldo J. Santos on 29 May 1996 - DMAT/UFMG

[m n]=size(Au);
if (m>3)|(n>4)
  error('This function is for smaller matrices!!!')
  return
end
A=Au(:,1:n-1);
b=Au(:,n);
if (n==4)
  if (m==1)
    plan1(A,-b(1),'y');
  elseif (m==2)
    plan2(A(1,:),-b(1),A(2,:),-b(2));
  elseif (m==3)
    [mnor,ind]=min([norm(A(1,:)) norm(A(2,:)) norm(A(3,:))]);
    if (mnor<1e-4)
      if (ind==1)
        pn=plan2(A(2,:),-b(2),A(3,:),-b(3));
      elseif (ind==2)
        pn=plan2(A(1,:),-b(1),A(3,:),-b(3));
      else
        pn=plan2(A(1,:),-b(1),A(2,:),-b(2));
      end
    else
      if (norm(A(1,:)-A(2,:))<1e-4)
        pn=plan2(A(2,:),-b(2),A(3,:),-b(3));
      elseif (norm(A(2,:)-A(3,:))<1e-4)
        pn=plan2(A(1,:),-b(1),A(2,:),-b(2));
      elseif (norm(A(1,:)-A(3,:))<1e-4)
        pn=plan2(A(1,:),-b(1),A(2,:),-b(2));
      else
        pn=plan3(A(1,:),-b(1),A(2,:),-b(2),A(3,:),-b(3));
      end
    end
    axis([pn(1)-1 pn(1)+1 pn(2)-1 pn(2)+1 pn(3)-1 pn(3)+1]);
    box;
    axis('on');
  end
end
if (n==3)
  R=rref([A b]);
  pn=A\b;
  if (m==1)
    if (A(1,2)==0)
      line1(pn,[1 0],'g');
    elseif (A(1,1)==0)
      line1(pn,[0 1],'g');
    else
      v=[A(1,2) -A(1,1)];
      line1(pn,v/norm(v),'g');
    end
  end
  if (m==2)|((m==3)&(norm(A(3,:))<1e-5))
    if (A(1,2)==0)
      line1(pn,[1 0],'g');
    elseif (A(1,1)==0)
      line1(pn,[0 1],'g');
    else
      v=[A(1,2) -A(1,1)];
      line1(pn,v/norm(v),'g');
    end
    if (A(2,2)==0)
      line1(pn,[1 0],'y');
    elseif (A(2,1)==0)
      line1(pn,[0 1],'y');
    else
      v=[A(2,2) -A(2,1)];
      line1(pn,v/norm(v),'y');
    end
  end
  if (m==3)&(norm(A(3,:))>1e-5)
    p12=pinv(A(1:2,:))*b(1:2);
    p13=pinv([A(1,:);A(3,:)])*[b(1);b(3)];
    p23=pinv(A(2:3,:))*b(2:3);
    v1=(p12-p13);
    v2=(p12-p23);
    v3=(p13-p23);
    nmax=max([norm(v1),norm(v2),norm(v3)]);
    if (nmax<1e-5)
      if (A(1,2)==0)
        line1(pn,[0 1],'g');
      elseif (A(1,1)==0)
        line1(pn,[1 0],'g');
      else
        v=[A(1,2) -A(1,1)];
        line1(pn,v/norm(v),'g');
      end
      if (A(2,2)==0)
        line1(pn,[0 1],'y');
      elseif (A(2,1)==0)
        line1(pn,[1 0],'y');
      else
        v=[A(2,2) -A(2,1)];
        line1(pn,v/norm(v),'y');
      end
      if (A(3,2)==0)&(A(3,1)~=0)
        line1(pn,[0 1],'r');
      elseif (A(3,1)==0)&(A(3,2)~=0)
        line1(pn,[1 0],'r');
      else
        v=[A(3,2) -A(3,1)];
        nv=norm(v);
        if (nv~=0)
          line1(pn,v/nv,'r');
        end
      end
    else
      p1=pn+(b(1)-A(1,:)*pn)*A(1,:)'/(A(1,:)*A(1,:)');
      if (A(1,2)==0)
        line1(p1,[0 1]*nmax,'g');
      elseif (A(1,1)==0)
        line1(p1,[1 0]*nmax,'g');
      else
%        v=[A(1,2) -A(1,1)];
        v=(p12-p13);
        lineseg(p12,p13,'g');
      end
      p2=pn+(b(2)-A(2,:)*pn)*A(2,:)'/(A(2,:)*A(2,:)');
      if (A(2,2)==0)
        line1(p2,[0 1],'y');
      elseif (A(2,1)==0)
        line1(p2,[1 0],'y');
      else
%        v=[A(2,2) -A(2,1)];
        v=(p12-p23);
        lineseg(p12,p23,'y');
      end
      p3=pn+(b(3)-A(3,:)*pn)*A(3,:)'/(A(3,:)*A(3,:)');
      if (A(3,2)==0)&(A(3,1)~=0)
        line1(p3,[0 1],'r');
      elseif (A(3,1)==0)&(A(3,2)~=0)
        line1(p3,[1 0],'r');
      else
%       v=[A(3,2) -A(3,1)];
        v=(p13-p23);
        nv=norm(v);
        if (nv~=0)
          lineseg(p13,p23,'r');
        end
      end
    end
  end
end  
point1(pn,'','w');

