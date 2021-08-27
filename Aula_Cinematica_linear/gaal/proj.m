function x=proj(w,v,a,b)
%proj(W,V) calculates the orthogonal projection of V on W of R-n
%          calcula a projeção ortogonal do vetor V no vetor W 
%          para vetores do R-n
%             
%proj(g,f,a,b) calculates the orthogonal projection of f on g of functions
%          with respect to inner product <f,g>=int(f*g,a,b)
%          calcula a projeção ortogonal da função f na função g 
%          com relação ao produto interno <f,g>=int(f*g,a,b)
%             
%       written by Reginaldo J. Santos on 15 March 2002 
%                  DMat/ICEx/UFMG

if nargin == 2
 if (size(v)==size(w))
    v=sym(v);
    w=sym(w);
    %v=v(:);
    %w=w(:);
    x=(pe(v,w)/pe(w,w))*w;
    %x=x.';
  else
    error('V e W devem ter o mesmo tamnho!');
  end
else
   v=sym(v);w=sym(w);
   x=(int(v*w,a,b)/int(w^2,a,b))*w;
end

   


