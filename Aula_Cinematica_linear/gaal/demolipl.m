%DEMOLIPL Demonstration of the function lineplan
%
%       Written by Reginaldo J. Santos on 30 March 1996 - DMAT/UFMG

echo on
clf
v1=[2 1 2];
v2=[1 2 3];
p1=[1 -1 0];
p2=[-2 1 2];
n1=vecprod(v1,v2);
lineplan(p1,v1,p2,n1/norm(n1));
zoom3(0.2);
box;
rota(10,180);
n3=[1 -1 2];
p3=[0 0 0.5];
p4=[1 2 1];
pause(1);
clf
lineplan(-p4,p3+p4,p3,n3);
box;
rota(10,180);
echo off
