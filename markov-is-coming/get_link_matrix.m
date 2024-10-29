  function [Link] = get_link_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings

  % Link -> the link matrix associated to the given labyrinth

  [m, n] = size(Labyrinth);
  Link = sparse(m * n + 2, m * n + 2);

  for i = 2 : m - 1
    for j = 2 : n - 1
      bit_position = 1;
      bit_set = bitand(Labyrinth(i, j), bit_position);
      
      if(bit_set == 0)
        Link((i - 1) * n + j, (i - 1) * n  + j - 1) = 1;
      endif
      
      bit_position = 2;
      bit_set = bitand(Labyrinth(i, j), bit_position);
      
      if(bit_set == 0)
        Link((i - 1) * n + j, (i -1) * n + j + 1) = 1;
      endif
      
      bit_position = 4;
      bit_set = bitand(Labyrinth(i, j), bit_position);
      
      if(bit_set == 0)
        Link((i - 1) * n  + j, i * n + j) = 1;
      endif
      
      bit_position = 8;
      bit_set = bitand(Labyrinth(i,j), bit_position);
      
      if(bit_set == 0)
        Link((i - 1) * n  + j, (i - 2) * n + j) = 1;
      endif
    endfor
  endfor

  for j = 1 : n
    bit_position = 1;
    bit_set = bitand(Labyrinth(1, j), bit_position);
    
    if(bit_set == 0 && j > 1)
      Link(j, j - 1) = 1;
    endif
    
    bit_position = 2;
    bit_set = bitand(Labyrinth(1, j), bit_position);
    
    if(bit_set == 0 && j < n)
      Link(j, j + 1) = 1;
    endif
    
    bit_position = 4;
    bit_set = bitand(Labyrinth(1,j), bit_position);
    
    if(bit_set == 0)
      Link(j, n + j) = 1;
    endif
    
    bit_position = 8;
    bit_set = bitand(Labyrinth(1,j), bit_position);
    
    if(bit_set == 0)
      Link(j, n * m + 1) = 1;
    endif
  endfor

  for j = 1 : n
    bit_position = 1;
    bit_set = bitand(Labyrinth(m, j), bit_position);
    
    if(bit_set == 0 && j > 1)
      Link((m - 1) * n + j, (m - 1) * n  + j - 1) = 1;
    endif
    
    bit_position = 2;
    bit_set = bitand(Labyrinth(m, j), bit_position);
    
    if(bit_set == 0 && j < n)
      Link((m - 1) * n + j, (m - 1) * n + j + 1) = 1;
    endif
    
    bit_position = 4;
    bit_set = bitand(Labyrinth(m, j), bit_position);
    
    if(bit_set == 0)
      Link((m - 1) * n + j, n * m + 1) = 1;
    endif
    
    bit_position = 8;
    bit_set = bitand(Labyrinth(m, j), bit_position);
    
    if(bit_set == 0)
      Link((m - 1) * n + j, (m - 2) * n + j) = 1;
    endif
  endfor

  j = 1;
  
  for i = 1 : m
    bit_position = 1;
    bit_set = bitand(Labyrinth(i, j), bit_position);
    
    if(bit_set == 0)
      Link((i - 1) * n + j, n * m + 2) = 1;
    endif
    
    bit_position = 2;
    bit_set = bitand(Labyrinth(i, j), bit_position);
    
    if(bit_set == 0)
      Link((i - 1) * n + j, (i -1) * n + j + 1) = 1;
    endif
    
    bit_position = 4;
    bit_set = bitand(Labyrinth(i, j), bit_position);
    
    if(bit_set == 0 && i < m)
      Link((i - 1) * n  + j, i * n + j) = 1;
    endif
    
    bit_position = 8;
    bit_set = bitand(Labyrinth(i,j), bit_position);
    
    if(bit_set == 0 && i > 1)
      Link((i - 1) * n  + j, (i - 2) * n + j) = 1;
    endif
  endfor

  j = n;
  
  for i = 1 : m
    bit_position = 1;
    bit_set = bitand(Labyrinth(i, j), bit_position);
    
    if(bit_set == 0)
      Link((i - 1) * n + j, (i -1) * n + j - 1) = 1;
    endif
    
    bit_position = 2;
    bit_set = bitand(Labyrinth(i, j), bit_position);
    
    if(bit_set == 0)
      Link((i - 1) * n + j, n * m + 2) = 1;
    endif
    
    bit_position = 4;
    bit_set = bitand(Labyrinth(i, j), bit_position);
    
    if(bit_set == 0 && i < m)
      Link((i - 1) * n  + j, i * n + j) = 1;
    endif
    
    bit_position = 8;
    bit_set = bitand(Labyrinth(i,j), bit_position);
    
    if(bit_set == 0 && i > 1)
      Link((i - 1) * n  + j, (i - 2) * n + j) = 1;
    endif
  endfor

  Link(m * n + 1, m * n + 1) = 1;
  Link(m * n + 2, m * n + 2) = 1;

  m_Link = m * n + 2;
  n_Link = m * n + 2;

  for i = 1 : m_Link - 2
    contor = 0;
    
    for j = 1 : n_Link
      if (Link(i,j) == 1)
        contor = contor + 1;
      endif
    endfor
    
    for j = 1 : n_Link
      if (Link(i, j) == 1)
        Link(i, j) = 1 / contor;
      endif
    endfor
  endfor

endfunction