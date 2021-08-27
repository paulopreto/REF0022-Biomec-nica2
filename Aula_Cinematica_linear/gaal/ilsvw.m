function ilsvw(v,w)
%ilsvw(V,W)   Illustrates the sum V + W of 2 or 3-dimensional vectors.
%             Ilustra a soma V + W de vetores com 2 ou 3 componentes 
%       written by Reginaldo J. Santos on 23 November 1997
%                      DMat-ICEx-UFMG

clf
% Ensure that both are vectors of length two or three
v=v(:);     w=w(:);
m=length(v);
n=length(w);
x=v+w;
if (m==2) & (n==2)
  O=[0 0];
elseif (m==3) & (n==3)
  O=[0 0 0]';
else
  error('Both v and w must be 2 or 3-dimensional vectors')  
end
plavec(O,v,'g','V');
plavec(O,w,'g','W');
plavec(O,x,'y','V+W');
lineseg(v,v+w,'b:');
lineseg(w,v+w,'b:');
axissqua;
title('Ilustra a soma de vetores');
if (m==2)
  axisc;
  zoom3(-0.2);
else
  grid off;
  axiss;
  axisc;
  box;
  rota(10,180);
  grid on;
end

