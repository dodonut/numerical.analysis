function [p] = muller(f,p0,p1,p2,tol,max_iter)
  %MULLER(f, p0, p1,,p2, tol, max_iter)
  %f                  function to find the root
  %p0,p1,p2           initial points 
  %tol                Error tolerance which make the algorithm to stop
  %max_iter            Max number of iterations
  for i = 1:max_iter
    h1 = p1-p0;
    h2 = p2-p1;
    c = f(p2);
    s1 = (f(p1)-f(p0))/h1;
    s2 = (c-f(p1))/h2;
    a = (s2 - s1)/(h2+h1);
    
    
    b = s2 + h2*a;
    D = (b^2-4*a*c)^.5;
    %get the largest value for E so that p is the closest possible to 0
    %since they are inversely proportional
    if abs(b-D) < abs(b+D)  
      E = b+D;
    else 
      E = b-D;
    end
    
    h = -2*c/E;
    p = p2 + h;
    
    if abs(h) < tol
      printf("Found solution with %d iterations.\n",i);
      return
    end
    
    p0 = p1;
    p1 = p2;
    p2 = p;
  end
  error("Could not find solution within %d iterations\n", max_iter);
endfunction
