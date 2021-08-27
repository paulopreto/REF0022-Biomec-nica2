function proj=projfcos(f,nl,a,b)
%proj=projfcos(f,n,a,b) calcula n projeções de f(t) em [a,b]
%nos subespaços  W_n=[1,cos(pi*(t-a)/(b-a)),cos(2*pi*(t-a)/(b-a)),...,
%cos((n-1)*pi*(t-a)/(b-a))]
%em relação ao produto interno <f,g>=int(f*g,a,b)
%proj=projfcos(f,n) corresponde a proj=projcos(f,n,0,1)
%
%proj=projfcos(f,g,a,b) calcula as somas de 
%g(k)*c(k)*cos(k*pi*(t-a)/(b-a)) k=0:n-1 em [a,b]
%c_k=<f,cos(k*pi*(t-a)/(b-a))>/||cos(k*pi*(t-a)/(b-a))||^2
%
%written by Reginaldo J. Santos - DMat-ICEx-UFMG - 24 May 2001

syms t
if length(nl)==1
   g=ones(nl);
else
   g=nl;
   nl=length(g);
end
if nargin < 4
    a=0;b=1;
end
cn=g(1)*int(f,a,b)/(b-a);
proj(1)=cn;
for n=2:nl
   pn=cos((n-1)*pi*(t-a)/(b-a));
   cn=simplify(g(n)*int(f*pn,a,b)*2/(b-a));
   proj(n)=proj(n-1)+cn*pn;
end
proj=proj(:);
