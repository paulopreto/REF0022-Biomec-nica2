function texto(p,string,arg3,arg4,arg5)
%texto(p,string) places the text string in the point p
%              The text must be given between ' 
%
%       Written by Reginaldo J. Santos on 9 April 1996 - DMAT/UFMG


n=length(p);
if nargin<3
    if (n==3)
    text(p(1),p(2),p(3),string);
    elseif (n==2)
    text(p(1),p(2),string);
    end
elseif nargin==3
    if (n==3)
    text(p(1),p(2),p(3),string,arg3);
    elseif (n==2)
    text(p(1),p(2),string,arg3);
    end
elseif nargin==4
    if (n==3)
    text(p(1),p(2),p(3),string,arg3,arg4);
    elseif (n==2)
    text(p(1),p(2),string,arg3,arg4);
    end
elseif nargin==5
    if (n==3)
    text(p(1),p(2),p(3),string,arg3,arg4,arg5);
    elseif (n==2)
    text(p(1),p(2),string,arg3,arg4,arg5);
    end
end

  

