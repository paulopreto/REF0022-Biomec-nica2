function axiss() 
%axiss makes the current axis box square
%         axis('auto') return to automatic axis box
%
%       written by Reginaldo J. Santos on 20 November 1997
%                      DMat-ICEx-UFMG

axis('square');
a = axis;
ml=length(a);
if a(2)<=0 a(2)=0.5*(a(2)-a(1));
end;
if a(4)<=0 a(4)=0.5*(a(4)-a(3));
end;
if ml==6
  if a(6)<=0 a(6)=0.5*(a(6)-a(5));
  end;
end
axis(a);
if ml==6
  [len,ind] = max([a(2)-a(1) a(4)-a(3) a(6)-a(5)]);
  if (ind==1)
   a3=(a(3)+a(4)-len)/2;
   a4=(a(3)+a(4)+len)/2;
   a5=(a(5)+a(6)-len)/2;
   a6=(a(5)+a(6)+len)/2;
   axis([a(1) a(2) a3 a4 a5 a6]);
  elseif (ind==2)
   a1=(a(1)+a(2)-len)/2;
   a2=(a(1)+a(2)+len)/2;
   a5=(a(5)+a(6)-len)/2;
   a6=(a(5)+a(6)+len)/2;
   axis([a1 a2 a(3) a(4) a5 a6]);
  else
   a1=(a(1)+a(2)-len)/2;
   a2=(a(1)+a(2)+len)/2;
   a3=(a(3)+a(4)-len)/2;
   a4=(a(3)+a(4)+len)/2;
   axis([a1 a2 a3 a4 a(5) a(6)]);
  end
else
  [len,ind] = max([a(2)-a(1) a(4)-a(3)]);
  if (ind==1)
   a3=(a(3)+a(4)-len)/2;
   a4=(a(3)+a(4)+len)/2;
   axis([a(1) a(2) a3 a4]);
  else
   a1=(a(1)+a(2)-len)/2;
   a2=(a(1)+a(2)+len)/2;
   axis([a1 a2 a(3) a(4)]);
  end
end

