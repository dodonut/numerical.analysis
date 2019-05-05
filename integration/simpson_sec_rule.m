function y = simpson_sec_rule(a,b,func,n)
  %simpson_first_rule(a, b, func, n)
  %a,b               the interval to integrate
  %func              the original function
  %n                 number of intervals
  k = [3 3 2];
  h = (b-a)/(3*n);
  y = 0;
  for i = 1:(3*n)-1
    y += k(mod(i+2, 3)+1) * func(i*h + a);
  end
  
  y = (y + func(a) + func(b)) *3*h/8;
end
