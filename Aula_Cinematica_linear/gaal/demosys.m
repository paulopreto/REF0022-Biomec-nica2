%DEMOSYS
%
%       written by Reginaldo J. Santos on 16 April 1996 - DMAT/UFMG

echo on
A=[1 -2 1;3 2 11]
B=rref(A)
showsys([A B],2)
disp('Um sistema de 2 equações e 2 incógnitas');
disp('Antes e Depois de escalonar');
disp('Pressione qualquer tecla para continuar ...');
pause
clf
A(3,:)=[4 0 12]
B=rref(A)
showsys([A B],2)
disp('Um sistema de 3 equações e 2 incógnitas');
disp('Antes e Depois de escalonar');
disp('Pressione qualquer tecla para continuar ...');
pause
clf
A=[1 1 1 1;1 1 -2 3;2 1 1 2]
B=rref(A)
showsys([A B],2)
disp('Press any key to continue ...');
pause
figure(1)
clf
figure(2)
clf
A(3,:)=[2 2 -1 4]
B=rref(A)
showsys([A B],2)
echo off
