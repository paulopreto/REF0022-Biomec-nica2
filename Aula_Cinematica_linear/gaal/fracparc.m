function F=fracparc(F,fr)
%F=fracparc(F,fr) decomponhe F(x) em fracoes parciais dadas no vetor
%                 fr=[fr_1,...,fr_k]

%   written by Reginaldo J. Santos DMAT/ICEx/UFMG on 11 April 2004

syms x;
[f,g]=numden(F);
           
coeff=sym2poly(f);
coefg=sym2poly(g);
if size(coeff,2)>=size(coefg,2)
    error('Grau do numerador tem que ser menor do que o do denominador');
end
if coefg(1)~=1
    f=f/coefg(1);
    g=g/coefg(1);
end
S=solve(g);
n=size(S,1);
k=1;
while k<=size(S,1)
    SS(k,1)=S(k);
    ind=find(S(k+1:size(S,1))==S(k));
    if size(ind,1)~=0
      S(ind+k)=[];
    end
    SS(k,2)=size(ind,1)+1;
    k=k+1;
end
k=1;
while k<=size(S,1)
    SS(k,1)=S(k);
    ind=find(S(k+1:size(S,1))==conj(S(k)));
    if size(ind,1)~=0
      S(ind+k)=[];
      SS(ind+k,:)=[];
    end
    k=k+1;
end
ii=1;
F=0;
n=size(S,1);
if double(sum(SS(:,2)))<size(fr,2)
   error('As fraçoes dadas estao erradas!');
end
for k=1:n
    if imag(S(k))==0
        m=double(SS(k,2));
        gi=simplify(g/(x-S(k))^m);
        a(ii,m)=subs(f,x,S(k))/subs(gi,x,S(k));
        flag=0;for jj=1:size(fr,2), if fr(jj)==1/(x-S(k))^m, flag=1; end, end
        if flag==0
                error('As fraçoes dadas estao erradas!');
        end
        F=F+a(ii,m)/(x-S(k))^m;
        if m>1
          for kk=1:m-1
            fi=diff(f,kk);
            a(ii,m-kk)=subs(fi,x,S(k));
            for kkk=0:kk-1
              gi=diff(simplify(g/(x-S(k))^(m-kkk)),kk);
              a(ii,m-kk)=a(ii,m-kk)-a(ii,m-kkk)*subs(gi,x,S(k));
            end
            a(ii,m-kk)=a(ii,m-kk)/(factorial(kk)*subs(simplify(g/(x-S(k))^m),x,S(k)));
            flag=0;for jj=1:size(fr,2), if fr(jj)==1/(x-S(k))^(m-kk), flag=1; end, end
            if flag==0
                error('As fraçoes dadas estao erradas!');
            end
            F=F+a(ii,m-kk)/(x-S(k))^(m-kk);
          end
        end    
        ii=ii+1;
    end
end
ii=1;
k=1;
if(sum(abs(imag(S)))~=0)
  while k<=n
    if imag(S(k))~=0
      m=double(SS(k,2));
      if m==1
        gi=simplify( g/( (x-S(k))*( x-conj(S(k)) ) ) );
        b(ii)=-imag(subs(f,x,S(k))*conj(S(k))/subs(gi,x,S(k)))/imag(S(k));
        c(ii)=imag(subs(f,x,S(k))/subs(gi,x,S(k)))/imag(S(k));
        flag=0;for jj=1:size(fr,2), if fr(jj)==1/simplify((x-S(k))*( x-conj(S(k)))), flag=1; end, end
        if flag==0
                error('As fraçoes dadas estao erradas!');
        end
        F=F+(b(ii)+c(ii)*x)/simplify((x-S(k))*( x-conj(S(k))));
        ii=ii+1;
        k=k+1;
      else
        error('Nao implementei o caso de raizes complexas multiplas!');
      end
    else
        k=k+1;
    end
  end
end