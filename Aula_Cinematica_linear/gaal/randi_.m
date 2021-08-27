function A=randi_(m,n,k,p)
%A=randi(n) is a nxn matrix with random integer entries, chosen 
%           from a uniform distribution on the interval [-5,5].
%           matriz nxn com elementos inteiros aleatórios entre -5 e 5.
%
%A=randi(m,n) is a mxn matrix with random integer entries, chosen 
%           from a uniform distribution on the interval [-5,5].
%           matriz mxn com elementos inteiros aleatórios entre -5 e 5.
%
%A=randi(m,n,k) is a mxn matrix with random integer entries, chosen 
%           from a uniform distribution on the interval [-k,k].
%           matriz mxn com elementos inteiros aleatórios entre -k e k.
%
%A=randi(m,n,k,p) is a rank p mxn matrix with random integer entries, chosen 
%           from a uniform distribution on the interval [-k,k].
%           matriz mxn de posto p com elementos inteiros aleatórios entre -k e k.
%
%       written by Reginaldo J. Santos on 28 November 1999 
%                  DMat/ICEx/UFMG

%rand('state',sum(100*clock));
if nargin==1
  A=floor(-5+11*rand(m,m));
elseif nargin==2
   A=floor(-5+11*rand(m,n));
elseif nargin==3
   A=floor(-k+2*k*rand(m,n));
elseif nargin==0
   A=floor(-5+10*rand(1,1));
elseif nargin==4
   if m<=n
      teste=0;
      while teste==0
         A=randi(p,n,k);
         t=fix((m-p)/p);
         for l=1:t
            A=[A;diag(2*round(rand(1,p))-1)*A(1:p,:)];
         end
         A=[A;diag(2*round(rand(1,m-p-t*p))-1)*A(1:(m-p-t*p),:)];
         if rank(A)==p 
            teste=1; 
         end
      end
   else
      A=randi(n,m,k,p)';
   end
end

   
  
