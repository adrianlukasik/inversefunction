function [invfun, y, info] = invgraph(fun, a, b, N);
  x = linspace(a, b, N);
  y = getFunValues(fun, x);
  info = 0;
  
  if (feval(fun, a) == feval(fun, b))
    warning("fun(a) == fun(b)");
    info = 1;
    return;
  endif
  
  invfun = zeros(length(y), 1);
  for i = 1 : length(y)
    [S, FS, exitflag] = fzero(@(s)Fz(s, y(i), fun), [a, b]);
    if (exitflag != 1)
      warning("fzero() error");
      info = 2;
      return;
    endif
    invfun(i) = S;
  endfor
endfunction

function Z = Fz(S, z, fun);
  Z = feval(fun, S) - z; 
endfunction

function f = getFunValues(fun, x);
  f = zeros(length(x), 1);
  for i = 1 : length(x)
    f(i) = feval(fun, x(i));
  endfor
endfunction
