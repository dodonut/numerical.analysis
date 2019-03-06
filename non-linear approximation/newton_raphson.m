function [x] = newton_raphson(Func, Dev, a, tol, itermax)
  %NEWTON_RAPHSON(Func, a, b, relative_error, itermax)
  %Func               non-linear function
  %Dev                Derivative of the Func
  %a                  Guess point
  %tol                Error tolerance which make the algorithm to stop
  %itermax            Max number of iterations
  if Dev(a) == 0
    a = a + 1;
  endif
  for k = 1:itermax
    x = a - Func(a)/Dev(a);
    if abs(Func(x)) < tol
      printf("Found solution with %d iterations.\n",k);
      return;
    endif
    a = x;
  endfor
  error("Could not find solution within %d iterations\n");
endfunction
