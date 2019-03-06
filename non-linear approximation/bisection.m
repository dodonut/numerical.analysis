function [p] = bisection(Func, a, b, tol, itermax)
  %BISECTION(Func, a, b, relative_error, itermax)
  %Func               non-linear function
  %a,b                interval with f(a) and f(b) with oposite sings
  %tol                Error tolerance which make the algorithm to stop
  %itermax            Max number of iterations
  if a == b
    error('It must be given 2 different points');
  endif
  if Func(a) * Func(b) > 0
    error('Interval do not cross the x-axis');
  endif   
  if Func(a) > Func(b)
    temp = a;
    a = b;
    b = temp;
  endif
  for k = 1:itermax
    fa = Func(a);
    fb = Func(b);
    p = (a+b)/2;
    fp = Func(p);
    if abs(fp) < tol
      printf("Found solution with %d iterations.\n",k);
      return;
    endif
    if fp < 0
      a = p;
    else
      b = p;
    endif
  endfor
  error("Could not find solution within %d iterations\n");
endfunction
