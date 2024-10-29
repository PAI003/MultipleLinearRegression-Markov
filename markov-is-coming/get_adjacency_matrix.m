function [Adj] = get_adjacency_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings

  % Adj -> the adjacency matrix associated to the given labyrinth
  
  [m, n] = size(Labyrinth);
  Adj = sparse(m * n + 2, m * n + 2);

  for i = 2 : m - 1
    for j = 2 : n - 1
      bit_position = 1;
      bit_set = bitand(Labyrinth(i, j), bit_position);
      
      if(bit_set == 0)
        Adj((i - 1) * n + j, (i - 1) * n  + j - 1) = 1;
      endif
      
      bit_position = 2;
      bit_set = bitand(Labyrinth(i, j), bit_position);
      
      if(bit_set == 0)
        Adj((i - 1) * n + j, (i -1) * n + j + 1) = 1;
      endif
      
      bit_position = 4;
      bit_set = bitand(Labyrinth(i, j), bit_position);
      
      if(bit_set == 0)
        Adj((i - 1) * n  + j, i * n + j) = 1;
      endif
      
      bit_position = 8;
      bit_set = bitand(Labyrinth(i,j), bit_position);
      
      if(bit_set == 0)
        Adj((i - 1) * n  + j, (i - 2) * n + j) = 1;
      endif
    endfor
  endfor

  for j = 1 : n
    bit_position = 1;
    bit_set = bitand(Labyrinth(1, j), bit_position);
    
    if(bit_set == 0 && j > 1)
      Adj(j, j - 1) = 1;
    endif
    
    bit_position = 2;
    bit_set = bitand(Labyrinth(1, j), bit_position);
    
    if(bit_set == 0 && j < n)
      Adj(j, j + 1) = 1;
    endif
    
    bit_position = 4;
    bit_set = bitand(Labyrinth(1,j), bit_position);
    
    if(bit_set == 0)
      Adj(j, n + j) = 1;
    endif
    
    bit_position = 8;
    bit_set = bitand(Labyrinth(1,j), bit_position);
    
    if(bit_set == 0)
      Adj(j, n * m + 1) = 1;
    endif
  endfor

  for j = 1 : n
    bit_position = 1;
    bit_set = bitand(Labyrinth(m, j), bit_position);
    
    if(bit_set == 0 && j > 1)
      Adj((m - 1) * n + j, (m - 1) * n  + j - 1) = 1;
    endif
    
    bit_position = 2;
    bit_set = bitand(Labyrinth(m, j), bit_position);
    
    if(bit_set == 0 && j < n)
      Adj((m - 1) * n + j, (m - 1) * n + j + 1) = 1;
    endif
    
    bit_position = 4;
    bit_set = bitand(Labyrinth(m, j), bit_position);
    
    if(bit_set == 0)
      Adj((m - 1) * n + j, n * m + 1) = 1;
    endif
    
    bit_position = 8;
    bit_set = bitand(Labyrinth(m, j), bit_position);
    
    if(bit_set == 0)
      Adj((m - 1) * n + j, (m - 2) * n + j) = 1;
    endif
  endfor

  j = 1;
  
  for i = 1 : m
    bit_position = 1;
    bit_set = bitand(Labyrinth(i, j), bit_position);
    
    if(bit_set == 0)
      Adj((i - 1) * n + j, n * m + 2) = 1;
    endif
    
    bit_position = 2;
    bit_set = bitand(Labyrinth(i, j), bit_position);
    
    if(bit_set == 0)
      Adj((i - 1) * n + j, (i -1) * n + j + 1) = 1;
    endif
    
    bit_position = 4;
    bit_set = bitand(Labyrinth(i, j), bit_position);
    
    if(bit_set == 0 && i < m)
      Adj((i - 1) * n  + j, i * n + j) = 1;
    endif
    
    bit_position = 8;
    bit_set = bitand(Labyrinth(i,j), bit_position);
    
    if(bit_set == 0 && i > 1)
      Adj((i - 1) * n  + j, (i - 2) * n + j) = 1;
    endif
  endfor

  j = n;
  
  for i = 1 : m
    bit_position = 1;
    bit_set = bitand(Labyrinth(i, j), bit_position);
    
    if(bit_set == 0)
      Adj((i - 1) * n + j, (i -1) * n + j - 1) = 1;
    endif
    
    bit_position = 2;
    bit_set = bitand(Labyrinth(i, j), bit_position);
    
    if(bit_set == 0)
      Adj((i - 1) * n + j, n * m + 2) = 1;
    endif
    
    bit_position = 4;
    bit_set = bitand(Labyrinth(i, j), bit_position);
    
    if(bit_set == 0 && i < m)
      Adj((i - 1) * n  + j, i * n + j) = 1;
    endif
    
    bit_position = 8;
    bit_set = bitand(Labyrinth(i,j), bit_position);
    
    if(bit_set == 0 && i > 1)
      Adj((i - 1) * n  + j, (i - 2) * n + j) = 1;
    endif
  endfor

  Adj(m * n + 1, m * n + 1) = 1;
  Adj(m * n + 2, m * n + 2) = 1;

endfunction