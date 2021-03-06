function y = optimization(x,f,gr,tol,iter)

  n = length(x);
  k = 1;
  z0 = 0;
  while k <= iter  
    g1 = f(x);                 % value of f on points of x0
    z = gr(x);                 % gradient
    z0 = norm(z);              % norm
    if z0 == 0
      printf("Gradiente zero.\n");
      x
      g1
      return;
    endif
    z = z./z0;      % z unit vector
    a1 = 0;
    a3 = 1;
    g3 = f(x - a3*z);
    while g3 >= g1
        a3 = a3/2;
        g3 = f(x-a3*z);
        
        if a3 < tol/2
            printf("Sem grandes mudanças\n");
            x 
            g1
            return;
        endif
    endwhile
    
    a2 = a3 / 2;
    g2 = f(x - a2 * z);
    h1 = (g2 - g1) / a2;
    h2 = (g3 - g2) / (a3 - a2);
    h3 = (h2 - h1) / a3;
    
    a0 = 0.5 * (a2 - h1/h3);
    g0 = f(x - a0*z);
  
    if g0 <= g3
      a = a3;
    else 
      a = a3;
    end
    g = f(x - a * z);
    x = x - a * z;
    if abs(g - g1) <= tol
      printf("Sucesso! Completo em %d iterações\n",k);
      x
      g
      return;
    endif
    k = k + 1;
  endwhile
  error("Não foi possível encontrar o valor otímo.");

endfunction
