function [G, c] = get_Jacobi_parameters (Link)
	% Link -> the link matrix (edge with probabilities matrix)
	
  % G -> iteration matrix
	% c -> iteration vector
	
  [m, n] = size(Link);
  G = sparse(m - 2,n - 2);

  for i = 1 : m - 2
    for j = 1 : n - 2
      G(i, j) = Link(i, j);
     endfor
  endfor

  c = sparse(m - 2, 1);

  for i = 1 : m - 2
    c(i, 1) = Link(i, m -1);
  endfor

endfunction
