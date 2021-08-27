function boxx()
%BOX Makes a box around the picture
%
%       Written by Reginaldo J. Santos on 11 April 1996 - DMAT/UFMG


a=axis;
%if (length(a)==6)
  plot3([a(1) a(2)],[a(4) a(4)],[a(6) a(6)],'k');
  plot3([a(1) a(2)],[a(3) a(3)],[a(6) a(6)],'k');
  plot3([a(1) a(1)],[a(3) a(4)],[a(6) a(6)],'k');
  plot3([a(2) a(2)],[a(3) a(4)],[a(6) a(6)],'k');
  plot3([a(1) a(1)],[a(3) a(3)],[a(5) a(6)],'k');
  plot3([a(2) a(2)],[a(4) a(4)],[a(5) a(6)],'k');
  plot3([a(2) a(2)],[a(3) a(3)],[a(5) a(6)],'k');
  plot3([a(1) a(2)],[a(4) a(4)],[a(5) a(5)],'k');
  plot3([a(2) a(2)],[a(3) a(4)],[a(5) a(5)],'k');
  
  plot3([a(1) a(1)],[a(3) a(4)],[a(5) a(5)],'k');
  plot3([a(1) a(2)],[a(3) a(3)],[a(5) a(5)],'k');
  plot3([a(1) a(1)],[a(4) a(4)],[a(5) a(6)],'k');
%else
%  plot([a(1) a(2)],[a(3) a(3)],'w');
%  plot([a(1) a(2)],[a(4) a(4)],'w');
%  plot([a(1) a(1)],[a(3) a(4)],'w');
%  plot([a(2) a(2)],[a(3) a(4)],'w');
%end

