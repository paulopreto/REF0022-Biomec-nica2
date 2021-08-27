function ilvxw(v,w)
%ilvxw(V,W)   Illustrates the vector product V x W for 3-dimensional vectors.
%             Ilustra o produto vetorial V x W 
%       written by Reginaldo J. Santos on 6 November 1998
%                      DMat-ICEx-UFMG

clf
% Ensure that both are vectors of length three
v=v(:);     w=w(:);
m=length(v);
n=length(w);
x=pv(v,w);
if (m==3) & (n==3)
  O=[0 0 0]';
else
  error('Both v and w must be 3-dimensional vectors')  
end
plavec(O,v,'g','V');
plavec(O,w,'y','W');
plavec(O,x,'r','V x W');
axissqua;
title('Ilustra o produto vetorial V x W');
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
