function [Labyrinth] = parse_labyrinth(file_path)
	% file_path -> the relative path to a file that needs to
  %              be loaded_graphics_toolkits

  fin = fopen(file_path);
  m = fscanf(fin, "%d", 1);
  n = fscanf(fin, "%d", 1);
  
  Labyrinth = fscanf(fin, "%d", [n, m]);
  Labyrinth =  Labyrinth';
  
  fclose(fin);
endfunction