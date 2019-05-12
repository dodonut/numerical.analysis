function min_squares(x,y)
  %MIN_SQUARES(a, b, func, n)
  %x,y               points
  n = length(x);
  xs = xy = u = d = ys = zeros(n,1)';
  for i = 1:n
    xs(i) = x(i)^2;
    xy(i) = x(i)*y(i);
    ys(i) = y(i)^2;
  endfor
  A = [ n sum(x);
        sum(x) sum(xs);];
  b = [ sum(y); 
        sum(xy);];
  X = flip(inv(A) * b)
  mean_y = mean(y);
  for i=1:n
    u(i) = X(1)*x(i) + X(2);
    d(i) = (y(i) - u(i))^2;
  endfor
  D = sum(d)
  R_sqr = 1 - D/(sum(ys) - sum(y)^2/n)
  var_res = D / (n-2)
end
