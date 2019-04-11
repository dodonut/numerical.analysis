function [x,y] = secant(Func, a,b, tol, itermax)
  %SECANT(Func, a, b, relative_error, itermax)
  %Func               function to find the root
  %a,b                interval with f(a) and f(b) with oposite sings
  %tol                Error tolerance which make the algorithm to stop
  %itermax            Max number of iterations
  for k = 1:itermax
    fa = Func(a);
    fb = Func(b);
    x = (b*fa - a*fb)/(fa-fb);
    if abs(Func(x)) < tol
      printf("Found solution with %d iterations.\n",k);
      return;
    endif
    b = a;
    a = x;
  endfor
  error("Could not find solution within %d iterations\n");
endfunction
