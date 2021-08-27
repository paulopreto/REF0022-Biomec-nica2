function showsys(Au,ns)
%SHOWSYS([A1 b1 ... An bn],n) shows graphycally n systems Aix=bi
%         mostra graficamente n sistemas lineares Aix=bi
%         um em cada janela use alt-tab para alternar entre janelas
%       written by Reginaldo J. Santos on 13 April 1996 - DMAT/UFMG

clf reset;
[m n]=size(Au);
n0=n/ns;
if (m>3)|(n0>4)
  %error('This function is for smaller matrices!!!')
  error('Esta função é para matrizes pequenas!!!')
return
end
if (n0==4)
  for k=1:ns
    figure(k);
    A0=Au(:,1+n0*(k-1):n0*k);
    showsys1(A0)
  end
elseif (n0==3)
  for k=1:ns
    subplot(ns,1,k);
    A0=Au(:,1+n0*(k-1):n0*k);
    showsys1(A0);
  end
end

    

