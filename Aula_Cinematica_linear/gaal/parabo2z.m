function parabo2z(a,b,c,P,X0)
%parabo2z(a,b,c) desenha o parabolóide elíptico
%                  cz=x^2/a^2-y^2/b^2
%parabo2z(a,b,c,P) desenha o parabolóide elíptico 
%                  cz1=x1^2/a^2-y1^2/b^2
%                  em que [x;y;z]=P*[x1;y1;z1]
%parabo2z(a,b,c,P,X0) desenha o parabolóide elíptico 
%                  cz2=x2^2/a^2-y2^2/b^2
%                  em que [x;y;z]=P*[x1;y1;z1] e [x1;y1;z1]=[x2;y2;z2]+X0
%       written by Reginaldo J. Santos DMat/ICEx/UFMG on 10 December 2001
%Exemplos:
%parabo2z(2,1,3)
%P=[0,1,0;3/5,0,4/5;4/5,0,-3/5]'
%parabo2z(sqrt(5),sqrt(3),sqrt(6),P)

clf
npts=9;
a=a*sqrt(abs(c));
b=b*sqrt(abs(c));
O=zeros(1,3);
if nargin >= 3
ll=1;
lll=1;
l=2*max([a,b]);
t=linspace(0,ll,npts);
s(:,1)=linspace(-lll,lll,npts)';
for k=2:npts
 s(:,k)=linspace(-log(lll*exp(ll)/t(k)),log(lll*exp(ll)/t(k)),npts)';
end
t=ones(npts,1)*t;
xx=a*t.*sinh(s);
yy=b*t.*cosh(s);
zz=t.^2;
s=-s;
xx=[xx;a*t.*cosh(s)];
yy=[yy;b*t.*sinh(s)];
zz=[zz;-t.^2];
t=linspace(0,-ll,npts);
t=ones(npts,1)*t;
s=-s;
xx=[xx;a*t.*sinh(s)];
yy=[yy;b*t.*cosh(s)];
zz=[zz;t.^2];
s=-s;
xx=[xx;a*t.*cosh(s)];
yy=[yy;b*t.*sinh(s)];
zz=[zz;-t.^2];
t=linspace(0,ll,npts);
clear s;
s(1)=-lll;
for k=2:npts
 s(k)=-log(lll*exp(ll)/t(k));
end
xx=[xx;a*t.*sinh(s)];
yy=[yy;b*t.*cosh(s)];
zz=[zz;t.^2];
zz=-sign(c)*zz;
x=xx;y=yy;z=zz;
end 
if nargin >= 4
 PP=P;P=double(P);
 if det(PP) ~= 1
  error('A matriz P deve ter determinante = 1!');
 end
 x=P(1,1)*xx+P(1,2)*yy+P(1,3)*zz;
 y=P(2,1)*xx+P(2,2)*yy+P(2,3)*zz;
 z=P(3,1)*xx+P(3,2)*yy+P(3,3)*zz;
 %if nargin == 4
  if P(:,1) == [1,0,0]'
   plavec(O,l*P(:,1),'k','x`=x',0.5);
   plavec(O,l*[0,1,0],'k','y',0.5);
   plavec(O,l*[0,0,1],'k','z',0.5);
   plavec(O,l*P(:,2),'k','y`',0.5);
   plavec(O,l*P(:,3),'k','z`',0.5);
  elseif P(:,1) == [0,1,0]'
   plavec(O,l*P(:,1),'k','x`=y',0.5);
   plavec(O,l*[1,0,0],'k','x',0.5);
   plavec(O,l*[0,0,1],'k','z',0.5);
   plavec(O,l*P(:,2),'k','y`',0.5);
   plavec(O,l*P(:,3),'k','z`',0.5);
  elseif P(:,1) == [0,0,1]'
   plavec(O,l*P(:,1),'k','x`=z',0.5);
   plavec(O,l*[0,1,0],'k','y',0.5);
   plavec(O,l*[1,0,0],'k','x',0.5);
   plavec(O,l*P(:,2),'k','y`',0.5);
   plavec(O,l*P(:,3),'k','z`',0.5);
  elseif P(:,2) == [1,0,0]'
   plavec(O,l*P(:,2),'k','y`=x',0.5);
   plavec(O,l*[0,1,0],'k','y',0.5);
   plavec(O,l*[0,0,1],'k','z',0.5);
   plavec(O,l*P(:,1),'k','x`',0.5);
   plavec(O,l*P(:,3),'k','z`',0.5);
  elseif P(:,2) == [0,1,0]'
   plavec(O,l*P(:,2),'k','y`=y',0.5);
   plavec(O,l*[1,0,0],'k','x',0.5);
   plavec(O,l*[0,0,1],'k','z',0.5);
   plavec(O,l*P(:,1),'k','x`',0.5);
   plavec(O,l*P(:,3),'k','z`',0.5);
  elseif P(:,2) == [0,0,1]'
   plavec(O,l*P(:,2),'k','y`=z',0.5);
   plavec(O,l*[0,1,0],'k','y',0.5);
   plavec(O,l*[1,0,0],'k','x',0.5);
   plavec(O,l*P(:,1),'k','x`',0.5);
   plavec(O,l*P(:,3),'k','z`',0.5);
  elseif P(:,3) == [1,0,0]'
   plavec(O,l*P(:,3),'k','z`=x',0.5);
   plavec(O,l*[0,1,0],'k','y',0.5);
   plavec(O,l*[0,0,1],'k','z',0.5);
   plavec(O,l*P(:,2),'k','y`',0.5);
   plavec(O,l*P(:,1),'k','x`',0.5);
  elseif P(:,3) == [0,1,0]'
   plavec(O,l*P(:,3),'k','z`=y',0.5);
   plavec(O,l*[1,0,0],'k','x',0.5);
   plavec(O,l*[0,0,1],'k','z',0.5);
   plavec(O,l*P(:,2),'k','y`',0.5);
   plavec(O,l*P(:,1),'k','x`',0.5);
  elseif P(:,3) == [0,0,1]'
   plavec(O,l*P(:,3),'k','z`=z',0.5);
   plavec(O,l*[0,1,0],'k','y',0.5);
   plavec(O,l*[1,0,0],'k','x',0.5);
   plavec(O,l*P(:,2),'k','y`',0.5);
   plavec(O,l*P(:,1),'k','x`',0.5);
  else
   plavec(O,l*P(:,3),'k','z`',0.5);
   plavec(O,l*P(:,2),'k','y`',0.5);
   plavec(O,l*P(:,1),'k','x`',0.5);
   plavec(O,l*[0,0,1],'k','z',0.5);
   plavec(O,l*[0,1,0],'k','y',0.5);
   plavec(O,l*[1,0,0],'k','x',0.5);
  end
 %end
end
if nargin == 5
 x=x+X0(1);
 y=y+X0(2);
 z=z+X0(3);
 plavec(X0,l*P(:,3),'k','z``',0.5);
 plavec(X0,l*P(:,2),'k','y``',0.5);
 plavec(X0,l*P(:,1),'k','x``',0.5);
end
surfl(x,y,z)
axis([0 l 0 l 0 l]);
colormap(mycolor);
axiss;
axis('off');
if nargin == 3
 eixos;
end
%shading faceted;
axis([-l l -l l -l l]);
view([120,20]);

 
