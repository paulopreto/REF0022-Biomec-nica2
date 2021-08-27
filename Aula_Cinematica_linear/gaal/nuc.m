function X=nuc(A)
%nuc(A) Determina uma base para o núcleo da matriz A
%
%       written by Reginaldo J. Santos on 11 maio 1999 
%                  DMat/ICEx/UFMG

A=sym(A);
X=null(A);
