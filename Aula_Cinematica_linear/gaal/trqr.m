function [R,QtB]=trqr(A,B)
%trqr(A,B)
%
%
%
for j=1:n
 [v,beta]=house(A(:,j),j);
 R(1