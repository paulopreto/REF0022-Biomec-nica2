function x=no(v)
%no(v) calculates the 2-norm of v (i.e, sqrt(v1^2+...+vn^2))
%     calcula a norma de v (i.e, sqrt(v1^2+...+vn^2))
%
%       written by Reginaldo J. Santos on 31 January 1998 
%                  DMat/ICEx/UFMG
v=v(:);
cl=class(v);
%if cl(1)=='s'
  v=sym(v);
  x=(sum(v.*v))^(1/2);
  x=simplify(x);
%else
%   x=norm(v);
%end