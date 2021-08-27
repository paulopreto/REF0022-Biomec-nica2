function eixos2(nomex,nomey,nomez,flag)
%eixos2(nomex,nomey)   desenha os eixos x e y e coloca nos eixos os nomes
%nomex e nomey
%eixos2(nomex,nomey,nomez)   desenha os eixos x, y e z e coloca nos eixos os nomes
%nomex nomey e nomez
%
%       written by Reginaldo J. Santos on 11 April 2004
%                    DMat/ICEx/UFMG

%axis('off');
%axissqua;
%axis normal
%nomex=nomes(1);
%nomey=nomes(2);
%if max(size(nomes))==3
%    nomez=nomes(3);
%end
hold on;
a=axis;
m=length(a);
if m==6
   if nargin==4
      lineseg([a(1) 0 0],[a(2) 0 0],'k',0.5);
      lineseg([0 a(3) 0],[0 a(4) 0],'k',0.5);
      lineseg([0 0 a(5)],[0 0 a(6)],'k',0.5);
      tex([0.95*a(2) 0 0.05*a(6)],nomex);
      tex([0 0.95*a(4) 0.05*a(6)],nomey);
      tex([0 0.05*a(4) a(6)],nomez);
   else
      axiss;
      plavec([a(1) 0 0],[a(2)-a(1) 0 0],'k',nomex,0.5);
      plavec([0 a(3) 0],[0 a(4)-a(3) 0],'k',nomey,0.5);
      plavec([0 0 a(5)],[0 0 a(6)-a(5)],'k',nomez,0.5);
  end
else
  axis square;
  if a(1)>=0
     a(1)=(a(1)-a(2))/5;
     axis(a);
  end
  color='k';
%  hx=basex/15;
%  hy=basey/15; 
  plot([a(1) a(2)],[0 0],color);
  a=axis;
  basex=a(2)-a(1);
  basey=a(4)-a(3);
  hold on
  p=[a(1) 0];
  v=[a(2)-a(1) 0];
  hx=basex/30;
  hy=basey/30; 
  vv=v-[hx 0];
%  vp=[0 basey/60];
  vp=[0 hy/4];
% place the arrow
  fill([p(1)+vv(1) p(1)+v(1) p(1)+vv(1)-vp(1)],...
      [vp(2) 0 -vp(2)],color); 
  % place the text
  H=text(a(2)-0.2*hx,-hy,nomex,...
'VerticalAlignment','Middle','HorizontalAlignment','Right');
  if nargin==2
     set(H,'Fontsize',14);
  end
  a2=a(2);
%
  a=axis;
  if a(3)>=0
     a(3)=(a(3)-a(4))/5;
     axis(a);
  end
  basex=a(2)-a(1);
  basey=a(4)-a(3);
%  hy=basey/15; 
  hx=basex/30;
  hy=basey/30; 
  p=[0 a(3)];
  v=[0 a(4)-a(3)];
  color='k';
%  if nargin < 3 namey='y'; end
  vv=v-[0 hy];
%  vp=[basex/60 0];
  vp=[hx/4 0];
  plot([0 0],[a(3) a(4)],color);
  %hold on
  % place the arrow
  fill([vp(1) 0 -vp(1)],...
      [p(2)+vv(2)+vp(2) p(2)+v(2) p(2)+vv(2)-vp(2)],color); 
   % place the text
  H=text(0.5*hx,a(4)-hy,nomey);
  %axis tight; 
  if nargin==2
     set(H,'Fontsize',14);
  end
  % redraw the axis x
  a=axis;
  %p=[a(1) 0];
  %v=[a(2)-a(1) 0];
  color='k';
  plot([a(1) a2],[0 0],color);
end

