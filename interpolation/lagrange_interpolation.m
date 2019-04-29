function y = lagrange_interpolation(x,px,py)
  %LAGRANGE_INTERPOLATION(x,px,py)
  %x,y               are row matrices of same length which represent the 
  %                  datapoints to interpolate
  if length(px) != length(py) 
    error("vectors must have same dimentions");
  endif
  n = length(px);
  L = ones(n);
  for i = 1:n
    for j = 1:n
      if i != j
        L(i) *= (x - px(j))/(px(i) - px(j));
      endif
    endfor
  endfor
  y = 0;
  for i = 1:n
    y += py(i)*L(i);
  endfor
endfunction