function d=detopel(A)
% d=detopel(A)  calculates the determinant of A by reducing A to up triangular
%             calcula det. de A reduzindo A a forma triangular superior  
%
%       written by Reginaldo J. Santos on 27 May 1999
%                     DMat-ICEx-UFMG
d=1;
[m,n] = size(A);
if (m~=n) 
 error('Matriz tem que ser quadrada!');
end

% Does it appear that elements of A are ratios of small integers?
[num, den] = rat(A);
rats = all(all(A==num./den));


% Loop over the entire matrix.
i = 1;
j = 1;
while (i <= m) & (j <= n)
   % Find value and index of largest element in the remainder of column j.
   [p,k] = max(abs(A(i:m,j))); k = k+i-1;
      % Swap i-th and k-th rows.
      if (k~=i) d=-d; end,
      A([i k],j:n) = A([k i],j:n);
      % Divide the pivot row by the pivot element.
      d=d*A(i,j);
      for l=j:n
       A(i,l) = A(i,l)/A(i,j);
      end
      % Subtract multiples of the pivot row from all the other rows.
      for k = i+1:m
       for l = j:n
        A(k,l) = A(k,l) - A(k,j)*A(i,l);
       end
      end
      i = i + 1;
      j = j + 1;
end


% Return "rational" numbers if appropriate.
if rats
    [num,den] = rat(d);
    d=num./den;
end
