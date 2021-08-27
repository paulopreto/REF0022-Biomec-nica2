function [az,el]=rota(m,ang) 
%ROTA Makes a rotation of 180 degrees around the axis z
%     in 10 steps.
%ROTA(ang) Makes a rotation of and degrees around the axis z
%     in one step.
%ROTA(m,ang) Makes a rotation of ang degrees around the axis z
%     in m steps.
%
%       written by Reginaldo J. Santos on 25 November 2001
%                     DMat-ICEx-UFMG

[az,el]=view;
if (nargin==1)
  ang=m;
  m=1;
elseif(nargin==0)
  ang=180;
  m=10;
end
if (m~=1)
 %p=2*exp(log(10*ang/(m*180))/10);
  p=2*((10*ang)/(180*m))^(1/10);
  pause(p);
  for i=1:m
   az=az + ang/m;
   view([az,el]);
   pause(p);
  end
 else
  az=az+ang;
 view([az,el]);
end
%[az,el]=view;
%disp(['[az,el]= ' '[' num2str(az) ','  num2str(el) ']']); 

