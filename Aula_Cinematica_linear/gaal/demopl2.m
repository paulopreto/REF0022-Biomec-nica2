%DEMOPL2 Demontration of the function plan2
%
%       Written by Reginaldo J. Santos on 30 March 1996 - DMAT/UFMG

echo on
clf
n5=[1 -2 1];
p1=[0 0 1];
O=[0 0 0];
plan2(O,n5,p1,n5);
box;
rota(10,180);
pause(1);
clf
plan2(O,n5,O,[1 1 0]);
box;
rota(10,180);
echo off
