function lagrange_interpolation(px, fx)
  %LAGRANGE_INTERPOLATION(x,px,py)
  %x                 the point which you want to interpolate
  %px,py             are row matrices of same length which represent the 
  %                  datapoints to interpolate
  x = px; %form a interval between the points 
  n = length(x);
  L = ones(n,1)';
  yL = zeros(n,1)';

  for i = 1:n
    x0 = x(i);
    for j = 1:n
      if i != j
        L(i) *= (x0 - px(j))/(px(i) - px(j));
      endif
    endfor
  endfor
  
  for i = 1:n
    yL(i) = fx(x(i))*L(i);
  endfor
  
  yO = fx(x);             %original function
  plot(x,yL, 'bo;Interplado;', x, yO, 'gr;Original;');
  title ("Comparativo da funcao original e interpolada");
  
endfunction