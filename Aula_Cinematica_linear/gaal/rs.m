function A=rs(i,j,A)
%A=rs(i,j,A) interchanges rows i and j of the matrix A
%
%       written by Reginaldo J. Santos on 8 November 1997
%                     DMat-ICEx-UFMG

%disp(' ');
disp(['row ' num2str(i) ' <==> row ' num2str(j)]);
A([i j],:)=A([j i],:);
