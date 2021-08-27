function ilproj(w,v,a,b)
%ilproj(W,V)   Illustrates the orthogonal projection of V on W of 2 or 3-dimensional vectors.
%              Ilustra a projeção de V em W para vetores com 2 ou 3 componentes
%ilproj(g,f,a,b) Illustrates the orthogonal projection of f on g of functions
%          with respect to inner product <f,g>=int(f*g,a,b)
%          ilustra a projeção da função f na função g para funções
%          com relação ao produto interno <f,g>=int(f*g,a,b)
%             
%       written by Reginaldo J. Santos on 18 April 2004
%                      DMat-ICEx-UFMG

clf

if nargin == 2
% Ensure that both are vectors of length two or three
 v=v(:);     w=w(:);
 m=length(v);
 n=length(w);
 x=proj(w,v);x=x(:);x=double(x);
 if (m==2) & (n==2)
  O=[0 0];
  Os=[0.01*v(2) -0.01*v(1)];
 elseif (m==3) & (n==3)
  O=[0 0 0]';
  wxy=[w(1) w(2) 0];
  nwxy=norm(wxy);
  if (nwxy~=0)
    Os=0.01*[w(3)*w(2) w(3)*w(1) -(nwxy^2)]/nwxy;
  end
 else
  error('Os vetores devem ter 2 ou 3 componentes!')  
 end
 plavec(O,v,'g','V');
 plavec(O,w,'y','W');
 plavec(Os,x,'r','proj_W V');
 lineseg(v,x,'b:');
 axissqua;
 title('Ilustra a projeção de V em W');
 if (m==2)
  axisc;
  zoom3(-0.2);
 else
  grid off;
  axiss;
  axisc;
  box;
  rota(10,180);
  grid on;
 end
else
   f=v;
   g=w;
   h=proj(g,f,a,b);
   h1=plotf1(f,[a,b],'g');
   hold on;
   h2=plotf1(g,[a,b],'y');
   h3=plotf1(h,[a,b],'r');
   h4=plotf1(f-h,[a,b]);
   legend([h1,h2,h3,h4],'f','g','proj(g,f)','f-proj(g,f)');
   eixos;
end


