function plotfproj(f,proj,a,b,c,d)  
%plotfproj(f,prj,a,b) plota f e as funções
%que estão em prj no intervalo [a,b]
%plotfproj(f,prj,a,b,c,d) plota f e as funções
%que estão em prj no intervalo [a,b] com ymin=c e ymax=d
%
%written by Reginaldo J. Santos - DMat-ICEx-UFMG - 20 June 2001
%
%Exemplo:
%syms t, p=[proj(sin(pi*t),t,0,1);proj(sin(2*pi*t),t,0,1);proj(sin(3*pi*t),t,0,1)];
%prj=[p(1);sum(p(1:2));sum(p(1:3))]
%plotfproj(t,prj,0,1)

clf
%axis('image')
syms t
nn=length(proj);
nl=ceil(nn/3);
nc=3;
if nn < nc
   for j=1:nn
     subplot(1,nn,j);
      if nargin == 6
         axis([a b c d]); 
      end
      hold on
      plotf1(f,[a,b],'k');
      plotf1(proj(j),[a,b],'b');
      axisc(1);
   end
else
 for i=1:nl
   for j=1:nc
      n=(i-1)*nc+j;
      subplot(nl,nc,n);
      if nargin == 6
         axis([a b c d]); 
      end
      hold on
      plotf1(f,[a,b],'k');
      plotf1(proj(n),[a,b],'b');
      axisc(1);
      if n == nn
         break;
      end
   end
 end
end


