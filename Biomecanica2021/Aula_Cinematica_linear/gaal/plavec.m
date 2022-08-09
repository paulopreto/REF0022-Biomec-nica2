function plavec(p,v,color,name,thick)
%plavec(v) places the vector v in the origin 
%plavec(p,v) places the vector v in point p
%plavec(v,color) places the vector v in the origin 
%plavec(p,v,color) places the vector v in point p
%                  with color color.
%plavec(p,v,color,'name') places the vector v in point p
%                 with and color color and write name. 
%          The color can be one of
%         'y'     yellow      'm'     magenta       
% 	       'c'     cyan        'r'     red         
% 	       'g'     green       'b'     blue          
% 	       'w'     white       'k'     black   
%
%       written by Reginaldo J. Santos on 25 November 2001 
%                  DMat/ICEx/UFMG

p=p(:);p=double(p);
if nargin==1
 v=p;
 if length(v)==3
  p=[0,0,0];
 elseif length(v)==2
  p=[0,0];
 end
 color='k';
end
if (nargin==2)
  if (isstr(v))
    color=v;
    v=p;
    p=[0,0,0];
  else
    color='k';
  end
end
v=v(:);v=double(v);
m=length(p);
n=length(v);
if (m==3)&(n==3)
  h=1/10;
  l=h/4;
%  l=h/6;
  vv=(1-h)*v;
  nvxy2=v(1)^2+v(2)^2;
  nvxy=sqrt(nvxy2);
  nv=norm(v);
  if (nvxy>0)
    vp1=nv*[-v(2) v(1) 0]/nvxy;
    vp2=[-v(3)*v(1) -v(3)*v(2) nvxy2]/nvxy;
  else
    vp1=[nv 0 0];
    vp2=[0 nv 0];
  end
  H=plot3([p(1) p(1)+v(1)],[p(2) p(2)+v(2)],[p(3) p(3)+v(3)],color);
  if (nargin<5)
    set(H,'Linewidth',2.5); 
  else
    set(H,'Linewidth',thick);
  end
  hold on
  % place the arrow
%  H=plot3([p(1)+vv(1)+l*vp1(1) p(1)+v(1) p(1)+vv(1)-l*vp1(1)],...
%      [p(2)+vv(2)+l*vp1(2) p(2)+v(2) p(2)+vv(2)-l*vp1(2)],...
%      [p(3)+vv(3)+l*vp1(3) p(3)+v(3) p(3)+vv(3)-l*vp1(3)],...
%      color); 
%  if (nargin<5)
%    set(H,'Linewidth',2); 
%  else
%    set(H,'Linewidth',thick);
%  end
%  hold on
%  H=plot3([p(1)+vv(1)+l*vp2(1) p(1)+v(1) p(1)+vv(1)-l*vp2(1)],...
%      [p(2)+vv(2)+l*vp2(2) p(2)+v(2) p(2)+vv(2)-l*vp2(2)],...
%      [p(3)+vv(3)+l*vp2(3) p(3)+v(3) p(3)+vv(3)-l*vp2(3)],...
%      color); 
%  if (nargin<5)
%    set(H,'Linewidth',2); 
%  else
%    set(H,'Linewidth',thick);
%  end
  fill([p(1)+vv(1)+l*vp1(1) p(1)+v(1) p(1)+vv(1)+l*vp2(1)],...
       [p(2)+vv(2)+l*vp1(2) p(2)+v(2) p(2)+vv(2)+l*vp2(2)],...
       [p(3)+vv(3)+l*vp1(3) p(3)+v(3) p(3)+vv(3)+l*vp2(3)],...
       color);
  fill([p(1)+vv(1)+l*vp1(1) p(1)+v(1) p(1)+vv(1)-l*vp2(1)],...
       [p(2)+vv(2)+l*vp1(2) p(2)+v(2) p(2)+vv(2)-l*vp2(2)],...
       [p(3)+vv(3)+l*vp1(3) p(3)+v(3) p(3)+vv(3)-l*vp2(3)],...
       color);
  fill([p(1)+v(1) p(1)+vv(1)-l*vp1(1) p(1)+vv(1)+l*vp2(1)],...
       [p(2)+v(2) p(2)+vv(2)-l*vp1(2) p(2)+vv(2)+l*vp2(2)],...
       [p(3)+v(3) p(3)+vv(3)-l*vp1(3) p(3)+vv(3)+l*vp2(3)],...
       color);
  fill([p(1)+v(1) p(1)+vv(1)-l*vp1(1) p(1)+vv(1)-l*vp2(1)],...
       [p(2)+v(2) p(2)+vv(2)-l*vp1(2) p(2)+vv(2)-l*vp2(2)],...
       [p(3)+v(3) p(3)+vv(3)-l*vp1(3) p(3)+vv(3)-l*vp2(3)],...
       color); 
  % place the text
  if (nargin>3)
    if(nvxy==0)
      %text(p(1)+(1+h)*v(1)+h*vp1(1),p(2)+(1+h)*v(2)+h*vp2(2),...
        %p(3)+(1+h)*v(3),name);
      H=text(p(1)+(1+h)*v(1),p(2)+(1+h)*v(2),...
        p(3)+(1+h)*v(3),name);
    else
      H=text(p(1)+(1+h)*v(1)+h*vp2(1),p(2)+(1+h)*v(2)+h*vp2(2),...
        p(3)+(1+h)*v(3)-l*vp2(3),name);%troquei +l por -l
    end
    %set(H,'Fontsize',14);
  end
  elseif(n==2)&(m==2)
  h=1/10;
  l=h/4;
  vv=(1-h)*v;
  vp=[v(2) -v(1)];
  H=plot([p(1) p(1)+v(1)],[p(2) p(2)+v(2)],color);
  if (nargin<5)
    set(H,'Linewidth',2.5); 
  else
    set(H,'Linewidth',thick);
  end
  hold on
  % place the arrow
  fill([p(1)+vv(1)+l*vp(1) p(1)+v(1) p(1)+vv(1)-l*vp(1)],...
      [p(2)+vv(2)+l*vp(2) p(2)+v(2) p(2)+vv(2)-l*vp(2)],color); 
  H=plot([p(1)+vv(1)+l*vp(1) p(1)+v(1) p(1)+vv(1)-l*vp(1) p(1)+vv(1)+l*vp(1)],...
      [p(2)+vv(2)+l*vp(2) p(2)+v(2) p(2)+vv(2)-l*vp(2) p(2)+vv(2)+l*vp(2)],color); 
  if (nargin<5)
    set(H,'Linewidth',2.5); 
  else
    set(H,'Linewidth',thick);
  end
  % place the text
  if (nargin>3)
    if (v(2) > 0)
      text(p(1)+(1+h)*v(1)+l*vp(1),p(2)+(1+h)*v(2)+l*vp(2),name);
    else 
      text(p(1)+(1+h)*v(1)-l*vp(1),p(2)+(1+h)*v(2)-l*vp(2),name);
    end
  end
else
  error('The vector must have dimension 2 or 3!')  
end
hold on 

