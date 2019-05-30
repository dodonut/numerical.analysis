function y = optimization(x,f,gr,tol,iter)  n = length(x);  k = 1;  z0 = 0;  a = zeros(4,1);  g = zeros(4,1);  while k <= iter      g(2) = f(x);               % value of f on points of x0    z  = gr(x);                 % gradient vector    z0 = sum(abs(x).^2).^1/2;    % norm    if z0 == 0      printf("Gradiente zero.\n");      x      g(2)      return;    endif    z = z./z0;      % z unit vector    a(2) = 0;    a(4) = 1;    g(4) = f(x - a(4)*z);    while g(4) >= g(2)        a(4) = a(4)/2;        g(4) = f(x-a(4)*z);                if a(4) < tol/2            printf("Sem grandes mudanças\n");            x            g(2)            return;        endif    endwhile        a(3) = a(4) / 2;    g(3) = f(x - a(3) * z);    h1 = (g(3) - g(2)) / a(3);    h2 = (g(4) - g(3)) / (a(4) - a(3));    h3 = (h2 - h1) / a(4);        a(1) = 0.5 * (a(3) - h1/h3);    g(1) = f(x - a(1)*z);        pos = 1;    least_a = least_g = 0;    for j = 2:4        if f(x - a(j)*z) < f(x - a(pos)*z)            pos = j;            least_a = a(j);            least_g = f(x - a(pos)*z);        endif    endfor    x = x - least_a * z;    if abs(least_g - g(2)) < tol      printf("Sucesso! Completo em %d iterações\n",k);      x      least_g      return;    endif    k = k + 1;  endwhile  error("Não foi possível encontrar o valor otímo.");endfunction