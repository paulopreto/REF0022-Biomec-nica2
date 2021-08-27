function  [pivo,ip,jp]=detpivo(i,A)
%[pivo,ip,jp]=DETPIVO(i,A) determines the pivot below 
%                                  the row i-1 of the matrix A
%
%       written by Reginaldo J. Santos on 25 April 1999 
%                  DMat/ICEx/UFMG
A=sym(A);
[m,n]=size(A);
pivo=0; ip=i;jp=i;
% search a element # 0
  for jp=i:n,
    for ip=i:m,
      if (A(ip,jp)~=0)
        break;
      end
    end
    if (A(ip,jp)~=0)
      break;
    end
  end
  % search a element = 1
  for k=ip:m,
    if (A(k,jp)==1)
      if (A(ip,jp)~=-1)
        ip=k; end
      break;
    end
  end
  if (ip~=k)
    % search a element = -1
    for k=ip:m
      if (A(k,jp)==-1)
        ip=k;
        break;
      end
    end
 %   if (A(k,jp)==-1)
 %     ip=k;
 %   end
  end
  if (A(ip,jp)~=0)
    pivo=A(ip,jp);
  end
 
