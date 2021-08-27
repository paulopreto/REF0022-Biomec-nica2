function M=minor(A,i,j)
%M=minor(A,i,j) computes de minor (i,j) of the matrix A
%
%       written by Reginaldo J. Santos on 23 November 1997 
%                  DMat/ICEx/UFMG

[m,n]=size(A);
M=A([1:i-1 i+1:m],[1:j-1 j+1:n]);