function plan1(p,n,color,m)
%PLAN1(n,d[,color]) displays a plane, that has normal vector n
%          and equation n(1)*x + n(2)*y + n(3)*z + d = 0.
%PLAN1(p,n[,color]) displays a plane, that has normal vector n
%          and contains the point p.
%          The color is optional and can be one of
%         'y'     yellow 	    'r'     red         
% 	       'g'     green	       'b'     blue          
%
%       Written by Reginaldo J. Santos on 5 December 1998 
%                      DMat-ICEx-UFMG


n=n(:);
p=p(:);
if (length(n)==1)
  d=n;
  n=p;
  p=-n'\d;
end
if(nargin<4) 
  m=8;
end;
if nargin>=3
  if color=='r'
    cor=0;
  elseif color=='y'
    cor=0.18;
  elseif color=='g'
    cor=0.3;
  elseif color=='b'
    cor=8/15;
  else
     cor=color;
  end;
elseif nargin==2
  cor=0.3;   
end
nn=norm(n);
nnxy2=(n(1)^2+n(2)^2);
nnxy=sqrt(nnxy2);
s=-1:2/m:1;
t=s;
if (nnxy~=0)
  np1=nn*[-n(2) n(1) 0]/nnxy;
  np2=[n(1)*n(3) n(2)*n(3) -nnxy2]/nnxy;
else
  np1=[nn 0 0];
  np2=[0 nn 0];
end
  for i=1:m+1
    for j=1:m+1
      x(i,j)=p(1)+s(i)*np1(1)+t(j)*np2(1);
      y(i,j)=p(2)+s(i)*np1(2)+t(j)*np2(2);
      z(i,j)=p(3)+s(i)*np1(3)+t(j)*np2(3);
    end  
  end
%colormap(hsv);
surf(x,y,z,cor*ones(m+1,m+1));
caxis([0 1]);
%shading flat;
hold on

