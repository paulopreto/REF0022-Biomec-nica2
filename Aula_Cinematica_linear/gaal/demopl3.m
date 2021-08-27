%DEMOPL3 Demontration of the function plan3
%
%       Written by Reginaldo J. Santos on 29 March 1996 - DMAT/UFMG

echo on
clf
axissqua;
n1=[2 1 1];
n2=[1 3 1];
n3=[1 1 4];
n5=[1 -2 1];
n4=[3 2 -1];
n6=[2 -5 2];
O=[0 0 0];
p1=[0 0 1];
plan3(O,n1,O,n2,O,n3);
%zoom3(0.1);
box;
rota(10,180);
pause(1);
clf
axissqua;
plan3(O,n4,O,n6,O,n4-n6);
%zoom3(0.1);
box;
rota(10,180);
pause(1);
clf
plan3(-8*p1,n4,-1.5*p1,n6,p1,n4-n6);
%zoom3(0.1);
box;
rota(10,180);
pause(1);
clf
plan3(O,n5,p1,2*n5,O,[1 1 0]);
%zoom3(0.1);
box;
rota(10,180);
pause(1);
clf
plan3(O,n5,p1,2*n5,3*p1,3*n5);
%zoom3(0.1);
box;
rota(10,180);
echo off
