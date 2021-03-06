function [x] = false_position(Func, a, b, tol, itermax)
  %FALSE_POSITION(Func, a, b, relative_error, itermax)
  %Func               function to find the root
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
    x = (a*fb-b*fa)/(fb-fa);
    fx = Func(x);
    if abs(fx) < tol
      printf("Found solution with %d iterations.\n",k);
      return;
    endif
    if fx < 0
      a = x;
    else 
      b = x;
    endif;
  endfor
  error("Could not find solution within %d iterations\n");
endfunction
