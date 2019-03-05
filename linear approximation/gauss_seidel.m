% Gauss-seidel method

function [x] = gauss_seidel(A,b,abs_error, itermax)
  %GAUSS_SEIDEL (A,b,abs_error,itermax)
  %A            Coeficients matrix
  %b            Column vector of constants
  %abs_error    Precision which make the algorithm to stop
  %itermax      Max number of iterations
  
  x = zeros(size(b)); %instantiate the results and also make a guess
  x0 = x;
  n = size(A,1);      
  for k = 1:itermax
    for i = 1:n       % run throught each row
      x(i) = (b(i) - A(i,[1:i-1,i+1:n])*x([1:i-1,i+1:n]))/A(i,i); %isolate the x(i)
    endfor
    if norm(x-x0,'inf')<abs_error   %calculates the norm of the vector
      printf("Results converge at %d iteration\n",k);
      return
    end
    x0 = x;
  end
  error("Max iter number reached.");
end
