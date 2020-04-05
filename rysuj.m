function rysuj(fun, a, b, N);
  [invfun, y, info] = invgraph(fun, a, b, N);
  x = linspace(a, b, N);
  plot(x, y, ";fun;");
  hold on
  plot(y, invfun, ";invfun;");
  hold off
  pause(2);
endfunction