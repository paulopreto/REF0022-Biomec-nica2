function [H,beta]=house(y)
%H=house(y,k) calcula a matriz de Householder H=I-v^tv/beta,
%           onde v=[y(1)+sign(y(1))||y(1:n)||,y(2:n)] e
%                beta=||v||^2/2
%[v,beta]=house(y) calcula o vetor v e beta da transformação de
%                    Householder H
%        written by Reginaldo J. Santos on 1 December 1999 
%                   DMat/ICEx/UFMG
%
%
y=y(:);
n=length(y);
v(1)=simplify(y(1)+sign(numeric(y(1)))*no(y(1:n)));
v(2:n)=y(2:n); 
v=v(:);
beta=simplify(v'*v/2);
%
if nargout<2
 H=eye(n)-v*v'/beta;
elseif nargout==2
 H=v;
end

 