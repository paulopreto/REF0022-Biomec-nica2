function ilvijk(v)
%ilvijk(v) Shows the vector v=(v1,v2,v3) as v1 i + v2 j + v3 k
%          Mostra o vetor v=(v1,v2,v3) como v1 i + v2 j + v3 k
%       written by Reginaldo J. Santos on 22 November 1997
%                     DMat/ICEx/UFMG

clf
grid off;
O=[0 0 0];
plavec(O,v,'r','v');
plavec(O,[1 0 0],'y','i');
plavec(O,[0 1 0],'y','j');
plavec(O,[0 0 1],'y','k');
vxy=[v(1) v(2) 0];
plavec(O,vxy,'b:','');
lineseg(v,vxy,'b:');
lineseg(v,[0 0 v(3)],'b:');
lineseg(vxy,[v(1) 0 0],'b:');
lineseg(vxy,[0 v(2) 0],'b:');
axiss;
axisc;
title('Ilustra V=(v1,v2,v3)=v1*i+v2*j+v3*k');
box;
rota(10,180);
grid on;

