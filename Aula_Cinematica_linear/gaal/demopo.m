%DEMOPO Demonstration of the functions poinplan, poinline
%
%       Written by Reginaldo J. Santos on 30 March 1996 - DMAT/UFMG

echo on
clf
n2=[1 -1 1];
p1=[1 0 2]';
p2=[0 0 0];
p2n=poplan(p1,p2,n2);
line1((p1+p2n)/2,(p2n-p1)/2,'r:');
box;
axiss;
rota(10,180);
pause(1);
clf
p1=[2 1 2];
p2=[1 0 1];
p3=[0 1 1];
poline(p1,p2,p2-p3);
box;
rota(10,180);
echo off
