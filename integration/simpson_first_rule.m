function y = simpson_first_rule(a,b,func,n)
  %simpson_first_rule(a, b, func, n)
  %a,b               the interval to integrate
  %func              the original function
  %n                 number of intervals
  h = (b-a)/(2*n);
  x = [4 2];
  y = 0;
  for i = 1:(2*n)-1
    y += x(mod(i+1,2)+1)*func(i*h + a);
  end
  y = (y + func(a) + func(b)) * h/3;
end
