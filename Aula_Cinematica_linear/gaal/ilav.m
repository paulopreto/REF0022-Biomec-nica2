function ilav(a,v)
%ilav(a,V)    Illustrates the  product of the scalar a by the vector v
%             Ilustra o produto do escalar a pelo vetor V
%       written by Reginaldo J. Santos on 23 November 1997
%                     DMat-ICEx-UFMG

clf
v=v(:);
x=a*v;  
m=length(v);
if (m==2) 
  O=[0 0];
  Os=[0.01*v(2) -0.01*v(1)];
elseif (m==3)
  O=[0 0 0];
  vxy=[v(1) v(2) 0];
  nvxy=norm(vxy);
  if (nvxy~=0)
    Os=0.01*[v(3)*v(2) v(3)*v(1) -(nvxy^2)]/nvxy;
  end
else
  error('v must be a 2 or 3-dimensional vector')  
end
plavec(O,v,'g','v');
plavec(Os,x,'y',[num2str(a) ' v']);
axiss;
title('Ilustra a multiplicação de escalar por vetor');
if (m==2)
  axisc;
  zoom3(-0.2);
else
  grid off;
  axisc;
  box;
  rota(10,180);
  grid on;
end

