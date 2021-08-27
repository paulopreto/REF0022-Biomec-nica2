function showimag(X,C)  
%showimag(X) mostra as imagens X(:,k)
%showimag(X,[Cmin,Cmax]) mostra as imagens X(:,k) com preto sendo Cmin
% e o branco Cmax
%
%written by Reginaldo J. Santos - DMat-ICEx-UFMG - 8 June 2001
%
%Exemplo:
%load tomo
%showimag(x)
%
clf
[mm,nn]=size(X);
m=sqrt(mm);
nl=ceil(nn/3);
nc=3;
if nargin == 1
   caxis([0,1]);
else
   caxis(C);
end
colormap('gray');
if nn < nc
   for j=1:nn
     subplot(1,nn,j);
     image(reshape(X(:,j),m,m),'CDataMapping','scaled');
     axis('image');
     axis('off');
   end
else
 for i=1:nl
   for j=1:nc
      n=(i-1)*nc+j;
      subplot(nl,nc,n);
      image(reshape(X(:,n),m,m),'CDataMapping','scaled');
      axis('image');
      axis('off');
      if n == nn
         break;
      end
   end
 end
end


