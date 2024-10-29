function [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)
	% G -> iteration matrix
	% c -> iteration vector
	% x0 -> initial solution
	% tol -> accepted tolerance (norm of the difference between two solutions)
	% max_steps -> the maximum number of iterations
	
	% x -> final solution
	% err -> last calculated difference (as an euclidean norm)
	% steps -> actual number of steps performed

  prev_x = x0;
  steps = 0;
  err = Inf;

  while (err >= tol) && (steps < max_steps) 
    x = G * prev_x + c;
    err = norm(x - prev_x);
    steps = steps + 1;
    prev_x = x;
  endwhile

  x = prev_x;

endfunction
