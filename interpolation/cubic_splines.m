function cubic_splines(x,y)
  %INTERPOLATION(x,y)
  %x,y               are row matrices of same length which represent the 
  %                  datapoints to interpolate
  n = length(x);
  delta = h = zeros(n-1, 1)';
  for i = 1:n-1
    h(i) = x(i+1) - x(i);
    delta(i) = (y(i+1)-y(i))/h(i);
  end
  M = zeros(n-2,n); %just ignore the first and last column
  b = zeros(n-2,1);
  c = 1;
  for i = 1:n-2
    M(i,c) = h(c);
    M(i,c+1) = 2*(h(c) + h(c+1));
    M(i,c+2) = h(c+1);
    c += 1;
    b(i) = 6*(delta(i+1)-delta(i));
  end
  MM = zeros(n-2,n-2);
  for i = 1:n-2
    MM(i,:) = MM(i,:) .+ [M(i,2:n-1)]; % ignoring the first row and column so to calculate the inverse
  end
  sds = inv(MM) * b;
  sds = [0 sds(:)' 0];                 % natural cubic spline has the first and last second derivative equal to 0;
  cs = zeros(n-1, 4);
  a = b = c = d = zeros(n-2, 1)';
  for i=1:n-1
    a(i) = (sds(i+1) - sds(i))/(6*h(i));
    b(i) = sds(i)/2;
    c(i) = delta(i) - h(i) * (sds(i+1) + 2*sds(i))/6;
    %printf("%d => delta=%d, h=%d, sds %d %d\n",i,delta(i),h(i), sds(i+1), 2*sds(i));
    d(i) = y(i);
  end
  breaks = x(1:n)
  for i=1:n-1
    cs(i,:) = cs(i,:) .+ [a(i) b(i) c(i) d(i)];
  end
  coefficients = cs
end
