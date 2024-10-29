function [decoded_path] = decode_path (path, lines, cols)
	% path -> vector containing the order of the states that arrived
	% 		 to a winning position
	% lines -> numeber of lines
	% cols -> number of columns
	
	% decoded_path -> vector of pairs (line_index, column_index)
  %                 corresponding to path states
  % hint: decoded_path does not contain indices for the WIN state
  
  for i = 1 : size(path, 1) - 1
    for j = 1 : size(path, 2)
      state = path(i, j);
      
      row = mod(state, cols);
      if(row == 0)
        row = cols;                           % calculez indicii de linie si de coloana pt fiecare stare
      endif
    
      col = (state - row) / cols + 1;		
    
    
      decoded_path(i, 1) = col;
      decoded_path(i, 2) = row;
    
    endfor
  endfor

endfunction