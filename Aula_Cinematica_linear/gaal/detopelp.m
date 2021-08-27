function d=detopelp(A)
% d=detopelp(A)  calculates the determinant of A by reducing A to up triangular
%             step by step.
%          calcula det. de A reduzindo A a forma triangular superior 
%          passo a passo. 
%
%       written by Reginaldo J. Santos on 27 May 1999
%                     DMat-ICEx-UFMG

d=1;
[m,n]=size(A);
A=sym(A);

if(m==n)

el=1;
pivo=1;
A
mens='det(A)';
while (el<=m-1)&(pivo~=0)
  [pivo,ip,jp]=detpivo(el,A);
  if (pivo~=0)
    disp(['eliminação ' num2str(el) ':']);
    if (ip~=el)
      d=-d;
      A=ro(A,ip,el)
      mens=['(-1)*' mens]; 
      disp(['det(A) = ' mens]);
%      pause
      ch=   input('Continua ? (s/n) ','s');
      if (ch=='n')
        d=[];break;
      end
    end
    if (pivo~=1)
      alpha=1/pivo; d=d/alpha;
      A=ro(1/pivo,el,A)
      mens=['(' char(pivo) ')*' mens];
        disp(['det(A) = ' mens]);
%      pause
      ch=   input('Continua ? (s/n) ','s');
      if ch=='n'
        d=[];break;
      end
    end
    ind=[el+1:m];
    for k=ind
      if (A(k,jp)~=0)
        A=ro(-A(k,jp),el,k,A);
      end
    end
    A
%    pause
      ch=   input('Continua ? (s/n) ','s');
      if ch=='n'
        d=[];break;
      end
    el=el+1;
  else
  d=0;
  end
end
d=d*A(n,n);
disp('Fim!');
disp(['det(A) = ' mens]);
end