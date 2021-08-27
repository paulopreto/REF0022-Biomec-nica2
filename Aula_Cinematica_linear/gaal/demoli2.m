%DEMOLI2 Demonstration of the function line2
%
%       Written by Reginaldo J. Santos on 30 March 1996 - DMAT/UFMG

echo on
clf
v1=[2 1 2];
v2=[1 2 3];
p1=[1 -1 0];
p2=[-2 1 2];
line2(p1,v1,p2,v2);
box;
rota(10,180);
pause(1);
p3=[0 0 0.5];
p4=[1 2 1];
clf
line2(-p4,p3+p4,p3,v1);
box;
rota(10,180);
echo off
