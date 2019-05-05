function y = trapezes(a, b, func, n)
  %trapezes(a, b, func, n)
  %a,b               the interval to integrate
  %func              the original function
  %n                 number of trapezes
  h = (b - a)/n;
  y = 0;
  for i = 1:n-1
    y += func(i*h + a);
  end
  y = (func(a) + y*2 + func(b)) * h/2;
end
