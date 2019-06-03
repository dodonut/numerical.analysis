function r = romberg(a,b,f,n)  h = b-a;  r = zeros(2,n);  r(1,1) = h*(f(a)+f(b))/2;  for i = 2:n        % Trapeze Rule    y = 0;    for k = 1:2^(i-2)      y += f(a + (k-.5)*h);    end    r(2,1) = (y * h + r(1,1))/2;    %-----        for j = 2:i      r(2,j) = r(2,j-1) + (r(2,j-1) - r(1,j-1)) / (4 ^ (j-1) - 1);    end        h = h/2;    r(1,:) = r(2,:);  end
endfunction
