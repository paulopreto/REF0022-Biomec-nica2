function hiperbo2x(a,b,c,P,X0)
%hiperbo2x(a,b,c) desenha o hiperbolóide de duas folhas 
%                  x^2/a^2-y^2/b^2-z^2/c^2=1
%hiperbo2x(a,b,c,P) desenha o hiperbolóide de duas folhas 
%                  x1^2/a^2-y1^2/b^2-z1^2/c^2=1
%                  em que [x;y;z]=P*[x1;y1;z1]
%hiperbo2x(a,b,c,P,X0) desenha o hiperbolóide de duas folhas 
%                  x2^2/a^2-y2^2/b^2-z2^2/c^2=1
%                  em que [x;y;z]=P*[x1;y1;z1] e [x1;y1;z1]=[x2;y2;z2]+X0
%       written by Reginaldo J. Santos DMat/ICEx/UFMG on 8 December 2001
%Exemplos:
%hiperbo2x(1,2,2.5)
%P=[0,1,0;3/5,0,4/5;4/5,0,-3/5]'
%hiperbo2x(sqrt(5),sqrt(3),sqrt(6),P)

clf
npts=21;
l=3*max([a,b,c]);
O=zeros(1,3);
if nargin >= 3
 t=linspace(-1.2,1.2,npts);
 s=linspace(0,2*pi,npts);
 yy=b*sinh(t)'*sin(s);
 xx=a*cosh(t)'*ones(1,npts);
 zz=c*sinh(t)'*cos(s);
 x=xx;y=yy;z=zz;
 x2=-x;y2=y;z2=z;
end 
if nargin >= 4
 PP=P;P=double(P);
 if det(PP) ~= 1
  error('A matriz P deve ter determinante = 1!');
 end
 x=P(1,1)*xx+P(1,2)*yy+P(1,3)*zz;
 y=P(2,1)*xx+P(2,2)*yy+P(2,3)*zz;
 z=P(3,1)*xx+P(3,2)*yy+P(3,3)*zz;
 x2=-P(1,1)*xx+P(1,2)*yy+P(1,3)*zz;
 y2=-P(2,1)*xx+P(2,2)*yy+P(2,3)*zz;
 z2=-P(3,1)*xx+P(3,2)*yy+P(3,3)*zz;
 %if nargin == 4
  if P(:,1) == [1,0,0]'
   plavec(-l/2*P(:,1),l*P(:,1),'k','x`=x',0.5);
   plavec(O,l*[0,1,0],'k','y',0.5);
   plavec(O,l*[0,0,1],'k','z',0.5);
   plavec(-l/2*P(:,2),l*P(:,2),'k','y`',0.5);
   plavec(-l/2*P(:,3),l*P(:,3),'k','z`',0.5);
  elseif P(:,1) == [0,1,0]'
   plavec(-l/2*P(:,1),l*P(:,1),'k','x`=y',0.5);
   plavec(O,l*[1,0,0],'k','x',0.5);
   plavec(O,l*[0,0,1],'k','z',0.5);
   plavec(-l/2*P(:,2),l*P(:,2),'k','y`',0.5);
   plavec(-l/2*P(:,3),l*P(:,3),'k','z`',0.5);
  elseif P(:,1) == [0,0,1]'
   plavec(-l/2*P(:,1),l*P(:,1),'k','x`=z',0.5);
   plavec(O,l*[0,1,0],'k','y',0.5);
   plavec(O,l*[1,0,0],'k','x',0.5);
   plavec(-l/2*P(:,2),l*P(:,2),'k','y`',0.5);
   plavec(-l/2*P(:,3),l*P(:,3),'k','z`',0.5);
  elseif P(:,2) == [1,0,0]'
   plavec(-l/2*P(:,2),l*P(:,2),'k','y`=x',0.5);
   plavec(O,l*[0,1,0],'k','y',0.5);
   plavec(O,l*[0,0,1],'k','z',0.5);
   plavec(-l/2*P(:,1),l*P(:,1),'k','x`',0.5);
   plavec(-l/2*P(:,3),l*P(:,3),'k','z`',0.5);
  elseif P(:,2) == [0,1,0]'
   plavec(-l/2*P(:,2),l*P(:,2),'k','y`=y',0.5);
   plavec(O,l*[1,0,0],'k','x',0.5);
   plavec(O,l*[0,0,1],'k','z',0.5);
   plavec(-l/2*P(:,1),l*P(:,1),'k','x`',0.5);
   plavec(-l/2*P(:,3),l*P(:,3),'k','z`',0.5);
  elseif P(:,2) == [0,0,1]'
   plavec(-l/2*P(:,2),l*P(:,2),'k','y`=z',0.5);
   plavec(O,l*[0,1,0],'k','y',0.5);
   plavec(O,l*[1,0,0],'k','x',0.5);
   plavec(-l/2*P(:,1),l*P(:,1),'k','x`',0.5);
   plavec(-l/2*P(:,3),l*P(:,3),'k','z`',0.5);
  elseif P(:,3) == [1,0,0]'
   plavec(-l/2*P(:,3),l*P(:,3),'k','z`=x',0.5);
   plavec(O,l*[0,1,0],'k','y',0.5);
   plavec(O,l*[0,0,1],'k','z',0.5);
   plavec(-l/2*P(:,2),l*P(:,2),'k','y`',0.5);
   plavec(-l/2*P(:,1),l*P(:,1),'k','x`',0.5);
  elseif P(:,3) == [0,1,0]'
   plavec(-l/2*P(:,3),l*P(:,3),'k','z`=y',0.5);
   plavec(O,l*[1,0,0],'k','x',0.5);
   plavec(O,l*[0,0,1],'k','z',0.5);
   plavec(-l/2*P(:,2),l*P(:,2),'k','y`',0.5);
   plavec(-l/2*P(:,1),l*P(:,1),'k','x`',0.5);
  elseif P(:,3) == [0,0,1]'
   plavec(-l/2*P(:,3),l*P(:,3),'k','z`=z',0.5);
   plavec(O,l*[0,1,0],'k','y',0.5);
   plavec(O,l*[1,0,0],'k','x',0.5);
   plavec(-l/2*P(:,2),l*P(:,2),'k','y`',0.5);
   plavec(-l/2*P(:,1),l*P(:,1),'k','x`',0.5);
  else
   plavec(-l/2*P(:,3),l*P(:,3),'k','z`',0.5);
   plavec(-l/2*P(:,2),l*P(:,2),'k','y`',0.5);
   plavec(-l/2*P(:,1),l*P(:,1),'k','x`',0.5);
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
 x2=x2+X0(1);
 y2=y2+X0(2);
 z2=z2+X0(3);
 plavec(-l/2*P(:,3)+X0,l*P(:,3),'k','z``',0.5);
 plavec(-l/2*P(:,2)+X0,l*P(:,2),'k','y``',0.5);
 plavec(-l/2*P(:,1)+X0,l*P(:,1),'k','x``',0.5);
end
surfl(x,y,z)
hold on
surfl(x2,y2,z2)
axis([0 l 0 l 0 l]);
colormap(mycolor);
axiss;
axis('off');
if nargin == 3
 eixos;
 lineseg([0,0,0],[0,-l/2,0],'k-',0.5);
 lineseg([0,0,0],[-l/2,0,0],'k-',0.5);
 lineseg([0,0,0],[0,0,-l/2],'k-',0.5);
end
%shading faceted;
axis([-l l -l l -l l]);
view([135,20]);

 
