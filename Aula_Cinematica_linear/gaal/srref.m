function  A=srref(A)
%A=srref(A) calculates step by step the reduced row echelon
%           form of the matrix A
%
%       written by Reginaldo J. Santos on 23 November 1997 
%                  DMat/ICEx/UFMG

[m,n]=size(A);
A=sym(A);
el=1;
pivo=1;
A
while (el<=m)&(pivo~=0)
  [pivo,ip,jp]=detpivo(el,A);
  if (pivo~=0)
    disp(['elimination ' num2str(el) ':']);
    if (ip~=el)
      disp(['row ' num2str(ip) ...
            ' <==> row ' num2str(el)]);
      A([ip el],jp:n) = A([el ip],jp:n);
      A
      %pause
      ch=   input('Continue ? (y/n) ','s');
      if (ch=='n')
        break;
      end
    end
    if (pivo~=1)
      alpha=1/pivo; 
      disp([char(alpha) '*row ' ...
            num2str(el) ' ==> row ' num2str(el)]);
      A(el,jp:n) = A(el,jp:n)/pivo;
      A
     % A=ro(1/pivo,el,A)
     %      pause      
      ch=   input('Continue ? (y/n) ','s');
      if ch=='n'
        break;
      end
    end
    ind=[1:el-1 el+1:m];
    for k=ind
      if (A(k,jp)~=0)
      disp([char(-A(k,jp)) '*row ' num2str(el) ...
         ' + row ' num2str(k) ' ==> row ' num2str(k)]);
         A(k,jp:n) = A(k,jp:n) - A(k,jp)*A(el,jp:n);
%        A=ro(-A(k,jp),el,k,A);
      end
    end
    A
%    pause
      ch=   input('Continue ? (y/n) ','s');
      if ch=='n'
        break;
      end
    el=el+1;
  end
end
disp('The End');

