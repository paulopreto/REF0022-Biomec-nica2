function paraleg(p1,p2,p3,color,m)
%PARALEG(p1,p2,p3,color) displays a paralelogram 
%                        defined by the points p1,p2 and p3 with color color.
%                        p2 and p3 are neighbouring of p1.
%          The color can be one of
%          'y'     yellow       
% 	       'r'     red         
% 	       'g'     green         
% 	       'b'     blue          
%
%       Written by Reginaldo J. Santos on 30 April 2004
%                    DMat-ICEx-UFMG

if length(p1)==3
	if (nargin<5)
      m=8;
	end
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
	end
	if (nargin>4)
      s=0:1/m:1;
      t=s;
      for i=1:m+1
        for j=1:m+1
          x(i,j)=(1-s(i)-t(j))*p1(1)+s(i)*p2(1)+t(j)*p3(1);
          y(i,j)=(1-s(i)-t(j))*p1(2)+s(i)*p2(2)+t(j)*p3(2);
          z(i,j)=(1-s(i)-t(j))*p1(3)+s(i)*p2(3)+t(j)*p3(3);
        end
      end
	else
      p4=p3+p2-p1;
      x(1,1)=p1(1);
      x(1,2)=p2(1);
      x(2,1)=p3(1);
      x(2,2)=p4(1);
      y(1,1)=p1(2);
      y(1,2)=p2(2);
      y(2,1)=p3(2);
      y(2,2)=p4(2);
      z(1,1)=p1(3);
      z(1,2)=p2(3);
      z(2,1)=p3(3);
      z(2,2)=p4(3);
	end
	surf(x,y,z,cor*ones(size(z)));
	caxis([0 1]);
	%shading flat;
	hold on
elseif length(p1)==2
    hold on
	lineseg(p1,p2,color,0.5);
	lineseg(p1,p3,color,0.5);
	lineseg(p3,p3+p2-p1,color,0.5);
	lineseg(p2,p2+p3-p1,color,0.5);
else
    error('Os pontos so podem ter 2 ou 3 coordenadas!');
end
