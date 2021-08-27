function x=pe(v,w)
%pe(v,w) calculates the inner (dot) product between v and w
%       calcula o produto escalar entre v e w.
%
%       written by Reginaldo J. Santos on 23 November 1997 
%                  DMat/ICEx/UFMG

[mv,nv]=size(v);
[mw,nw]=size(w);
if (mv==mw)&(nv==nw)
    x=sum(v.*w);
else
    error('v e w têm que ter o mesmo tamanho!');
end

