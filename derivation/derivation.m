function y = derivation(x, f, delta)
  %derivation(a, b, func, n)
  %x                 point to derivate
  %f                 the original function
  %delta             precision of derivation
  y = (f(x+delta)-f(x))/delta;
end
