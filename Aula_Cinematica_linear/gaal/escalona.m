function A=escalona(A)
%U=escalona(A) calcula passo a passo a forma reduzida escalonada
%              da matriz A.
%
%       written by Reginaldo J. Santos on 7 July 1999 
%                  DMat/ICEx/UFMG
[m,n]=size(A);
A=sym(A);
el=1;
pivo=1;
disp(A)
while (el<=m)&(pivo~=0)
  [pivo,ip,jp]=detpivo(el,A);
  if (pivo~=0)
    disp(['eliminação ' num2str(el) ':']);
    if (ip~=el)
      disp(['linha ' num2str(ip) ...
            ' <==> linha ' num2str(el)]);
      A([ip el],jp:n) = A([el ip],jp:n);
      disp(A)
      %pause
      ch=   input('Continua ? (s/n) ','s');
      if (ch=='n')
        break;
      end
    end
    if (pivo~=1)
      alpha=1/pivo; 
      disp(['(' char(alpha) ')*linha ' ...
            num2str(el) ' ==> linha ' num2str(el)]);
          A(el,jp:n) = A(el,jp:n)/pivo;
          A=simplify(A);
      disp(A)
     % A=ro(1/pivo,el,A)
     %      pause      
      ch=   input('Continua ? (s/n) ','s');
      if ch=='n'
        break;
      end
    end
    ind=[1:el-1 el+1:m];
    for k=ind
      if (A(k,jp)~=0)
      disp(['(' char(-A(k,jp)) ')*linha ' num2str(el) ...
         ' + linha ' num2str(k) ' ==> linha ' num2str(k)]);
       A(k,jp:n) = A(k,jp:n) - A(k,jp)*A(el,jp:n);
       A=simplify(A);
%        A=ro(-A(k,jp),el,k,A);
      end
    end
    disp(A)
%    pause
      ch=   input('Continua ? (s/n) ','s');
      if ch=='n'
        break;
      end
    el=el+1;
  end
end
disp('Fim');


