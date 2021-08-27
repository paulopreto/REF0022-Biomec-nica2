function lin(p1,v1,p2,v2)
%lin(P,V) displays a straight line 
%     that contains the point p and has the direction v
%     desenha a reta que passa por P com direção V
%
%lin(P1,V1,P2,V2) displays two straight lines,
%     which contain the points P1 and P2 respectively and
%     have directions V1 and V2 respectively.
%     desenha retas que passam por P1 e P2 com direções V1 e V2
%
%       written by Reginaldo J. Santos on 11 November 1998 
%                  DMat/ICEx/UFMG
if nargin==4
   line2(p1,v1,p2,v2);
elseif nargin==2
   line1(p1,v1,'g');
end