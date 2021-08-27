%DEMOG21 demonstrates the graphical functions of vectors
%        demonstra as funções gráficas para vetores
%       written by Reginaldo J. Santos on 23 November 1997
%                      DMat-ICEx-UFMG

figure(1)
echo on
v=[1 2 3];
w=[2 3 -1];
u=[1 2 -1];
ilsvw(v,w);
pause(1);
ilav(2,v);
pause(1);
ilvijk(v);
pause(1);
ilvxw(v,u);
pause(1);
ilproj(v,w);
echo off
