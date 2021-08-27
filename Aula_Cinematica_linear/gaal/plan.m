function plan(p1,n1,p2,n2,p3,n3,m,cor1,cor2,cor3)
%P=plan(N1,d1,N2,d2,N3,d3) displays three planes, which have
%   normal vectors N1, N2 and N3 equations ni1*x + ni2*y + ni3*z + di = 0.
%   desenha planos com normais N1, N2 e N3, equações ni1*x + ni2*y + ni3*z + di = 0.
%
%P=plan(P1,N1,P2,N2,P3,N3) displays three planes, which contains
%   the points P1, P2 and P3 have normal vectors N1, N2 and N3 respectively.
%   pn is a point in the intersection or "near"
%   desenha planos que passam por P1, P2 e P3 com normais N1, N2 e N3.
%
%P=plan(N1,d1,N2,d2) displays two planes, which have normal vectors n1, n2 and n3  
%   equations ni1*x + ni2*y + ni3*z + di = 0.
%   desenha planos com normais N1 e N2 e equações ni1*x + ni2*y + ni3*z + di = 0.
%
%P=plan(P1,N1,P2,N2) displays two planes, which contains the points P1 and P2 
%   have normal vectors N1 and N2  respectively.
%   If N1 and N2 are not paralel P is a point in the intersection.
%   If N1 and N2 are paralel P is the point of the second plane, which is nearest from p1.
%   desenha planos que passam por P1 e P2 com normais N1 e N2
%
%plan(N,d) displays a plane, that has normal vector n, equation n1*x + n2*y + n3*z + d = 0.
%          desenha o plano com normal N e equação n1*x + n2*y + n3*z + d = 0.
%
%plan(P,N) displays a plane, that has normal vector N, contains the point P.
%          desenha o plano que passa por P com normal N.
%
%       written by Reginaldo J. Santos on 5 December 1998
%                      DMat-ICEx-UFMG
if nargin==6
   plan3(p1,n1,p2,n2,p3,n3);
elseif nargin==4
   plan2(p1,n1,p2,n2);
elseif nargin==2
   plan1(p1,n1);
  end
colormap('hsv');
