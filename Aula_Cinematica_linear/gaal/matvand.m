function A=matvand(P,k)
%matvand([x1;x2;...;xm],k)  obtem a matriz 
%
%   [x1^k x1^(k-1) ... x1 1]
%   [x2^k x2^(k-1) ... x2 1]    
%       ...............
%   [x6^k x6^(k-1) ... xm 1]
%matvand([x1,y1;...;xm,ym],1)  obtem a matriz 
%
%   [x1 y1 1]
%   [x2 y2 1]    
%    .......
%   [xm ym 1]
%matvand([x1,y1;...;xm,ym],2)  obtem a matriz 
%
%   [x1^2 x1*y1 y1^2 x1 y1 1]
%   [x2^2 x2*y2 y2^2 x2 y2 1]    
%        ................
%   [xm^2 xm*ym ym^2 xm ym 1]
%matvand([x1,y1,z1;...;xm,ym,zm],1)  obtem a matriz 
%
%   [x1 y1 z1 1]
%   [x2 y2 z2 1]    
%    .........
%   [xm ym zm 1]
%matvand([x1,y1,z1;...;xm,ym,zm],2)  obtem a matriz 
%
%   [x1^2 y1^2 z1^2 x1*y1 x1*z1 y1*z1 x1 y1 1]
%   [x2^2 y2^2 z2^2 x2*y2 x2*z2 y2*z2 x2 y2 1]    
%        ................
%   [xm^2 ym^2 zm^2 xm*ym xm*zm ym*zm xm ym 1]
%
%       written by Reginaldo J. Santos DMat/ICEx/UFMG on 23 November 1998
%
[m,n]=size(P);
cl=class(P);
if n==1
   A=ones(m,k+1);
   if (cl(1)=='s') 
      A=sym(A); 
   end
   for j=1:k
      A(:,j)=P.^(k-j+1);
   end
elseif n==2
   if k==2
      A=ones(m,6);
      if (cl(1)=='s') 
         A=sym(A); 
      end
      A(:,1)=P(:,1).^2;
      A(:,3)=P(:,2).^2;
      A(:,2)=P(:,1).*P(:,2);
      A(:,4)=P(:,1);
      A(:,5)=P(:,2);
   elseif k==1
      A=ones(m,3);
      if (cl(1)=='s') 
         A=sym(A); 
      end
      A(:,1)=P(:,1);
      A(:,2)=P(:,2);
   end
elseif n==3
   if k==1
      A=ones(m,4);
      if (cl(1)=='s') 
         A=sym(A); 
      end
      A(:,1)=P(:,1);
      A(:,2)=P(:,2);
      A(:,3)=P(:,3);
   elseif k==2
      A=ones(m,10);
      if (cl(1)=='s') 
         A=sym(A); 
      end
      A(:,1)=P(:,1).^2;
      A(:,2)=P(:,2).^2;
      A(:,3)=P(:,3).^2;
      A(:,4)=P(:,1).*P(:,2);
      A(:,5)=P(:,1).*P(:,3);
      A(:,6)=P(:,2).*P(:,2);
      A(:,7)=P(:,1);
      A(:,8)=P(:,2);
      A(:,9)=P(:,3);
   end
end      
         
