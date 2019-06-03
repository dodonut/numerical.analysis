function C = cubic_splines(n, x, y)
  %INTERPOLATION(x,y)
  %n                 number of points
  %x,y               are row matrices of same length which represent the 
  %                  datapoints to interpolate
  h = alpha = zeros(1,n);
  a = b = c = d = zeros(1,n);
  for i = 1:n-1
    h(i) = x(i+1) - x(i); 
  endfor
  for i = 2:n-1
    alpha(i) = 3*(a(i+1)-a(i))/h(i) - 3* (a(i) - a(i-1))/h(i+1);
  endfor
  l = m = z = zeros(1,n);
  l(1) = 1;
  m(1) = z(1) = 0;
  
  for i = 2:n-1
    l(i) = 2*(x(i+1) - x(i-1)) - h(i-1)*m(i-1);
    m(i) = h(i)/l(i);
    z(i) = (alpha(i) - h(i-1)*z(i-1))/l(i);
  endfor
  
  l(n) = 1;
  c(n) = z(n) = 0;
  
  for j = n-1:-1:1
    c(j) = z(j) - m(j)*c(j+1);
    b(j) = (a(j+1) - a(j))/h(j) - h(j)*(c(j+1) + 2*c(j))/3;
    d(j) = (c(j+1) - c(j))/3*h(j);
  endfor
  
  breaks = x
  C = zeros(n-1,n-1);
  for j = 1:n-1
    C(j,:) = C(j,:) + [a(j) b(j) c(j) d(j)];
  endfor
end
